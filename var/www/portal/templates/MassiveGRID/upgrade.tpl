<style>
    .upgradeArrowRight {
        border: solid #2f343d;
        border-width: 0 3px 3px 0;
        display: inline-block;
        padding: 3px;
        transform: rotate(-45deg);
        -webkit-transform: rotate(-45deg);
    }

    .upgrade-container th {
        color: #fff;
        background-color: #24292e;
        text-align: center;
    }

    .tooltip-inner {
        background-color: #4f5360 !important;
        margin-top: -9% !important;
        max-width: unset;
        width: 267px !important;
    }

    .tooltip.top .tooltip-arrow {
        border-top-color: #4f5360 !important;
        -webkit-transition: all 0.5s ease-in-out;
    }

    .th-toggle-row-btn {
        background-color: transparent;
        color: #fff;
        -webkit-transition: all 0.5s ease-in-out;
    }

    #cpanel-rows-hide-btn, #cpanel-rows-show-btn {
        -webkit-transition: all 0.5s ease-in-out;
    }

    .irs-grid-text {
        color: #2f343d !important;
        font-size: 0.7em !important;
    }
</style>

        {if $overdueinvoice}
            {include file="$template/includes/alert.tpl" type="warning" msg="{lang key='upgradeerroroverdueinvoice'}"}
        {elseif $existingupgradeinvoice}
            {include file="$template/includes/alert.tpl" type="warning" msg="{lang key='upgradeexistingupgradeinvoice'}"}
        {elseif $upgradenotavailable}
            {include file="$template/includes/alert.tpl" type="warning" msg="{lang key='upgradeNotPossible'}" textcenter=true}
        {/if}

        {if $overdueinvoice}

            <p>
                <a href="clientarea.php?action=productdetails&id={$id}" class="btn btn-default">{lang key='clientareabacklink'}</a>
            </p>

        {elseif $existingupgradeinvoice}

            <p>
                <a href="clientarea.php?action=productdetails&id={$id}" class="btn btn-default btn-lg">{lang key='clientareabacklink'}</a>
                <a href="submitticket.php" class="btn btn-default btn-lg">{lang key='submitticketdescription'}</a>
            </p>

        {elseif $upgradenotavailable}

            <p>
                <a href="clientarea.php?action=productdetails&id={$id}" class="btn btn-default btn-lg">{lang key='clientareabacklink'}</a>
                <a href="submitticket.php" class="btn btn-default btn-lg">{lang key='submitticketdescription'}</a>
            </p>

        {else}

            {if $type eq "package"}

                <p>{lang key='upgradechoosepackage'}</p>

                <p>{lang key='upgradecurrentconfig'}:<br/><strong>{$groupname} - {$productname}</strong>{if $domain} ({$domain}){/if}</p>

                <p>{lang key='upgradenewconfig'}:</p>

                <table class="table table-striped">
                    {foreach $upgradepackages as $upgradepackage}
                        <tr>
                            <td>
                                <strong>
                                    {$upgradepackage.groupname} - {$upgradepackage.name}
                                </strong>
                                <br />
                                {$upgradepackage.description}
                            </td>
                            <td width="300" class="text-center">
                                <form method="post" action="{$smarty.server.PHP_SELF}">
                                    <input type="hidden" name="step" value="2">
                                    <input type="hidden" name="type" value="{$type}">
                                    <input type="hidden" name="id" value="{$id}">
                                    <input type="hidden" name="pid" value="{$upgradepackage.pid}">
                                    <div class="form-group">
                                        {if $upgradepackage.pricing.type eq "free"}
                                            {lang key='orderfree'}<br />
                                            <input type="hidden" name="billingcycle" value="free">
                                        {elseif $upgradepackage.pricing.type eq "onetime"}
                                            {$upgradepackage.pricing.onetime} {lang key='orderpaymenttermonetime'}
                                            <input type="hidden" name="billingcycle" value="onetime">
                                        {elseif $upgradepackage.pricing.type eq "recurring"}
                                            <select name="billingcycle" class="form-control custom-select">
                                                {if $upgradepackage.pricing.monthly}<option value="monthly">{$upgradepackage.pricing.monthly}</option>{/if}
                                                {if $upgradepackage.pricing.quarterly}<option value="quarterly">{$upgradepackage.pricing.quarterly}</option>{/if}
                                                {if $upgradepackage.pricing.semiannually}<option value="semiannually">{$upgradepackage.pricing.semiannually}</option>{/if}
                                                {if $upgradepackage.pricing.annually}<option value="annually">{$upgradepackage.pricing.annually}</option>{/if}
                                                {if $upgradepackage.pricing.biennially}<option value="biennially">{$upgradepackage.pricing.biennially}</option>{/if}
                                                {if $upgradepackage.pricing.triennially}<option value="triennially">{$upgradepackage.pricing.triennially}</option>{/if}
                                            </select>
                                        {/if}
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-block" id="btnUpgradeDowngradeChooseProduct">
                                        {lang key='upgradedowngradechooseproduct'}
                                    </button>
                                </form>
                            </td>
                        </tr>
                    {/foreach}
                </table>

            {elseif $type eq "configoptions"}

                <p>{lang key='upgradechooseconfigoptions'}</p>

                {if $errormessage}
                    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
                {/if}
                <div class="upgrade-container">
                <form method="post" action="{$smarty.server.PHP_SELF}">
                    <input type="hidden" name="step" value="2" />
                    <input type="hidden" name="type" value="{$type}" />
                    <input type="hidden" name="id" value="{$id}" />

                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th></th>
                            <th>{lang key='upgradecurrentconfig'}</th>
                            <th></th>
                            <th>{lang key='upgradenewconfig'}</th>
                        </tr>
                        </thead>
                        <tbody>
                        {foreach $configoptions as $configoption}
                            <tr>
                                {if !in_array($configoption.optionname,['cPanel Accounts','Installatron License','cPanel / WHM License','Softaculous License','cPanel','Softaculous Cloud License'])}
                            <tr class="{$configoption.optionname|lower|replace:' ':''|replace:'(':'-'|replace:')':''}">
                                <td style='text-align:right;width:30%;padding: 11px;'>{$configoption.optionname}
                                    {if isset($array[$configoption.optionname])}
                                        <a href="javascript:void(0);" class="tooltip-qm" data-toggle="tooltip" title="{$array[$configoption.optionname]}">
                                            <span><i class="fas fa-info-circle"></i></span>
                                        </a>
                                    {/if}
                                <td>
                                    {if $configoption.optiontype eq 1 || $configoption.optiontype eq 2}
                                        {$configoption.selectedname}
                                    {elseif $configoption.optiontype eq 3}
                                        {if $configoption.selectedqty}{lang key='yes'}{else}{lang key='no'}{/if}
                                    {elseif $configoption.optiontype eq 4}
                                        {$configoption.selectedqty} x {$configoption.options.0.name}
                                    {/if}
                                </td>
                                <td><i class="far fa-angle-double-right"></i></td>
                                <td>
                                    <div class="form-group">
                                      {if $configoption.optiontype eq 1 || $configoption.optiontype eq 2}
                                        <select name="configoption[{$configoption.id}]">
                                            {foreach key=num item=option from=$configoption.options}
                                                {if $configoption.optionname eq "H/A Disk" || $configoption.optionname eq "Additional H/A Disk Block Storage"}
                                                    {if $option.selected}
                                                        {if $option.required eq "noadditional"}
                                                            {$pool="noadditional"}
                                                        {elseif !$option.required|strstr:"," || $option.required|strstr:"ssd,"}
                                                            {$pool="ssd"|upper}
                                                        {elseif $option.required|strstr:","}
                                                            {$var=","|explode:$option.required}
                                                            {$pool=$var.0|upper}
                                                        {/if}
                                                    {/if}
                                                    {if $option.selected}
                                                        <option value="{$option.id}" selected>{$LANG.upgradenochange}</option>
                                                    {elseif $option.nameonly|strstr:$pool || $pool eq "noadditional"}
                                                        <option value="{$option.id}">{$option.nameonly} {$option.price}</option>
                                                    {/if}
                                                {else}
                                                    {if $option.selected}
                                                        <option value="{$option.id}" selected>{$LANG.upgradenochange}</option>{else}
                                                        <option value="{$option.id}">{$option.nameonly} {$option.price}</option>{/if}
                                                {/if}
                                            {/foreach}
                                        </select>
                                    {elseif $configoption.optiontype eq 3}
                                        <input type="checkbox" name="configoption[{$configoption.id}]"
                                               value="{$configoption.selectedqty}" {if $configoption.selectedqty} checked{/if}>
                                        {$configoption.options.0.name}
                                    {elseif $configoption.optiontype eq 4}
                                    {if !$rangesliderincluded}
                                        <script type="text/javascript" src="{$BASE_PATH_JS}/ion.rangeSlider.min.js"></script>
                                    <link href="{$BASE_PATH_CSS}/ion.rangeSlider.css" rel="stylesheet">
                                    <link href="{$BASE_PATH_CSS}/ion.rangeSlider.skinModern.css" rel="stylesheet">
                                        {assign var='rangesliderincluded' value=true}
                                    {/if}
                                        {* #262918 (Start) - Add Slider bars as way of Input for the Upgrade / Downgrade fields of vCores, RAM, Primary and Additional SSD storage options *}
                                    {if $groupname|in_array:['H/A Cloud Server Frankfurt','H/A Cloud Server London','H/A Cloud Server New York','H/A Cloud Server Singapore','H/A Cloud Servers',
                                    'H/A Dedicated Server Frankfurt','H/A Dedicated Server London','H/A Dedicated Server New York','H/A Dedicated Server Singapore','H/A Cloud Dedicated Servers',
                                    'H/A Private Cloud London','H/A Private Cloud New York','H/A Private Cloud Frankfurt','H/A Private Cloud Singapore','H/A Private Clouds', 'H/A Cloud Servers Marketplace', 'Trading / Forex', 'QuickBooks'
                                    ]}
                                        {* #262916 (Start) - Disable Downgrade for Storage-related configurable options *}
                                        {* {if $configoption.id|in_array:[2825,2878,2884,2890,2848,2896,2906,2916,2926,2934,2941,2948,3141]} *}
										{if $configoption.optionname|strstr:"CPU vCores" || $configoption.optionname|strstr:"RAM" || $configoption.optionname|strstr:"Storage"}
											<input type="text" name="configoption[{$configoption.id}]"
                                                   value="{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}" min="{$configoption.selectedqty}"
                                                   id="inputConfigOption{$configoption.id}" class="form-control"/>
                                                <script>
                                                    var sliderTimeoutId = null;
                                                    var sliderRangeDifference = {$configoption.qtymaximum} - {$configoption.selectedqty};
                                                    // The largest size that looks nice on most screens.
                                                    var sliderStepThreshold = 25;
                                                    // Check if there are too many to display individually.
                                                    var setLargerMarkers = sliderRangeDifference > sliderStepThreshold;

                                            jQuery("#inputConfigOption{$configoption.id}").ionRangeSlider({
												{if $groupname|in_array:['H/A Private Cloud London','H/A Private Cloud New York','H/A Private Cloud Frankfurt','H/A Private Cloud Singapore','H/A Private Clouds']}
                                                     {* TODO: Convert RAM config.option to slider so the above condition reads RAM *}
													 {if $configoption.optionname|strstr:"CPU vCores" || $configoption.optionname|strstr:"RAM" || $configoption.optionname|strstr:"Storage"}
														  min: {$configoption.selectedqty},
													 {/if}
												{else}
													 {if $configoption.optionname|strstr:"Storage"}
														  min: {$configoption.selectedqty},
													 {else}
														  min: {$configoption.qtyminimum},
													 {/if}
												{/if}
												 max: {$configoption.qtymaximum},
                                                grid: true,
                                                {if $configoption.id != 3141 }
                                                    grid_snap: !setLargerMarkers,
                                                {/if}
                                                // #85540 fix for 2024 offer products
                                                {if $configoption.selectedqty == 256 && ($configoption.id == 3183 || $configoption.id == 3189 || $configoption.id == 3218 || $configoption.id == 3212)}
                                                    grid_snap: setLargerMarkers,
                                                {/if}
                                                // #250031 Adjust Quantity Slider values for H/A Cloud Dedicated Servers
                                                // Primary High Availability SSD Storage Config Option
                                                {if $configoption.id|in_array:[2896,2906,2848,2916,3142,3219,3312]}
                                                step: "32",
                                                // Additional High Availability SSD Storage Config Option
                                                {elseif $configoption.id|in_array:[2897,2907,2849,2917,3143,3220,3315]}
                                                step: "128",
                                                // #250031 Adjust Quantity Slider values for H/A Cloud Servers
                                                // Primary High Availability SSD Storage Config Option
                                                {elseif $configoption.id|in_array:[2878,2884,2825,2890,3139,3184,3213]}
                                                step: "32",
                                                {/if}
                                                {if $configoption.id|in_array:[3151,3155]}
                                                step: "2",
                                                {/if}
                                                 // Adjust Max CPU Slider values for Singapore H/A Cloud Servers
                                                {if $productname|in_array:['H/A Cloud Server in Singapore', 'H/A Cloud Server in Singapore v1', 'H/A RedHat Cloud Server in Singapore v1', 'H/A RedHat Cloud Server in Singapore', 'H/A cPanel Cloud Server in Singapore v1', 'H/A cPanel Cloud Server in Singapore', 'H/A Windows Cloud Server in Singapore v1', 'H/A Windows Cloud Server in Singapore', 'H/A Windows Server & MSSQL Cloud Server in Singapore v1', 'H/A Windows Server & MSSQL Cloud Server in Singapore']}
                                                    // Primary High Availability SSD Storage Config Option
                                                    {if ($configoption.id == '3145') || ($configoption.id == '3179') || ($configoption.id == '3149') || ($configoption.id == '3151')}
                                                        max: "20",
                                                    {/if}
                                                {/if}                                                 
                                                // Adjust Max CPU Slider values for Singapore H/A Cloud Dedicated Servers
                                                {if $productname|in_array:['H/A Cloud Dedicated Server Singapore v1 Linux ', 'H/A Cloud Dedicated Server Singapore Linux', 'H/A RedHat Cloud Dedicated Server Singapore v1', 'H/A RedHat Cloud Dedicated Server Singapore', 'H/A Cloud Dedicated Server Singapore cPanel v1', 'H/A Cloud Dedicated Server Singapore cPanel', 'H/A Cloud Dedicated Server Singapore Windows Standard v1', 'H/A Cloud Dedicated Server Singapore Windows Standard', 'H/A Cloud Dedicated Server Singapore Windows Standard & SQL Web Edition v1', 'H/A Cloud Dedicated Server Singapore Windows Standard & SQL Web Edition']}
                                                    // Primary High Availability SSD Storage Config Option
                                                    {if ($configoption.id == '3147') || ($configoption.id == '3174') || ($configoption.id == '3153') || ($configoption.id == '3155')}
                                                        max: "20",
                                                    {/if}
                                                {/if}
                                                  {if $productname|in_array:['H/A Virtual Private Cloud Singapore Intel Xeon E5-2630v4']}
                                                    // Primary High Availability SSD Storage Config Option
                                                    {if ($configoption.id == '2946') || ($configoption.id == '3174') || ($configoption.id == '3153') || ($configoption.id == '3155')}
                                                        max: "20",
                                                    {/if}
                                                {/if}
                                                onChange: function () {
                                                    if (sliderTimeoutId) {
                                                        clearTimeout(sliderTimeoutId);
                                                    }
                                                    sliderTimeoutId = setTimeout(function () {
                                                        sliderTimeoutId = null;
                                                    }, 250);
                                                }
                                            });
                                        </script>
                                    {else}
									{* #283520 - Don't apply downgrade in the licence (set min value on input) *}
									<input type="number" name="configoption[{$configoption.id}]" value="{$configoption.selectedqty}" min="{$configoption.selectedqty}" size="5">
									{if $groupname|in_array:['H/A Private Cloud London','H/A Private Cloud New York','H/A Private Cloud Frankfurt','H/A Private Cloud Singapore','H/A Private Clouds']} x licenses{/if}
                                    {/if}
                                    {/if}
                                        {* #262918 (End) - Add Slider bars as way of Input for the Upgrade / Downgrade fields of vCores, RAM, Primary and Additional SSD storage options *}
                                    {/if}                                </td>
                            </tr>
                        {/if}                        
                        {/foreach}
                        </tbody>
                    </table>

                    <p class="text-center">
                        <button type="submit" class="btn btn-primary">
                            {lang key='continue'} <i class="fas fa-arrow-right"></i>
                        </button>
                    </p>

                </form>
                </div>

                 {* #262911 automatically enabled / disable configurable option rows based on compatibility in non-private cloud products, in client area Upgrade / Downgrade page *}
        {if $groupname|in_array:['H/A Cloud Server Frankfurt','H/A Cloud Server London','H/A Cloud Server New York','H/A Cloud Server Singapore','H/A Cloud Servers', 'H/A Cloud Servers Marketplace', 'H/A Dedicated Server Frankfurt',
        'H/A Dedicated Server London','H/A Dedicated Server New York','H/A Dedicated Server Singapore','H/A Cloud Dedicated Servers','Trading / Forex', 'QuickBooks']}
            {include file="templates/$template/includes/upgrade_custom.tpl"}
        {/if}
        {* #264315 Upgrade/ Downgrade UI modernization for Private Cloud Services *}
        {if $groupname|in_array:['H/A Private Cloud London','H/A Private Cloud New York','H/A Private Cloud Frankfurt','H/A Private Cloud Singapore','H/A Private Clouds']}
            {include file="templates/$template/includes/upgrade_custom_UI_vpc.tpl"}
        {/if}
        <script>
            $(document).ready(function () {
                // Modernize Arrows between Current and New Configuration column cells.
                $('tr td:contains("=>")').addClass('arrowCell');
                $('.arrowCell').html('<i class="upgradeArrowRight"></i>');
                // #262906 Hide input fields when there is no other upgrade / downgrade option available.
                // Assign variable to get the length of available dropdown options
                var length = $('select').children('option').length;
                $("select").each(function () {
                    //If there is no option.
                    if (length <= 0) {
                        // Do not display the row.
                        $(this).parent().parent().css('display', 'none');
                    }
                    // If there is just one option.
                    else if (length === 1) {
                        // If that one option is 'No Change'.
                        if ($('select option:contains("No Change")')) {
                            // Do not display the row.
                            $(this).parent().parent().css('display', 'none');
                        }
                    }
                });
            });
            //Hide Operation System selection
            $('tr.linuxautoinstalledoperatingsystem').css('display', 'none'); // 286190
            $('tr.chooseoperatingsystem').css('display', 'none'); // 286190

            // Set the value in a hidden input instead of relying on the removed select
$('<input>').attr({
  type: 'hidden',
  name: 'configoption[3233]',
  value: '8025540'
}).appendTo('form');

// Now it's safe to remove the dropdowns
$('select[name="configoption[832]"], select[name="configoption[3157]"], select[name="configoption[3159]"], select[name="configoption[3160]"], select[name="configoption[3233]"], select[name="configoption[3234]"], select[name="configoption[3287]"] , select[name="configoption[3288]"] , select[name="configoption[3322]"] , select[name="configoption[3288]"]')
  .parent().parent().remove();

            //IP Addresses select-tab for all countries and packages
            $('tr.ipaddresses select').find('option:selected').prevAll().remove(); // 286190
            //$('select[name="configoption[1923]"], select[name="configoption[1645]"], select[name="configoption[1938]"], select[name="configoption[1953]"], select[name="configoption[1908], select[name="configoption[2927]"], select[name="configoption[2850]"], select[name="configoption[2935]"], select[name="configoption[2942]"], select[name="configoption[2949]"], select[name="configoption[2898]"], select[name="configoption[2908]"], select[name="configoption[2918]"], select[name="configoption[2826]"], select[name="configoption[2879]"], select[name="configoption[2885]"], select[name="configoption[2891]"], select[name="configoption[1215]"], select[name="configoption[1352]"], select[name="configoption[1261]"], select[name="configoption[1345]"], select[name="configoption[1713]"], select[name="configoption[1611]"], select[name="configoption[1664]"], select[name="configoption[1730]"], select[name="configoption[1628]"], select[name="configoption[1681]"], select[name="configoption[1796]"], select[name="configoption[1873]"]').find('option:selected').prevAll().remove();
            //Disable RAM Downgrade options
            $('td:contains("RAM") select').find('option:selected').prevAll().remove(); // 286190
            //$('select[name="configoption[2933]"]').find('option:selected').prevAll().remove();
            //Disable Internet Traffic Downgrade options
            $('td:contains("Internet Traffic") select').find('option:selected').prevAll().remove(); // 286190
            //$('select[name="configoption[2909]"]').find('option:selected').prevAll().remove();
			//Disable License Downgrade options - #283520
			$('tr.cpanellicense select').find('option:selected').prevAll().remove();
			$('td:contains("License") select').find('option:selected').prevAll().remove();
            //H-A Disk select-tab for all countries and packages
            $('select[name="configoption[1207]"], select[name="configoption[1419]"], select[name="configoption[1241]"], select[name="configoption[1365]"], select[name="configoption[1223]"], select[name="configoption[1424]"], select[name="configoption[1264]"], select[name="configoption[1370]"], select[name="configoption[1228]"], select[name="configoption[1429]"], select[name="configoption[1269]"], select[name="configoption[1375]"], select[name="configoption[1233]"], select[name="configoption[1434]"], select[name="configoption[1274]"], select[name="configoption[1380]"], select[name="configoption[1711]"], select[name="configoption[1609]"], select[name="configoption[1662]"], select[name="configoption[1241]"], select[name="configoption[1728]"], select[name="configoption[1626]"], select[name="configoption[1679]"], select[name="configoption[1794]"], select[name="configoption[1871]"], select[name="configoption[2781]"]').find('option:selected').prevAll().remove();
            //Alert popup-window - H/A Disk select-tab for all countries and packages
            $('select[name="configoption[1207]"], select[name="configoption[1419]"], select[name="configoption[1241]"], select[name="configoption[1365]"], select[name="configoption[1223]"], select[name="configoption[1424]"], select[name="configoption[1264]"], select[name="configoption[1370]"], select[name="configoption[1228]"], select[name="configoption[1429]"], select[name="configoption[1269]"], select[name="configoption[1375]"], select[name="configoption[1233]"], select[name="configoption[1434]"], select[name="configoption[1274]"], select[name="configoption[1380]"], select[name="configoption[1711]"], select[name="configoption[1609]"], select[name="configoption[1662]"], select[name="configoption[1241]"], select[name="configoption[1728]"], select[name="configoption[1626]"], select[name="configoption[1679]"], select[name="configoption[1794]"], select[name="configoption[1871]"]').on('change', function () {
                alert("Disk Size upgrades instantly upon purchase. Nevertheless, you need to resize Partition from the OS. Depending on the OS of your choice, a reboot might be required.");
            })
            //Alert popup-window - Additional H/A Block Storage select-tab for all countries and packages
            $('select[name="configoption[1216]"], select[name="configoption[1416]"], select[name="configoption[946]"], select[name="configoption[1385]"], select[name="configoption[1362]"], select[name="configoption[1383]"], select[name="configoption[1384]"], select[name="configoption[1712]"], select[name="configoption[1610]"], select[name="configoption[1663]"], select[name="configoption[1872]"]').on('change', function () {
                alert("For managing additional disk(s), upon purchase, please visit Additional Tools > Disks page from Server's Manage GUI through MassiveGRID's Secure Customer Portal. Before downgrade please ensure that the Additional Storage capacity is not in use.");
            })
            //Alert popup-window - Microsoft Window and SQL select-tabs for all countriew and packages
            $('select[name="configoption[1211]"], select[name="configoption[1212]"], select[name="configoption[1224]"], select[name="configoption[1225]"], select[name="configoption[1229]"], select[name="configoption[1230]"], select[name="configoption[1234]"], select[name="configoption[1235]"], select[name="configoption[1420]"], select[name="configoption[1421]"], select[name="configoption[1425]"], select[name="configoption[1426]"], select[name="configoption[1430]"], select[name="configoption[1431]"], select[name="configoption[1435]"], select[name="configoption[1436]"], select[name="configoption[1242]"], select[name="configoption[1243]"], select[name="configoption[1265]"], select[name="configoption[1266]"], select[name="configoption[1270]"], select[name="configoption[1271]"], select[name="configoption[1275]"], select[name="configoption[1276]"], select[name="configoption[1366]"], select[name="configoption[1367]"], select[name="configoption[1371]"], select[name="configoption[1372]"], select[name="configoption[1376]"], select[name="configoption[1377]"], select[name="configoption[1381]"], select[name="configoption[1382]"]').on('change', function () {
                alert("After you complete the associated purchase, please submit a ticket to Support Dept. in order for your licence modification to be scheduled.");
            })
            //Alert popup-window - CPU select-tab for all countries and packages
            $('select[name="configoption[1205]"], select[name="configoption[1707]"], select[name="configoption[1417]"], select[name="configoption[1605]"], select[name="configoption[1658]"] select[name="configoption[1239]"], select[name="configoption[1363]"], select[name="configoption[1221]"], select[name="configoption[1422]"], select[name="configoption[1262]"], select[name="configoption[1368]"], select[name="configoption[1226]"], select[name="configoption[1427]"], select[name="configoption[1267]"], select[name="configoption[1373]"], select[name="configoption[1231]"], select[name="configoption[1432]"], select[name="configoption[1272]"], select[name="configoption[1378]"], select[name="configoption[1658]"], select[name="configoption[1724]"], select[name="configoption[1622]"], select[name="configoption[1675]"], select[name="configoption[1790]"], select[name="configoption[1867]"]').on('change', function () {
                alert("For CPU Cores upgrade/downgrade, upon purchase, please manually proceed with server shutdown and boot again (not reboot).")
            })
            //Alert popup-window - CPU for VIRTUAL PRIVATE CLOUDS
            $('select[name="configoption[1917]"], select[name="configoption[1902]"], select[name="configoption[1932]"], select[name="configoption[1947]"]').on('change', function () {
                alert("CPU vCores upgrade/downgrade: resources will be updated instantly, after purchase. You can manage new resources from your Virtual Private Cloud's Manage Product Page. In case of downgrade, please ensure you are not using additional resources; this might cause downtime of your services.")
            })
            //Alert popup-window - RAM for VIRTUAL PRIVATE CLOUDS
            $('select[name="configoption[1920]"], select[name="configoption[1905]"], select[name="configoption[1935]"], select[name="configoption[1950]"]').on('change', function () {
                alert("RAM ECC Registered upgrade/downgrade: resources will be updated instantly, after purchase. You can manage new resources from your Virtual Private Cloud's Manage Product Page. In case of downgrade, please ensure you are not using additional resources; this might cause downtime of your services.")
            })
            //Alert popup-window - H/A Disk for VIRTUAL PRIVATE CLOUDS
            $('select[name="configoption[1922]"], select[name="configoption[1907]"], select[name="configoption[1937]"], select[name="configoption[1952]"]').on('change', function () {
                alert("H/A Disk upgrade/downgrade: resources will be updated instantly, after purchase. You can manage new resources from your Virtual Private Cloud's Manage Product Page. In case of downgrade, please ensure you are not using additional resources; this might cause downtime of your services.")
            })
            //Alert popup-window - Internet Speed for VIRTUAL PRIVATE CLOUDS
            $('select[name="configoption[1930]"], select[name="configoption[1915]"], select[name="configoption[1945]"], select[name="configoption[1960]"]').on('change', function () {
                alert("Guaranteed Internet Speed upgrade/downgrade: resources will be updated instantly, after purchase. Changes to Guaranteed Internet Speed apply automatically on Switches & Routers. No actions are required from your side.")
            })
            //Alert popup-window - Internet Traffic for VIRTUAL PRIVATE CLOUDS
            $('select[name="configoption[1925]"], select[name="configoption[1910]"], select[name="configoption[1940]"], select[name="configoption[1955]"]').on('change', function () {
                alert("Guaranteed Internet Traffic upgrade/downgrade: resources will be updated instantly, after purchase. You can monitor available bandwidth at your Virtual Private Cloud's Manage Product Page.")
            })
            //Alert popup-window - IP Addresses for VIRTUAL PRIVATE CLOUDS
            $('select[name="configoption[1923]"], select[name="configoption[1645]"], select[name="configoption[1938]"], select[name="configoption[1953]"], select[name="configoption[1908]"]').on('change', function () {
                alert("IP Addresses upgrade/downgrade: resources will be updated instantly, after purchase. You can manage new resources from your Virtual Private Cloud's Manage Product Page. In case of downgrade, please ensure you are not using additional resources, this might cause downtime of your services.")
            })
            //Alert popup-window - RAM select-tab for all countries and packages
            $('select[name="configoption[1206]"], select[name="configoption[1418]"], select[name="configoption[1240]"], select[name="configoption[1364]"], select[name="configoption[1222]"], select[name="configoption[1423]"], select[name="configoption[1263]"], select[name="configoption[1369]"], select[name="configoption[1227]"], select[name="configoption[1428]"], select[name="configoption[1268]"], select[name="configoption[1374]"], select[name="configoption[1232]"], select[name="configoption[1433]"], select[name="configoption[1273]"], select[name="configoption[1379]"], select[name="configoption[1710]"], select[name="configoption[1608]"], select[name="configoption[1661]"], select[name="configoption[1240]"], select[name="configoption[1727]"], select[name="configoption[1625]"], select[name="configoption[1678]"], select[name="configoption[1793]"], select[name="configoption[1870]"]').on('change', function () {
                alert("For RAM upgrade/downgrade, upon purchase, please manually proceed with server shutdown and boot again (not reboot).")
            })
            //Alert popup-window - Internet Traffic for all countries
            $('select[name="configoption[1717]"], select[name="configoption[1615]"], select[name="configoption[1668]"], select[name="configoption[1260]"], select[name="configoption[1734]"], select[name="configoption[1632]"], select[name="configoption[1685]"], select[name="configoption[1800]"], select[name="configoption[1877]"]').on('change', function () {
                alert("Guaranty Internet Traffic applies automatically to Hosting Infrastructure Routers. Can be monitored at 'Resource Usage' tab at the product's Manage Page.")
            })
            //Alert popup-window - IP Addresses for all countries
            $('select[name="configoption[1713]"], select[name="configoption[1611]"], select[name="configoption[1664]"], select[name="configoption[1261]"], select[name="configoption[1730]"], select[name="configoption[1628]"], select[name="configoption[1681]"], select[name="configoption[1796]"], select[name="configoption[1873]"]').on('change', function () {
                alert("Extra IP addresses are available instantly after purchase. They are located at the product's Manage Page. Manual configuration of the IP addresses in the OS is required.")
            })
            {* PROXMOX VPS *}
            // Tooltip for CPU Cores
            $('input[name="configoption[3147]"], input[name="configoption[3145]"], input[name="configoption[2823]"], input[name="configoption[2846]"], input[name="configoption[2876]"], input[name="configoption[2894]"], input[name="configoption[2882]"], input[name="configoption[2904]"], input[name="configoption[2888]"], input[name="configoption[2914]"], input[name="configoption[3187]"], input[name="configoption[3194]"], input[name="configoption[3216]"], input[name="configoption[3223]"]').parent().parent().find('td:first-child').append(' <a href="javascript:void(0);" class="tooltip-qm" id="cpu-tooltip" data-toggle="tooltip" title="" data-original-title="For CPU Cores upgrade/downgrade, upon purchase, please manually proceed with server shutdown and boot again (not reboot)."><span><i class="fas fa-info-circle"></i></span></a>');
            // Tooltip for RAM
            $('input[name="configoption[3141]"], input[name="configoption[3138]"], input[name="configoption[2824]"], input[name="configoption[2847]"], input[name="configoption[2877]"], input[name="configoption[2895]"], input[name="configoption[2883]"], input[name="configoption[2905]"], input[name="configoption[2889]"], input[name="configoption[2915]"],input[name="configoption[3183]"], input[name="configoption[3189]"], input[name="configoption[3212]"], input[name="configoption[3218]"]').parent().parent().find('td:first-child').append(' <a href="javascript:void(0);" class="tooltip-qm" id="ram-tooltip" data-toggle="tooltip" title="" data-original-title="For RAM upgrade/downgrade, upon purchase, please manually proceed with server shutdown and boot again (not reboot)."><span><i class="fas fa-info-circle"></i></span></a>');
            // Tooltip for H/A Disk
            $('input[name="configoption[3142]"], input[name="configoption[3139]"], input[name="configoption[2825]"], input[name="configoption[2848]"], input[name="configoption[2878]"], input[name="configoption[2896]"], input[name="configoption[2884]"], input[name="configoption[2906]"], input[name="configoption[2890]"], input[name="configoption[2916]"], input[name="configoption[3184]"], input[name="configoption[3190]"], input[name="configoption[3213]"], input[name="configoption[3219]"]').parent().parent().find('td:first-child').append(' <a href="javascript:void(0);" class="tooltip-qm" id="disk-tooltip" data-toggle="tooltip" title="" data-original-title="Disk Size upgrades instantly upon purchase. Nevertheless, you need to resize Partition from the OS. Depending on the OS of your choice, a reboot might be required."><span><i class="fas fa-info-circle"></i></span></a>');
            // Tooltip for Additional H/A Block Storage
            $('input[name="configoption[3143]"], input[name="configoption[2849]"], input[name="configoption[2897]"], input[name="configoption[2907]"], input[name="configoption[2917]"], input[name="configoption[3191]"], input[name="configoption[3220]"]').parent().parent().find('td:first-child').append(' <a href="javascript:void(0);" class="tooltip-qm" id="additional-disk-tooltip" data-toggle="tooltip" title="" data-original-title="For managing additional disk(s), upon purchase, please visit Additional Tools > Disks page from Server\'s Manage GUI through MassiveGRID\'s Secure Customer Portal. Before downgrade please ensure that the Additional Storage capacity is not in use."><span><i class="fas fa-info-circle"></i></span></a>');
            {* PROXMOX CLOUD VPS *}
            // Tooltip for CPU Cores - Virtual Private Clouds
            $('input[name="configoption[2924]"], input[name="configoption[2932]"], input[name="configoption[2939]"], input[name="configoption[2946]"]').parent().parent().find('td:first-child').append(' <a href="javascript:void(0);" class="tooltip-qm" id="cloud-cpu-tooltip" data-toggle="tooltip" title="" data-original-title="CPU vCores upgrade/downgrade: resources will be updated instantly, after purchase. You can manage new resources from your Virtual Private Cloud\'s Manage Product Page. In case of downgrade, please ensure you are not using additional resources; this might cause downtime of your services."><span><i class="fas fa-info-circle"></i></span></a>');
            // Tooltip for H/A Disk - Virtual Private Clouds
            $('input[name="configoption[2926]"], input[name="configoption[2934]"], input[name="configoption[2941]"], input[name="configoption[2948]"]').parent().parent().find('td:first-child').append(' <a href="javascript:void(0);" class="tooltip-qm" id="cloud-disk-tooltip" data-toggle="tooltip" title="" data-original-title="H/A Disk upgrade/downgrade: resources will be updated instantly, after purchase. You can manage new resources from your Virtual Private Cloud\'s Manage Product Page. In case of downgrade, please ensure you are not using additional resources; this might cause downtime of your services."><span><i class="fas fa-info-circle"></i></span></a>');

            {$array = [
                'Xeon E5-2630v4 CPU vCores'                     => 'MassiveGRID only uses state-of-the-art Intel XEON class processors. CPU cores are 100% dedicated on each customer, so our customers never experience service degradation due to resource sharing.',
                'RAM DDR4 ECC Registered (GB)'                  => 'Datacenter grade & state-of-the-art high-speed RAM memory, which is 100% dedicated to avoid service degradation due to resource sharing.',
                'Primary High Availability SSD Storage (GB)'    => 'All our storage options, are ultra fast, state-of-the-art SSD disk with High Availability, in a triple replicated configuration, in order to guarantee data integrity. Each customer is allowed to order from a variety of options, in terms of SSD capacity and divide it into a number of disk.',
                'Additional High Availability SSD Storage (GB)' => 'Additional ultra fast, state-of-the-art SSD storage with High Availability, in a triple replicated & self-healing configuration in order to guarantee data integrity.Additional storage can be split, according to customer needs.',
                'Guaranteed Internet Speed'                     => 'Ultra fast Internet connections from Tier 1 Internet Providers with redundancy and zero congestion.',
                'Guaranteed Internet Traffic'                   => 'If you reach your monthly traffic threshold , we will not stop traffic, we will just downgrade port speed and give you the option to get additional traffic.',
                'IP Addresses'                                  => 'A number of IP addresses is offered by default, according to your package. You can order additional IP addresses.',
                'DDoS Protection'                               => 'Increased security against attacks through DDoS offering, which predicts and detects malicious attacks, alerting customers and quickly re-routing traffic to defend their critical data infrastructures.',
                'Support Packages'                              => 'A wide range of support packages to choose from, from minimum-level support, up to heavy-technical support with instant engagement through a dedicated support team per customer.',
                'Xeon E5-2683v4 CPU vCores'                     => 'State-of-the-art, latest technology Intel XEON processors. vCores are 100% dedicated to avoid service degradation due to resource sharing.',
                'High Availability SSD Storage (GB)'            => 'Ultra fast, state-of-the-art SSD storage with High Availability, in a triple replicated & self-healing configuration, in order to guarantee data integrity.',
                'RAM DDR4 ECC Registered (GB)'                  => 'Datacenter grade & state-of-the-art high-speed RAM memory, which is 100% dedicated to avoid service degradation due to resource sharing.'
            ]}
        </script>
    
            {/if}
        {/if}
