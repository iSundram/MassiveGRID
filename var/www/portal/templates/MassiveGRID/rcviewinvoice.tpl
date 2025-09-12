<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$companyname} - {$pagetitle}</title>

    <!-- Bootstrap -->
    <link href="{$BASE_PATH_CSS}/bootstrap.min.css" rel="stylesheet">
    <link href="{$BASE_PATH_CSS}/fontawesome-all.min.css" rel="stylesheet">

    <!-- Styling -->
    <link href="templates/{$template}/css/overrides.css" rel="stylesheet">
    <link href="templates/{$template}/css/styles.css" rel="stylesheet">
    <link href="templates/{$template}/css/invoice.css" rel="stylesheet">

</head>
<body>

    <div class="container-fluid invoice-container">

        {if $invalidInvoiceIdRequested}
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>{$LANG.error}</strong></h3>
                </div>
                <div class="panel-body text-center">
                    {$LANG.invoiceserror}
                </div>
            </div>
        {else}

            <div class="row">
                <div class="col-sm-7">
                    {if $RCInvoiceLogo}
                        <a href="{$WEB_ROOT}/index.php"><img src="{$RCInvoiceLogo}" alt="{$companyname}" ></a>
                    {else}
                        {if $logo}
                            <p><img src="{$logo}" title="{$companyname}" /></p>
                        {else}
                            <h2>{$companyname}</h2>
                        {/if}
                    {/if}

                    {if $isCreditMemo}
                        <h3>{$creditNotesPageTitle}</h3>
                    {else}
                        <h3>{$pagetitle}</h3>
                    {/if}

                    {if $relatedInvoiceId}
                        <h5>{$relatedPageTitle}</h5>
                    {/if}
                </div>
                <div class="col-sm-5 text-center">
                    <div class="invoice-status">
                        {if $status eq "Unpaid"}
                            <span class="unpaid">{$LANG.invoicesunpaid}</span>
                        {elseif $status eq "Paid"}
                            <span class="paid">{$LANG.invoicespaid}</span>
                        {elseif $status eq "Refunded"}
                            <span class="refunded">{$LANG.invoicesrefunded}</span>
                        {elseif $status eq "Cancelled"}
                            <span class="cancelled">{$LANG.invoicescancelled}</span>
                        {elseif $status eq "Collections"}
                            <span class="collections">{$LANG.invoicescollections}</span>
                        {elseif $status eq "Closed"}
                            <span class="refunded">{$MGLANG->T('creditNotes', 'invoice', 'closedStatus')}</span>
                        {/if}
                    </div>

                    {if $status eq "Unpaid"}
                        <div class="small-text">
                            {$LANG.invoicesdatedue}: {$duedate}
                        </div>
                        <div class="payment-btn-container" align="center">
                            {$paymentbutton}
                        </div>
                    {/if}

                </div>
            </div>
            <hr>
            {if !$isCreditMemo}
                {if $paymentSuccess}
                    {include file="$template/includes/panel.tpl" type="success" headerTitle=$LANG.success bodyContent=$LANG.invoicepaymentsuccessconfirmation bodyTextCenter=true}
                {elseif $pendingReview}
                    {include file="$template/includes/panel.tpl" type="info" headerTitle=$LANG.success bodyContent=$LANG.invoicepaymentpendingreview bodyTextCenter=true}
                {elseif $paymentFailed}
                    {include file="$template/includes/panel.tpl" type="danger" headerTitle=$LANG.error bodyContent=$LANG.invoicepaymentfailedconfirmation bodyTextCenter=true}
                {elseif $offlineReview}
                    {include file="$template/includes/panel.tpl" type="info" headerTitle=$LANG.success bodyContent=$LANG.invoiceofflinepaid bodyTextCenter=true}
                {elseif $pendingSepaReview}
                    {include file="$template/includes/panel.tpl" type="info" headerTitle=$LANG.success bodyContent=$MGLANG->absoluteT('stripeSepa','invoicePayment', 'pendingStatusMessage') bodyTextCenter=true}
                {elseif $sepaStoreDetailsSuccess}
                    {include file="$template/includes/panel.tpl" type="info" headerTitle=$LANG.success bodyContent=$MGLANG->absoluteT('stripeSepa','storeDetails', 'successMessage') bodyTextCenter=true}
                {elseif $sepaStoreDetailsFail}
                    {include file="$template/includes/panel.tpl" type="danger" headerTitle=$LANG.success bodyContent=$MGLANG->absoluteT('stripeSepa','storeDetails', 'failedMessage') bodyTextCenter=true}
                {/if}
            {/if}

            <div class="row">
                <div class="col-sm-6 pull-sm-right text-right-sm">
                    {if !$isCreditMemo}
                        <strong>{$LANG.invoicespayto}:</strong>
                        <address class="small-text">
                            {$payto|nl2br}
                        </address>
                    {/if}
                </div>
                <div class="col-sm-6">
                    {if $isCreditMemo}
                        <strong>{$MGLANG->T('creditNotes', 'invoice', 'deliveredTo')}:</strong><br>
                    {else}
                        <strong>{$LANG.invoicesinvoicedto}:</strong>
                    {/if}
                    <address class="small-text">
                        {if $clientsdetails.companyname}{$clientsdetails.companyname}<br />{/if}
                        {$clientsdetails.firstname} {$clientsdetails.lastname}<br />
                        {$clientsdetails.address1}, {$clientsdetails.address2}<br />
                        {$clientsdetails.city}, {$clientsdetails.state}, {$clientsdetails.postcode}<br />
                        {$clientsdetails.country}
                        {if $customfields}
                            <br /><br />
                            {foreach from=$customfields item=customfield}
                            {$customfield.fieldname}: {$customfield.value}<br />
                            {/foreach}
                        {/if}
                    </address>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    {if !$isCreditMemo}
                        <strong>{$LANG.paymentmethod}:</strong><br>
                        <span class="small-text">
                            {if $status eq "Unpaid" && $allowchangegateway}
                                <form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}" class="form-inline">
                                    {$gatewaydropdown}
                                </form>
                            {else}
                                {$paymentmethod}
                            {/if}
                        </span>
                        <br/><br/>
                    {/if}
                </div>
                <div class="col-sm-6 text-right-sm">
                    {if $isCreditMemo}
                        <strong>{$MGLANG->T('creditNotes', 'invoice', 'dateCreated')}:</strong><br>
                    {else}
                        <strong>{$LANG.invoicesdatecreated}:</strong><br>
                    {/if}
                    <span class="small-text">
                        {$date}<br><br>
                    </span>
                </div>
            </div>

            <br />

            {if $manualapplycredit && !$isCreditMemo}
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title"><strong>{$LANG.invoiceaddcreditapply}</strong></h3>
                    </div>
                    <div class="panel-body">
                        <form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}">
                            <input type="hidden" name="applycredit" value="true" />
                            {$LANG.invoiceaddcreditdesc1} <strong>{$totalcredit}</strong>. {$LANG.invoiceaddcreditdesc2}. {$LANG.invoiceaddcreditamount}:
                            <div class="row">
                                <div class="col-xs-8 col-xs-offset-2 col-sm-4 col-sm-offset-4">
                                    <div class="input-group">
                                        <input type="text" name="creditamount" value="{$creditamount}" class="form-control" />
                                        <span class="input-group-btn">
                                            <input type="submit" value="{$LANG.invoiceaddcreditapply}" class="btn btn-success" />
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            {/if}

            {if $allowCreditPayment && !$isCreditMemo}
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title"><strong>{$LANG.invoiceaddcreditapply}</strong></h3>
                    </div>
                    <div class="panel-body">
                        <form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}">
                            <input type="hidden" name="applycredit" value="true" />
                            {$LANG.invoiceaddcreditdesc1} <strong>{$totalcredit}</strong>. {$LANG.invoiceaddcreditdesc2}. {$LANG.invoiceaddcreditamount}:
                            <div class="row">
                                <div class="col-xs-8 col-xs-offset-2 col-sm-4 col-sm-offset-4">
                                    <div class="input-group">
                                        <input type="text" name="creditamount" value="{$creditamount}" class="form-control" />
                                        <span class="input-group-btn">
                                            <input type="submit" value="{$LANG.invoiceaddcreditapply}" class="btn btn-success" />
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            {/if}

            {if $notes}
                {include file="$template/includes/panel.tpl" type="info" headerTitle=$LANG.invoicesnotes bodyContent=$notes}
            {/if}

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>{$LANG.invoicelineitems}</strong></h3>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-condensed">
                            <thead>
                                <tr>
                                    <td><strong>{$LANG.invoicesdescription}</strong></td>
                                    <td width="20%" class="text-center"><strong>{$LANG.invoicesamount}</strong></td>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$invoiceitems item=item}
                                    <tr>
                                        <td>{$item.description}{if $item.taxed} *{/if}</td>
                                        <td class="text-center">{$currency->prefix}{$item.amount}{$currency->suffix}</td>
                                    </tr>
                                {/foreach}
                                <tr>
                                    <td class="total-row text-right"><strong>{$LANG.invoicessubtotal}</strong></td>
                                    <td class="total-row text-center">{$currency->prefix}{$subtotal}{$currency->suffix}</td>
                                </tr>
                                {if $taxname}
                                    <tr>
                                        <td class="total-row text-right"><strong>{$taxrate}% {$taxname}</strong></td>
                                        <td class="total-row text-center">{$currency->prefix}{$tax}{$currency->suffix}</td>
                                    </tr>
                                {/if}
                                {if $taxname2}
                                    <tr>
                                        <td class="total-row text-right"><strong>{$taxrate2}% {$taxname2}</strong></td>
                                        <td class="total-row text-center">{$currency->prefix}{$tax2}{$currency->suffix}</td>
                                    </tr>
                                {/if}
                                <tr>
                                    <td class="total-row text-right"><strong>{$LANG.invoicescredit}</strong></td>
                                    <td class="total-row text-center">{$currency->prefix}{$credit}{$currency->suffix}</td>
                                </tr>
                                <tr>
                                    <td class="total-row text-right"><strong>{$LANG.invoicestotal}</strong></td>
                                    <td class="total-row text-center">{$currency->prefix}{$total}{$currency->suffix}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            {if $taxrate}
                <p>* {$LANG.invoicestaxindicator}</p>
            {/if}

            {if !$isCreditMemo}
                <div class="transactions-container small-text">
                    <div class="table-responsive">
                        <table class="table table-condensed">
                            <thead>
                            <tr>
                                <td class="text-center"><strong>{$LANG.invoicestransdate}</strong></td>
                                <td class="text-center"><strong>{$LANG.invoicestransgateway}</strong></td>
                                <td class="text-center"><strong>{$LANG.invoicestransid}</strong></td>
                                <td class="text-center"><strong>{$LANG.invoicestransamount}</strong></td>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach from=$transactions item=transaction}
                                <tr>
                                    <td class="text-center">{$transaction.date}</td>
                                    <td class="text-center">{$transaction.gateway}</td>
                                    <td class="text-center">{$transaction.transid}</td>
                                    <td class="text-center">{$currency->prefix}{$transaction.amount|string_format:"%.2f"}{$currency->suffix}</td>
                                </tr>
                                {foreachelse}
                                <tr>
                                    <td class="text-center" colspan="4">{$LANG.invoicestransnonefound}</td>
                                </tr>
                            {/foreach}
                            <tr>
                                <td class="text-right" colspan="3"><strong>{$LANG.invoicesbalance}</strong></td>
                                <td class="text-center">{$balance}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            {/if}

            <div>
                <table class="mx-auto mt-5 mb-5">
                    {foreach from=$invoiceFooterTextLines item=invoiceFooterTextLine}
                        <tr class="border-bottom" style="font-size: 1.3rem">
                            {foreach from=$invoiceFooterTextLine item=item}
                                <td class="px-5">{$item}</td>
                            {/foreach}
                        </tr>
                    {/foreach}
                </table>
            </div>

            <div class="pull-right btn-group btn-group-sm hidden-print">
                <a href="javascript:window.print()" class="btn btn-default"><i class="fa fa-print"></i> {$LANG.print}</a>
                <a href="dl.php?type=i&amp;id={$invoiceid}" class="btn btn-default"><i class="fa fa-download"></i> {$LANG.invoicesdownload}</a>
            </div>

        {/if}

    </div>

    <p class="text-center hidden-print"><a href="clientarea.php">{$LANG.invoicesbacktoclientarea}</a></a></p>

</body>
</html>
