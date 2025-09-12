<?php

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * Resellers Center Integration
 */
use MGModule\ResellersCenter\repository\whmcs\Invoices;
use MGModule\ResellersCenter\repository\Invoices as RcInvoices;
use MGModule\ResellersCenter\core\helpers\ClientAreaHelper;
use MGModule\ResellersCenter\mgLibs\Helpers\DateFormatter;
use MGModule\ResellersCenter\mgLibs\Lang as MgLang;
use MGModule\ResellersCenter\Helpers\InvoiceFooterTextParser;

global $whmcs;

$activeModules = explode(',', $whmcs->get_config("ActiveAddonModules"));
$invoiceFooterTextLines = [];

if (in_array("ResellersCenter", $activeModules)) {

    //load Resellers Center
    require ROOTDIR.'/modules/addons/ResellersCenter/Loader.php';
    new MGModule\ResellersCenter\Loader();
    MGModule\ResellersCenter\Addon::I();

    $MGLANG = MgLang::getInstance();

    if (!$rcinvoice) {
        $repo = new Invoices();
    } else {
        $repo = new RcInvoices();
    }
    $invoice = $repo->find($invoiceid);

    if ($invoice->client->resellerClient->reseller) {
        //Set Invoice num (pagetitle)
        $invoiceNumber = !empty($invoice->invoicenum) ? $invoice->invoicenum : $invoice->id;

        if ($invoice->type == 'credit-memo') {
            $pagetitle = $creditMemoTitle . " #" . $invoiceNumber;
        } else {
            $pagetitle = $whmcs->get_lang('invoicenumber') . $invoiceNumber;
        }

        //Set reseller logo
        $reseller = $invoice->client->resellerClient->reseller;
        if ($reseller->settings["admin"]["branding"]) {
            //Set Invoice num (pagetitle)
            $invoiceNumber = !empty($invoice->branded->invoicenum) ? $invoice->branded->invoicenum : $invoiceNumber;

            if ($invoice->type == 'credit-memo') {
                $pagetitle = $creditMemoTitle . " #" . $invoiceNumber;
            } else {
                $pagetitle = $whmcs->get_lang('invoicenumber') . $invoiceNumber;
            }

            //Set reseller logo
            $reseller = $invoice->client->resellerClient->reseller;
            if ($reseller->settings["admin"]["branding"]){
                //to make less changes in whole file we will use relative path
                $path = ClientAreaHelper::getLogoPath();
                if ($reseller->settings["private"]["showInvoiceLogo"]) {
                    $logoName = $reseller->settings["private"]["invoiceLogo"];
                } else {
                    $logoName = $reseller->settings["private"]["logo"];
                }
                $customLogo = "../../" . $path . $logoName;
            }
            $customLogo = "../../" . $path . $logoName;
        }

        if ($reseller->settings["private"]["dateFormat"]) {
            $dateFormatter = new DateFormatter();
            $format = $reseller->settings["private"]["dateFormat"];

            $datecreated =  $dateFormatter->format($invoice->date, $format);
            $duedate =  $dateFormatter->format($invoice->duedate, $format);

            foreach ($transactions as &$transaction) {
                $transaction['date'] = $dateFormatter->format($transaction['date'], $format);
            }
        }

        if ($reseller->settings["admin"]["invoiceBranding"]) {
            if ($invoice->type != 'credit-memo') {
                $companyaddress = explode("\n",$reseller->settings["private"]["payto"]);
            }
            $invoiceFooterTextLines = InvoiceFooterTextParser::parseFooterTextToArray($reseller->settings["private"]["invoicefootertext"]);
        }
    }
}


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

# Logo
$logoFilename = 'placeholder.png';
if (file_exists(ROOTDIR . '/assets/img/logo.png')) {
    $logoFilename = 'logo.png';
} elseif (file_exists(ROOTDIR . '/assets/img/logo.jpg')) {
    $logoFilename = 'logo.jpg';
}
# ResellersCenter Logo
if(!empty($customLogo) && is_file(ROOTDIR . '/assets/img/' . $customLogo)) {
    $logoFilename = $customLogo;
}

$pdf->Image(ROOTDIR . '/assets/img/' . $logoFilename, 15, 25, 75);

# Invoice Status
$pdf->SetXY(0, 0);
$pdf->SetFont($pdfFont, 'B', 28);
$pdf->SetTextColor(255);
$pdf->SetLineWidth(0.75);
$pdf->StartTransform();
$pdf->Rotate(-35, 100, 225);
if ($status == 'Draft') {
    $pdf->SetFillColor(200);
    $pdf->SetDrawColor(140);
} elseif ($status == 'Paid') {
    $pdf->SetFillColor(151, 223, 74);
    $pdf->SetDrawColor(110, 192, 70);
} elseif ($status == 'Cancelled') {
    $pdf->SetFillColor(200);
    $pdf->SetDrawColor(140);
} elseif ($status == 'Refunded') {
    $pdf->SetFillColor(131, 182, 218);
    $pdf->SetDrawColor(91, 136, 182);
} elseif ($status == 'Collections') {
    $pdf->SetFillColor(3, 3, 2);
    $pdf->SetDrawColor(127);
} elseif ($status == 'Closed') {
    $pdf->SetFillColor(131, 182, 218);
    $pdf->SetDrawColor(91, 136, 182);
} else {
    $pdf->SetFillColor(223, 85, 74);
    $pdf->SetDrawColor(171, 49, 43);
}
$pdf->Cell(100, 18, strtoupper(Lang::trans('invoices' . strtolower($status))), 'TB', 0, 'C', '1');
$pdf->StopTransform();
$pdf->SetTextColor(0);

# Company Details
$pdf->SetXY(15, 42);
$pdf->SetFont($pdfFont, '', 13);
foreach ($companyaddress as $addressLine) {
    $pdf->Cell(180, 4, trim($addressLine), 0, 1, 'R');
    $pdf->SetFont($pdfFont, '', 9);
}
$pdf->Ln(5);

# Header Bar
$pdf->SetFont($pdfFont, 'B', 15);
$pdf->SetFillColor(239);
$pdf->Cell(0, 8, $pagetitle, 0, 1, 'L', '1');

if ($invoice->memoRelation->exists) {
    $relatedInvoice = $invoice->type == 'credit-memo' ? $invoice->memoRelation->invoice : $invoice->memoRelation->creditMemo;

    $relatedInvoiceTitle = $relatedInvoice->type == 'credit-memo' ? $relatedCreditMemoTitle : $relatedInvoiceTitle;
    $relatedInvoiceTitle .= " #" . (empty($relatedInvoice->invoicenum) ? $relatedInvoice->id : $relatedInvoice->invoicenum);

    $pdf->SetFont($pdfFont, '', 12);
    $pdf->Cell(0, 6, $relatedInvoiceTitle, 0, 1, 'L', '1');
}

$pdf->SetFont($pdfFont, '', 10);
if ($invoice->type == 'credit-memo') {
    $pdf->Cell(0, 6, $MGLANG->absoluteT('creditNotes','invoicePdf', 'creditMemoDate') . ': ' . $datecreated, 0, 1, 'L', '1');
} else {
    $pdf->Cell(0, 6, Lang::trans('invoicesdatecreated') . ': ' . $datecreated, 0, 1, 'L', '1');
    $pdf->Cell(0, 6, Lang::trans('invoicesdatedue') . ': ' . $duedate, 0, 1, 'L', '1');
}
$pdf->Ln(10);

$startpage = $pdf->GetPage();

# Clients Details
$addressypos = $pdf->GetY();
$pdf->SetFont($pdfFont, 'B', 10);
if ($invoice->type == 'credit-memo') {
    $pdf->Cell(0, 4, $MGLANG->absoluteT('creditNotes','invoicePdf', 'deliveredTo'), 0, 1);
} else {
    $pdf->Cell(0, 4, Lang::trans('invoicesinvoicedto'), 0, 1);
}
$pdf->SetFont($pdfFont, '', 9);
if ($clientsdetails["companyname"]) {
    $pdf->Cell(0, 4, $clientsdetails["companyname"], 0, 1, 'L');
    $pdf->Cell(0, 4, Lang::trans('invoicesattn') . ': ' . $clientsdetails["firstname"] . ' ' . $clientsdetails["lastname"], 0, 1, 'L');
} else {
    $pdf->Cell(0, 4, $clientsdetails["firstname"] . " " . $clientsdetails["lastname"], 0, 1, 'L');
}
$pdf->Cell(0, 4, $clientsdetails["address1"], 0, 1, 'L');
if ($clientsdetails["address2"]) {
    $pdf->Cell(0, 4, $clientsdetails["address2"], 0, 1, 'L');
}
$pdf->Cell(0, 4, $clientsdetails["city"] . ", " . $clientsdetails["state"] . ", " . $clientsdetails["postcode"], 0, 1, 'L');
$pdf->Cell(0, 4, $clientsdetails["country"], 0, 1, 'L');
if ($customfields) {
    $pdf->Ln();
    foreach ($customfields as $customfield) {
        $pdf->Cell(0, 4, $customfield['fieldname'] . ': ' . $customfield['value'], 0, 1, 'L');
    }
}
$pdf->Ln(10);

# Invoice Items
$tblhtml = '<table width="100%" bgcolor="#ccc" cellspacing="1" cellpadding="2" border="0">
    <tr height="30" bgcolor="#efefef" style="font-weight:bold;text-align:center;">
        <td width="80%">' . Lang::trans('invoicesdescription') . '</td>
        <td width="20%">' . Lang::trans('quotelinetotal') . '</td>
    </tr>';
foreach ($invoiceitems as $item) {
    $tblhtml .= '
    <tr bgcolor="#fff">
        <td align="left">' . nl2br($item['description']) . '<br /></td>
        <td align="center">' . $item['amount'] . '</td>
    </tr>';
}
$tblhtml .= '
    <tr height="30" bgcolor="#efefef" style="font-weight:bold;">
        <td align="right">' . Lang::trans('invoicessubtotal') . '</td>
        <td align="center">' . $subtotal . '</td>
    </tr>';
if ($taxname) {
    $tblhtml .= '
    <tr height="30" bgcolor="#efefef" style="font-weight:bold;">
        <td align="right">' . $taxrate . '% ' . $taxname . '</td>
        <td align="center">' . $tax . '</td>
    </tr>';
}
if ($taxname2) {
    $tblhtml .= '
    <tr height="30" bgcolor="#efefef" style="font-weight:bold;">
        <td align="right">' . $taxrate2 . '% ' . $taxname2 . '</td>
        <td align="center">' . $tax2 . '</td>
    </tr>';
}
$tblhtml .= '
    <tr height="30" bgcolor="#efefef" style="font-weight:bold;">
        <td align="right">' . Lang::trans('invoicescredit') . '</td>
        <td align="center">' . $credit . '</td>
    </tr>
    <tr height="30" bgcolor="#efefef" style="font-weight:bold;">
        <td align="right">' . Lang::trans('invoicestotal') . '</td>
        <td align="center">' . $total . '</td>
    </tr>
</table>';

$pdf->writeHTML($tblhtml, true, false, false, false, '');

$pdf->Ln(5);

if ($invoice->type != 'credit-memo') {
    # Transactions
    $pdf->SetFont($pdfFont, 'B', 12);
    $pdf->Cell(0, 4, Lang::trans('invoicestransactions'), 0, 1);

    $pdf->Ln(5);

    $pdf->SetFont($pdfFont, '', 9);

    $tblhtml = '<table width="100%" bgcolor="#ccc" cellspacing="1" cellpadding="2" border="0">
        <tr height="30" bgcolor="#efefef" style="font-weight:bold;text-align:center;">
            <td width="25%">' . Lang::trans('invoicestransdate') . '</td>
            <td width="25%">' . Lang::trans('invoicestransgateway') . '</td>
            <td width="30%">' . Lang::trans('invoicestransid') . '</td>
            <td width="20%">' . Lang::trans('invoicestransamount') . '</td>
        </tr>';

    if (!count($transactions)) {
        $tblhtml .= '
        <tr bgcolor="#fff">
            <td colspan="4" align="center">' . Lang::trans('invoicestransnonefound') . '</td>
        </tr>';
    } else {
        foreach ($transactions AS $trans) {
            $tblhtml .= '
            <tr bgcolor="#fff">
                <td align="center">' . $trans['date'] . '</td>
                <td align="center">' . $trans['gateway'] . '</td>
                <td align="center">' . $trans['transid'] . '</td>
                <td align="center">' . $trans['amount'] . '</td>
            </tr>';
        }
    }
    $tblhtml .= '
        <tr height="30" bgcolor="#efefef" style="font-weight:bold;">
            <td colspan="3" align="right">' . Lang::trans('invoicesbalance') . '</td>
            <td align="center">' . $balance . '</td>
        </tr>
    </table>';

    $pdf->writeHTML($tblhtml, true, false, false, false, '');
}

# Notes
if ($notes) {
    $pdf->Ln(5);
    $pdf->SetFont($pdfFont, '', 8);
    $pdf->MultiCell(170, 5, Lang::trans('invoicesnotes') . ': ' . $notes);
}

# Footer Text
$pdf->SetFont($pdfFont, 'B', 12);
$pdf->Ln(5);
$pdf->SetFont($pdfFont, '', 9);

$footerHtml = '<table width="100%" cellspacing="1" cellpadding="2">';

    foreach ($invoiceFooterTextLines AS $line) {
    $footerHtml .= '<tr bgcolor="#fff">';
        foreach ($line AS $lineElements) {
        $footerHtml .= '<td align="left">'.$lineElements.'</td>';
        }
        $footerHtml .='</tr>';
    }

    $footerHtml .= '</table>';

$pdf->writeHTML($footerHtml, true, false, false, false, '');


# Generation Date
$pdf->SetFont($pdfFont, '', 8);
$pdf->Ln(5);
$pdf->Cell(180, 4, Lang::trans('invoicepdfgenerated') . ' ' . getTodaysDate(1), '', '', 'C');