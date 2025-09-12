{include file="orderforms/standard_cart/common.tpl"}
<style type="text/css">
    {literal}
    .tooltip-inner {
        padding: 10px;
        color: #fff;
        text-align: left;
        background-color: #4f5360;
        border-radius: 6px;
        font-size: 13px;
        width: 23em;
    }
    .tooltip.top .tooltip-arrow{
        border-top-color: #4f5360;
        margin-left: -5px;
    }
    #order-standard_cart label{
        font-size: 0.85em;
    }
    #order-standard_cart .product-info{
        background-color: #fff;
        border: none;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.08);
    }
    #order-standard_cart .sub-heading span, #order-standard_cart .sub-heading-borderless span{
        display: inline-block;
        position: relative;
        padding: 0px 10px;
        top: -12px;
        font-size: 16px;
        color: #666;
        background-color: #f1f2f7;
        font-weight: 500;
    }
    #order-standard_cart .order-summary h2{
        background-color: #24292e;
        border-top-left-radius: 3px;
        border-top-right-radius: 3px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.08);
    }
    #order-standard_cart .summary-container{
        background-color: #fff;
        border-radius:0;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.08);
    }
    #order-standard_cart .order-summary{
        background-color: #24292e;
        border-bottom: 3px solid #24292e;
    }
    {/literal}
</style>
<script>
var _localLang = {
    'addToCart': '{$LANG.orderForm.addToCart|escape}',
    'addedToCartRemove': '{$LANG.orderForm.addedToCartRemove|escape}'
}
</script>
{$array = [
'Choose Operating System' => 'Most common OS pre-defined parameters will be used by choosing Auto installation ISO. Choose Manual installation ISO if you wish to set the OS parameters yourself.',
'CPU' => 'State-of-the-art, latest technology Intel XEON processors. vCores are 100% dedicated to avoid service degradation due to resource sharing.',
'Xeon E5-2683v4 CPU vCores' => 'State-of-the-art, latest technology Intel XEON processors. vCores are 100% dedicated to avoid service degradation due to resource sharing.',
'Xeon Gold 6130 CPU vCores' => 'State-of-the-art, latest technology Intel XEON processors. vCores are 100% dedicated to avoid service degradation due to resource sharing.',
'Xeon E5-2630v4 CPU vCores' => 'State-of-the-art, latest technology Intel XEON processors. vCores are 100% dedicated to avoid service degradation due to resource sharing.',
'Shared Intel Xeon CPU vCores' => 'Flexible, cost-effective Cloud Servers: Shared resources with robust performance for scalability and efficiency.',
'RAM DDR4 ECC Registered (GB)' => 'Datacenter grade & state-of-the-art high-speed RAM memory, which is 100% dedicated to avoid service degradation due to resource sharing.',
'Primary High Availability SSD Storage (GB)' => 'Ultra fast, state-of-the-art SSD storage with High Availability, in a triple replicated & self-healing configuration, in order to guarantee data integrity.',
'Additional High Availability SSD Storage (GB)' => 'Additional ultra fast, state-of-the-art SSD storage with High Availability, in a triple replicated & self-healing configuration in order to guarantee data integrity.Additional storage can be split, according to customer needs.',
'Cores' => 'MassiveGRID only uses state-of-the-art Intel XEON class processors. CPU cores are 100% dedicated on each customer, so our customers never experience service degradation due to resource sharing.',
'ISO Image' => 'Auto installation ISO gives you the possibility to have the OS of your choice automatically installed on your machine, using the most common pre-defined parameters. Manual installation ISO give you the possibility to install the OS according to your needs.',
'RAM ECC Registered' => 'Datacenter grade & state-of-the-art high-speed RAM memory, which is 100% dedicated to avoid service degradation due to resource sharing.',
'Guaranteed Internet Speed' => 'Ultra fast Internet connections from Tier 1 Internet Providers with redundancy and zero congestion.',
'Guaranteed Internet Traffic' => 'If you reach your monthly traffic threshold , we will not stop traffic, we will just downgrade port speed and give you the option to get additional traffic.',
'Primary Disk' => 'All our storage options, are ultra fast, state-of-the-art SSD disk with High Availability, in a triple replicated configuration, in order to guarantee data integrity. Each customer is allowed to order from a variety of options, in terms of SSD capacity and divide it into a number of disk.',
'IP Addresses' => 'A number of IP addresses is offered by default, according to your package. You can order additional IP addresses.',
'Microsoft Windows License' => 'In case you prefer Windows over Linux, we offer you the possibility to buy your license from MassiveGRID. Just choose the type of license you prefer.',
'Microsoft SQL License' => 'In case you prefer Windows SQL over mySQL, we offer you the possibility to buy your license from MassiveGRID Just choose the type of license that suits your application needs.',
'cPanel VPS Optimized' => 'Easy to use web-based control panel, which offers efficient site management, using simple, point-and-click software.',
'Softaculous VPS License' => 'Softaculous is the leading Auto Installer for cPanel and offers hundreds of scripts, which are all installed in just one step.',
'CloudLinux License' => 'Using cPanel with CloudLinux provides hosting companies and data centers with the only commercially-supported Linux OS optimized for their needs, ensuring spikes in resource usage won’t take down an entire server.',
'Installatron VPS License' => 'Installatron is a cPanel plugin that offers comprehensive and easy-to-use web application automation features.',
'Support Packages' => 'A wide range of support packages to choose from, from minimum-level support, up to heavy-technical support with instant engagement through a dedicated support team per customer.',
'Storage' => 'All our storage options, are ultra fast, state-of-the-art SSD disks with High Availability, in a triple replicated configuration, in order to guarantee data integrity. Each customer is allowed to order from a variety of options, in terms of SSD capacity and divide it into a number of disks.',
'cPanel / WHM License' => 'Easy to use web-based control panel, which offers efficient site management, using simple, point-and-click software. Please note that 2 extra IPs are required, in case you want to setup a nameserver in cPanel & WHM.',
'Softaculous License' => 'Softaculous is the leading Auto Installer for cPanel and offers hundreds of scripts, which are all installed in just one step.',
'Installatron License' => 'Installatron is a cPanel plugin that offers comprehensive and easy-to-use web application automation features.',
'Choose Billing Cycle' => 'You can either pay on a monthly basis, or pay on a quarterly, semi-annually, annually, biennially, triennially basis and benefit from an additional discount rate.',
'H/A Disk' => 'Ultra fast, state-of-the-art SSD storage with High Availability, in a triple replicated & self-healing configuration, in order to guarantee data integrity.',
'Additional H/A Block Storage' => 'All our storage options, are ultra fast, state-of-the-art SSD disks with High Availability, in a triple replicated configuration, in order to guarantee data integrity. Each customer is allowed to order from a variety of options, in terms of SSD capacity and divide it into a number of disks.',
'Increase 128GB H/A SSD Storage by:' => 'All our storage options, are ultra fast, state-of-the-art SSD disks with High Availability, in a triple replicated configuration, in order to guarantee data integrity. Each customer is allowed to order from a variety of options, in terms of SSD capacity and divide it into a number of disks.',
'Windows Server 2012 R2 Standard Edition' => 'In case you prefer Windows over Linux, we offer you the possibility to buy your license from MassiveGRID. Just choose the type of license you prefer.',
'Microsoft SQL 2014 SP2 Server Standard Edition' => 'In case you prefer Windows SQL over mySQL, we offer you the possibility to buy your license from MassiveGRID Just choose the type of license that suits your application needs.',
'Microsoft SQL 2016 Server Standard Edition' => 'In case you prefer Windows SQL over mySQL, we offer you the possibility to buy your license from MassiveGRID. Just choose the type of license that suits your application needs.',
'Size' => 'Please choose the capacity that better suits your backup needs.',
'Server IP' => 'Please type the IP address of your server.',
'Server Port' => 'Please type the server port number that can be found on the relevant tutorial.',
'DDoS Protection' => 'Increased security against attacks through DDoS offering, which predicts and detects malicious attacks, alerting customers and quickly re-routing traffic to defend their critical data infrastructures.',
'Microsoft Windows Licence' => 'Windows Server Standard Edition (Microsoft Windows Server Edition licence is charged monthly, per number of virtual cores. Minimum 8 cores with a 2-core step increase. Please make sure you state the total number of cores you are planning to use. Licensing example: If you use 2 VMs, one with 4 cores and another one with 12 cores and both of them will run under Microsoft Windows Server, you need to buy a licence for a total of 20 cores (The first VM of 4 cores will need the minimum number of licensed cores, which is 8, plus another 12 cores for the second VM, totaling to 20 cores).',
'Microsoft SQL Licence' => 'Microsoft SQL Server Web & Standard Edition (Microsoft SQL Server Web Edition licence is charged monthly, per number of virtual cores. Minimum 4 cores with a 2-core step increase. Please make sure you state the total number of cores you are planning to use. Licensing example: If you use 2 VMs, one with 2 cores and another one with 10 cores and both of them will run SQL Server, you need to buy a licence for a total of 14 cores (The first VM of 2 cores will need the minimum number of licensed SQL cores, which is 4, plus another 10 cores for the second VM, totaling to 14 cores.). This option is not offered with cPanel and SUSE Licenses.',
'MS Windows Server Standard Edition licence' => 'Microsoft Windows Server Standard Edition licence is charged monthly, per number of virtual cores. Minimum 2 cores with a 2-core step increase. Please make sure you state the total number of cores you are planning to use. Licencing example: If you use 2 VMs, one with 4 cores and another one with 12 cores and both of them will run under Microsoft Windows Server, you need to buy a licence for a total of 16 cores. This option is not offered with cPanel and SUSE Licenses.',
'MS Windows Server Datacenter Edition licence' => 'Windows Server Datacenter Edition (Microsoft Windows Datacenter Edition licence is charged monthly, per number of virtual cores. Minimum 8 cores with a 2-core step increase. Please make sure you state the total number of cores you are planning to use. Licensing example: If you use 2 VMs, one with 4 cores and another one with 12 cores and both of them will run under Microsoft Windows Server, you need to buy a licence for a total of 20 cores (The first VM of 4 cores will need the minimum number of licensed Windows cores, which is 8, plus another 12 cores for the second VM, totaling to 20 cores).',
'MS SQL Server Web Edition licence' => 'Microsoft SQL Server Web Edition (Microsoft SQL Server Web Edition licence is charged monthly, per number of virtual cores. Minimum 4 cores with a 2-core step increase. Please make sure you state the total number of cores you are planning to use. Licensing example: If you use 2 VMs, one with 2 cores and another one with 10 cores and both of them will run SQL Server, you need to buy a licence for a total of 14 cores (The first VM of 2 cores will need the minimum number of licensed SQL cores, which is 4, plus another 10 cores for the second VM, totaling to 14 cores.). This option is not offered with cPanel and SUSE Licenses.',
'MS SQL Server Standard Edition licence' => 'Microsoft SQL Server Standard Edition (Microsoft SQL Server Standard Edition licence is charged monthly, per number of virtual cores. Minimum 4 cores with a 2-core step increase. Please make sure you state the total number of cores you are planning to use. Licensing example: If you use 2 VMs, one with 2 cores and another one with 10 cores and both of them will run SQL Server, you need to buy a licence for a total of 14 cores (The first VM of 2 cores will need the minimum number of licensed SQL cores, which is 4, plus another 10 cores for the second VM, totaling to 14 cores.). This option is not offered with cPanel and SUSE Licenses.',
'Plesk License' => 'Plesk is a commercial, control panel based, web hosting platform that allows server administrators to set up new websites, reseller and e-mail accounts, as well as DNS entries, through a friendly web interface. This option is not offered with cPanel or SUSE Licenses.',
'MS Windows Licence' => 'Microsoft Windows Server Edition licence is charged monthly, per number of virtual cores with a 2-core step increase. Please make sure you state the total number of cores you are planning to use. Licensing example: If you use 2 VMs, one with 4 cores and another one with 12 cores and both of them will run under Microsoft Windows Server, you need to buy a licence for a total of 16 cores. This option is not offered with cPanel and SUSE Licenses.',
'MS SQL Licence' => 'Microsoft SQL Server Edition licence is charged monthly, per number of virtual cores. Minimum 4 cores with a 2-core step increase. Please make sure you state the total number of cores you are planning to use. Licensing example: If you use 2 VMs, one with 2 cores and another one with 10 cores and both of them will run SQL Server, you need to buy a licence for a total of 14 cores (The first VM of 2 cores will need the minimum number of licensed SQL cores, which is 4, plus another 10 cores for the second VM, totaling to 14 cores.). This option is not offered with cPanel and SUSE Licenses.',
'cPanel / WHM Licence' => 'Easy to use web-based control panel, which offers efficient site management, using simple, point-and-click software. Please note that 2 extra IPs are required, in case you want to setup a nameserver in cPanel & WHM.',
'SUSE Linux License'=>'SUSE Linux Enterprise Server is charged monthly, per number of virtual cores. For non-production and test environments, we recommend Standard Subscription. For Production and Business-Critical environments, we recommend Priority Subscription. For more details on subscription, please visit the relevant SUSE page (https://www.suse.com/support/). To unlock this option select Manual Install SLE 12 SP5 Server DVD1 ISO or Manual Install SLE 15 SP1 Server DVD1 as your Operating System. This configurable option is not compatible with cPanel, Plesk, Windows Server and SQL Server Licenses.',
'Additional H/A SSD Block Storage'=>'Additional ultra fast, state-of-the-art SSD storage with High Availability, in a triple replicated & self-healing configuration in order to guarantee data integrity.Additional storage can be split, according to customer needs.',
'Additional H/A HDD Block Storage'=>'Additional ultra fast, state-of-the-art HDD storage with High Availability, in a triple replicated & self-healing configuration in order to guarantee data integrity.Additional storage can be split, according to customer needs.',
'Please install cPanel for me'=>'Our support team is always ready to help you in your cPanel Server installation and configuration. To be able to select this option you have to first choose a cPanel license from the dropdown selection of the option: cPanel License.',
'Auto Select cPanel License'=>'Select CentOS 7 64bit or AlmaLinux 8 64bit Operating System in order to enable this configurable option. By selecting this option, the pricing regarding a cPanel License is automatically set depending on the number of cPanel accounts of your service. Initially a plan of 5 cPanel accounts is deployed. Depending on your service’s needs, cPanel accounts and pricing are automatically adjusted accordingly. This option is not compatible with Plesk, SUSE Linux, Windows Server and SQL Server Licenses.',
'cPanel License' => 'You can purchase a cPanel License based on the amount of accounts you need. Select CentOS 7 64bit or AlmaLinux 8 64bit Operating System in order to enable this configurable option. You can upgrade the purchased cPanel License anytime. The pricing regarding a cPanel License is set depending on the number of cPanel accounts of your service. If you have selected a cPanel License and you need help with the installation of your cPanel server please select the option: Please install cPanel for me. This option is not compatible with Plesk, SUSE Linux and MS Windows and SQL Server Licenses.',
'MS SQL Server License' => 'In case you prefer Windows SQL over mySQL, we offer you the possibility to buy your license from MassiveGRID. Just choose the type of license that suits your application needs. To activate this field, select an Auto Install Windows Standard / Datacenter OS license.',
'Intel Xeon CPU vCores' => 'State-of-the-art, latest technology Intel XEON processors. vCores are 100% dedicated to avoid service degradation due to resource sharing.'
]}

{if $productinfo.group_name eq "Private Infrastructure 2016"}
    {$array['Choose Billing Cycle'] = 'You can either pay on a quarterly basis for your service, or pay on a semi-annually or annually basis and benefit from a discount rate of 5% and 10% respectively.'}
{/if}
{if $productinfo.group_name eq "H/A Cloud Server New York" || $productinfo.group_name eq "H/A Cloud Server Singapore"
    || $productinfo.group_name eq "H/A Cloud Server London" || $productinfo.group_name eq "H/A Cloud Server Frankfurt" || $productinfo.group_name eq "H/A Cloud Servers"}
    {$array['CPU'] = 'vCores are based on state-of-the-art, latest technology Intel XEON processors.'}
    {$array['Support Packages'] = 'Although we offer a wide range of support packages, only Managed Server Support plan is offered to this streamlined service category.'}
{/if}

{* Bug 273235 - Issues with Configure Product options *}
{if $template eq "massivegrid"}
	{assign customtemplate yes}
{/if}
<div id="order-standard_cart">

    <div class="row">
         <div class="pull-md-right {if $removeSidebar}col-md-12{else}col-md-9{/if}">


            <div class="header-lined">
                <h1 class="font-size-36">{$LANG.orderconfigure}</h1>
            </div>
        </div>
            {include file="orderforms/standard_cart/sidebar-categories-collapsed.tpl"}

            <form id="frmConfigureProduct">
                <input type="hidden" name="configure" value="true" />
                <input type="hidden" name="i" value="{$i}" />

                <div class="row">
                      <div class="secondary-cart-body">

                        <p>{$LANG.orderForm.configureDesiredOptions}</p>

                        <div class="product-info">
                            <p class="product-title">{$productinfo.name}</p>
                            <p>{$productinfo.description}</p>
                        </div>

                        <div class="alert alert-danger w-hidden" role="alert" id="containerProductValidationErrors">
                            <p>{$LANG.orderForm.correctErrors}:</p>
                            <ul id="containerProductValidationErrorsList"></ul>
                        </div>

                        {if $pricing.type eq "recurring"}
                            <div class="field-container">
                                <div class="form-group">
                                    <label for="inputBillingcycle">{$LANG.cartchoosecycle}
                                    {*
                                            Custom Change added by Iosif #224139, in order to hide tooltip on the dropdown of Billing cycle for the product groups of Bare Metal Services
                                        *}
                                        {if isset($array[$LANG.cartchoosecycle]) && !in_array($productinfo.group_name, ['SSL Certificates','Bare Metal US-West','Bare Metal US-East','Bare Metal Canada','Bare Metal France','Bare Metal Germany','Bare Metal UK','Bare Metal Singapore','Bare Metal Australia','Bare Metal Servers','Bare Metal Dedicated Servers'])}
                                        {*
											Custom Change End
										*}
										<a href="javascript:void(0);" class="tooltip-qm" data-toggle="tooltip" title="{$array[$LANG.cartchoosecycle]}">
											<span><i class="fas fa-info-circle"></i></span>
										</a>
                                        {/if}
                                    </label>
                                    <br>
                                    <select name="billingcycle" id="inputBillingcycle" class="form-control select-inline custom-select" onchange="updateConfigurableOptions({$i}, this.value); return false">
                                         {assign var="pricingMonthly" value=" "|explode:$pricing.monthly}
                                       {if $pricing.monthly}
    <option value="monthly"{if $billingcycle eq "monthly"} selected{/if}>
        Monthly
    </option>
{/if}

{if $pricing.quarterly}
    <option value="quarterly"{if $billingcycle eq "quarterly"} selected{/if}>
        Quarterly
    </option>
{/if}

{if $pricing.semiannually}
    <option value="semiannually"{if $billingcycle eq "semiannually"} selected{/if}>
        Semi-Annually
    </option>
{/if}

{if $pricing.annually}
    <option value="annually"{if $billingcycle eq "annually"} selected{/if}>
        Annually
    </option>
{/if}

{if $pricing.biennially}
    <option value="biennially"{if $billingcycle eq "biennially"} selected{/if}>
        Biennially
    </option>
{/if}

{if $pricing.triennially}
    <option value="triennially"{if $billingcycle eq "triennially"} selected{/if}>
        Triennially
    </option>
{/if}

                                    </select>
                                </div>
                            </div>
                        {/if}

                        {if count($metrics) > 0}
                            <div class="sub-heading">
                                <span class="primary-bg-color">{$LANG.metrics.title}</span>
                            </div>

                            <p>{$LANG.metrics.explanation}</p>

                            <ul>
                                {foreach $metrics as $metric}
                                    <li>
                                        {$metric.displayName}
                                        -
                                        {if count($metric.pricing) > 1}
                                            {$LANG.metrics.startingFrom} {$metric.lowestPrice} / {if $metric.unitName}{$metric.unitName}{else}{$LANG.metrics.unit}{/if}
                                            <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#modalMetricPricing-{$metric.systemName}">
                                                {$LANG.metrics.viewPricing}
                                            </button>
                                        {elseif count($metric.pricing) == 1}
                                            {$metric.lowestPrice} / {if $metric.unitName}{$metric.unitName}{else}{$LANG.metrics.unit}{/if}
                                            {if $metric.includedQuantity > 0} ({$metric.includedQuantity} {$LANG.metrics.includedNotCounted}){/if}
                                        {/if}
                                        {include file="$template/usagebillingpricing.tpl"}
                                    </li>
                                {/foreach}
                            </ul>

                            <br>
                        {/if}

                        {if $productinfo.type eq "server" 
                        || $productinfo.group_name eq "H/A Private Cloud London"
                        || $productinfo.group_name eq "H/A Private Cloud New York"
                        || $productinfo.group_name eq "H/A Private Cloud Singapore"
                        || $productinfo.group_name eq "H/A Private Cloud Frankfurt"
                        || $productinfo.group_name eq "H/A Private Clouds"}
                            <div class="sub-heading" id="server-manage-subhead" style="display:none;">
                                <span class="primary-bg-color">{$LANG.cartconfigserver}</span>
                            </div>

                           <div class="field-container" id="field-container-server-credentials" style="display:none;">
                                <div class="row" id="server-manage-fields-row1" style="display:none;">
                                    <div class="col-sm-6" style="width:100%;">
                                        <div class="form-group" style="display:none;">
											{assign hostnameSuffix 1|rand:99}
                                            <label for="inputHostname">{$LANG.serverhostname}</label>
                                            <input type="hidden" name="hostname" class="form-control" id="inputHostname" value="MG{$smarty.now|date_format:'%Y%m%d%H%M%S'}{$hostnameSuffix}" readonly autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="col-sm-6" style="display:none;">
                                        <div class="form-group" style="display:none;">
                                            <label for="inputRootpw">{$LANG.serverrootpw}</label>
                                            <input type="hidden" name="rootpw" class="form-control" id="inputRootpw" value="{$smarty.now|date_format:'%Y%m%d%H%M%S'}{$hostnameSuffix}Kj" readonly autocomplete="off">
                                        </div>
                                    </div>
                                </div>

                                <div class="row" id="server-manage-fields-row2" style="display:none;">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="inputNs1prefix">{$LANG.serverns1prefix}</label>
                                            <input type="text" name="ns1prefix" class="form-control" id="inputNs1prefix" value="ns1" readonly autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="inputNs2prefix">{$LANG.serverns2prefix}</label>
                                            <input type="text" name="ns2prefix" class="form-control" id="inputNs2prefix" value="ns2" readonly autocomplete="off">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/if}

                        {if $configurableoptions}
                        
                            <div class="sub-heading">
                                <span class="primary-bg-color">{$LANG.orderconfigpackage}</span>
                            </div>
                            <div class="product-configurable-options" id="productConfigurableOptions">
                                <div class="row">
                                    {foreach $configurableoptions as $num => $configoption}
                                    <div class="opnm{$configoption.optionname|replace:' ':''|lower}{if in_array($productinfo.group_name, ['Bare Metal US-West','Bare Metal US-East','Bare Metal Canada','Bare Metal France','Bare Metal Germany','Bare Metal UK','Bare Metal Singapore','Bare Metal Australia','Bare Metal Servers','Bare Metal Dedicated Servers']) && ($configoption.optionname eq 'Operating System Template' || $configoption.optionname eq 'Operating System Language')} hidden{/if}"> </div>
                                    {if $configoption.optiontype eq 1}
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                {*<label for="inputConfigOption{$configoption.id}">{$configoption.optionname}*}
                                                 {if $configoption.optionname == 'Support Packages'}
                                                                <a href="https://www.massivegrid.com/support-plans/" target="_blank">{$configoption.optionname}</a>
                                                            {elseif $configoption.optionname == 'SUSE Linux License'}
                                                                <a href="https://www.suse.com/support/" target="_blank">{$configoption.optionname}</a>
                                                            {else}
                                                                {$configoption.optionname}
                                                            {/if}
	                                                        {*
	                                                            Custom Change added by Iosif #224139, in order to hide tooltip on the dropdown of storage in the product groups of Bare Metal Services
	                                                        *}
                                                            {if isset($array[$configoption.optionname]) && !in_array($productinfo.group_name, ['SSL Certificates','Bare Metal US-West','Bare Metal US-East','Bare Metal Canada','Bare Metal France','Bare Metal Germany','Bare Metal UK','Bare Metal Singapore','Bare Metal Australia','Bare Metal Servers','Bare Metal Dedicated Servers'])}
	                                                        {*
	                                                            Custom Change End
	                                                        *}
                                                            <a href="javascript:void(0);" class="tooltip-qm" data-toggle="tooltip" title="{$array[$configoption.optionname]}">
																<span><i class="fas fa-info-circle"></i></span>
															</a>
                                                            {/if}
                                                </label>
                                                <select name="configoption[{$configoption.id}]" id="inputConfigOption{$configoption.id}" class="form-control">
                                                    {foreach key=num2 item=options from=$configoption.options}
                                                        <option value="{$options.id}"{if $configoption.selectedvalue eq $options.id} selected="selected"{/if}>
                                                            {$options.name}
                                                        </option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                        </div>
                                    {elseif $configoption.optiontype eq 2}
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="inputConfigOption{$configoption.id}">{$configoption.optionname}
                                                 {if isset($array[$configoption.optionname])}
                                                        <a href="javascript:void(0);" class="tooltip-qm" data-toggle="tooltip" title="{$array[$configoption.optionname]}">
                                                            <span><i class="fas fa-info-circle"></i></span>
                                                        </a>
                                                    {/if}
                                                </label>
                                                {foreach key=num2 item=options from=$configoption.options}
                                                    <br />
                                                    <label>
                                                        <input type="radio" name="configoption[{$configoption.id}]" value="{$options.id}"{if $configoption.selectedvalue eq $options.id} checked="checked"{/if} />
                                                        {if $options.name}
                                                            {$options.name}
                                                        {else}
                                                            {$LANG.enable}
                                                        {/if}
                                                    </label>
                                                {/foreach}
                                            </div>
                                        </div>
                                    {elseif $configoption.optiontype eq 3}
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="inputConfigOption{$configoption.id}">{$configoption.optionname}</label>
                                                <br />
                                                <label>
                                                    <input type="checkbox" name="configoption[{$configoption.id}]" id="inputConfigOption{$configoption.id}" value="1"{if $configoption.selectedqty} checked{/if} />
                                                    {if $configoption.options.0.name}
                                                        {$configoption.options.0.name}
                                                    {else}
                                                        {$LANG.enable}
                                                    {/if}
                                                </label>
                                            </div>
                                        </div>
                                    {elseif $configoption.optiontype eq 4}
                                        <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <label for="inputConfigOption{$configoption.id}" style="font-size:14px; font-weight: bold;">{$configoption.optionname}
                                                            {if isset($array[$configoption.optionname])}
                                                                <a href="javascript:void(0);" class="tooltip-qm" data-toggle="tooltip" title="{$array[$configoption.optionname]}">
                                                                    <span><i class="fas fa-info-circle"></i></span>
                                                                </a>
                                                            {/if}
                                                        </label>
                                                        {if $configoption.qtymaximum}
                                                            {if !$rangesliderincluded}
                                                                <script type="text/javascript" src="{$BASE_PATH_JS}/ion.rangeSlider.min.js"></script>
                                                                <link href="{$BASE_PATH_CSS}/ion.rangeSlider.css" rel="stylesheet">
                                                                <link href="{$BASE_PATH_CSS}/ion.rangeSlider.skinModern.css" rel="stylesheet">
                                                                {assign var='rangesliderincluded' value=true}
                                                            {/if}
                                                            <input type="text" name="configoption[{$configoption.id}]" value="{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}" id="inputConfigOption{$configoption.id}" class="form-control" />
                                                            <script>
                                                                var sliderTimeoutId = null;
                                                                var sliderRangeDifference = {$configoption.qtymaximum} - {$configoption.qtyminimum};
                                                                // The largest size that looks nice on most screens.
                                                                var sliderStepThreshold = 25;
                                                                // Check if there are too many to display individually.
                                                                var setLargerMarkers = sliderRangeDifference > sliderStepThreshold;

                                                                jQuery("#inputConfigOption{$configoption.id}").ionRangeSlider({
                                                                    min: {$configoption.qtyminimum},
                                                                    max: {$configoption.qtymaximum},
                                                                    grid: true,
                                                                    grid_snap: setLargerMarkers ? false : true,
                                                                    // #250031 Adjust Quantity Slider values for H/A Cloud Dedicated Servers
                                                                    {if $productinfo.pid|in_array:['560','561','562','563','859','863','867','871','860','864','868','872','861','865','869','873','862','866','870','874', '899', '900', '901', '903', '904', '914', '915', '916', '905', '906', '907', '908', '924', '925', '892', '893', '894', '895', '946', '938', '959', '937', '958', '936', '959', '937', '958', '936', '957', '939', '960', '947', '963', '945', '962', '961', '948', '964', '990', '991', '998', '993', '994', '995', '996', '997']}  
                                                                        // Primary High Availability SSD Storage Config Option
                                                                        {if ($configoption.id == '2896') || ($configoption.id == '2906') || ($configoption.id == '2848') || ($configoption.id == '2916') || ($configoption.id == '3142') || ($configoption.id == '3170') || ($configoption.id == '3219') || ($configoption.id == '3255') || ($configoption.id == '3259') || ($configoption.id == '3291') || ($configoption.id == '3300') || ($configoption.id == '3317')}
                                                                            step: "32",
                                                                        {/if}
                                                                        // Additional High Availability SSD Storage Config Option                                                                   
                                                                        {if ($configoption.id == '2897') || ($configoption.id == '2907') || ($configoption.id == '2849') || ($configoption.id == '2917') || ($configoption.id == '3143') || ($configoption.id == '3171') || ($configoption.id == '3220') || ($configoption.id == '3303') || ($configoption.id == '3294') || ($configoption.id == '3320')}
                                                                            step: "128",
                                                                        {/if}
                                                                    {/if}
                                                                    {if $productinfo.pid|in_array:['862','866','870','874']}
                                                                            {if ($configoption.id == '3155')}
                                                                                step: "2",
                                                                            {/if}
                                                                    {/if}
                                                                    // #250031 Adjust Quantity Slider values for H/A Cloud Servers
                                                                    {if $productinfo.pid|in_array:['556','557','558','559','843','847','851','855','856','844','848','852','856','845','849','853','857','846','850','854','858', '880', '881', '882', '884', '883', '893', '897', '898', '909', '910', '911', '912', '913', '917', '918', '919', '920', '921', '922', '923', '888', '889', '890', '891', '934', '951', '933', '950', '932', '949', '935', '952', '942', '941', '955', '940', '954', '953', '943', '956']}
                                                                            // Primary High Availability SSD Storage Config Option
                                                                            {if ($configoption.id == '2878') || ($configoption.id == '2884') || ($configoption.id == '2825') || ($configoption.id == '2890') || ($configoption.id == '3139') || ($configoption.id == '3184') || ($configoption.id == '3213') || ($configoption.id == '3238')}
                                                                                step: "32",
                                                                            {/if}
                                                                    {/if}
                                                                    {if $productinfo.pid|in_array:['846','850','854','858', '880', '881']}
                                                                            {if ($configoption.id == '3151')}
                                                                                step: "2",
                                                                            {/if}
                                                                    {/if}
                                                                    // #253539 Adjust Quantity Slider values for H/A Virtual Private Cloud Servers
                                                                    {if $productinfo.pid|in_array:['564','565','566','567', '926']}
                                                                            // Primary High Availability SSD Storage Config Option
                                                                            {if ($configoption.id == '2934') || ($configoption.id == '2941') || ($configoption.id == '2926') || ($configoption.id == '2948')}
                                                                                step: "128",
                                                                            {/if}
                                                                    {/if}  
                                                                    // Adjust Max CPU Slider values for Singapore H/A Cloud Servers
                                                                    {if $productinfo.pid|in_array:['909','911','912','913','855','891','910','856','857','858','871','895','914','872','873','874', '935', '952', '943', '956']}
                                                                            {if ($configoption.id == '3145') || ($configoption.id == '3179') || ($configoption.id == '3149') || ($configoption.id == '3151') || ($configoption.id == '3244')}
                                                                                max: "20",
                                                                            {/if}
                                                                    {/if} 
                                                                     // Adjust Max CPU Slider values for Singapore H/A Cloud Dedicated Servers
                                                                    {if $productinfo.pid|in_array:['904','915','903','916','871','895','914','872','873','874', '939', '960', '948', '964', '993', '997']}
                                                                            {if ($configoption.id == '3147') || ($configoption.id == '3174') || ($configoption.id == '3153') || ($configoption.id == '3155') || ($configoption.id == '3253') || ($configoption.id == '3298') || ($configoption.id == '3323')}
                                                                                max: "20",
                                                                            {/if}
                                                                    {/if}     
                                                                    // Adjust Max CPU Slider values for Singapore H/A Virtual Private Cloud Servers
                                                                    {if $productinfo.pid|in_array:['567']}
                                                                            {if ($configoption.id == '2946') || ($configoption.id == '3174') || ($configoption.id == '3153') || ($configoption.id == '3155')}
                                                                                max: "20",
                                                                            {/if}
                                                                    {/if}                                                                  
                                                                    onChange: function() {
                                                                        if (sliderTimeoutId) {
                                                                            clearTimeout(sliderTimeoutId);
                                                                        }

                                                                        sliderTimeoutId = setTimeout(function() {
                                                                            sliderTimeoutId = null;
                                                                            recalctotals();
                                                                        }, 250);
                                                                    }
                                                                });
                                                            </script>
                                                        {else}
                                                            <div>
                                                                <input type="number" name="configoption[{$configoption.id}]" value="{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}" id="inputConfigOption{$configoption.id}" min="{$configoption.qtyminimum}" onchange="recalctotals()" onkeyup="recalctotals()" class="form-control form-control-qty" />
                                                                <span class="form-control-static form-control-static-inline">
                                                                    x {$configoption.options.0.name}
                                                                </span>
                                                            </div>
                                                        {/if}
                                                    </div>
                                                </div>
                                    {/if}
                                    {if $num % 2 != 0}
                                </div>
                                <div class="row">
                                    {/if}
                                    {/foreach}
                                </div>
                            </div>

                        {/if}

                        {if $customfields}

                            <div class="sub-heading pb-1">
                                <span class="primary-bg-color">{$LANG.orderadditionalrequiredinfo}<br><i><small>{lang key='orderForm.requiredField'}</small></i></span>
                            </div>

                            <div class="field-container">
                            {foreach $customfields as $customfield}
                                {if $customfield.name != 'test'}
                                    <div class="form-group">
                                        <label for="customfield{$customfield.id}">{$customfield.name} {$customfield.required}</label>
                                        {$customfield.input}
                                        {if $customfield.description}
                                            <span class="field-help-text">
                                                {$customfield.description}
                                            </span>
                                        {/if}
                                    </div>
                                {/if}
                                 {if $customfield.name == 'test'}
                                        
                                            {if (isset($customfield['description']) && strpos($customfield['description'], ',') !== false) }
                                                    {$wordsArray = explode(',', $customfield['description'])}
                                                   <h1> {print_r($wordsArray)} </h1>                                      
                                            {/if}
                                            {continue}
                                {/if}
                            {/foreach}
                        </div>

                        {/if}

                        {if $addons || count($addonsPromoOutput) > 0}

                            <div id="productAddonsContainer">
                                <div class="sub-heading">
                                    <span class="primary-bg-color">{$LANG.cartavailableaddons}</span>
                                </div>

                                {foreach $addonsPromoOutput as $output}
                                    <div>
                                        {$output}
                                    </div>
                                {/foreach}

                                <div class="row addon-products">
                                    {foreach $addons as $addon}
                                        <div class="col-sm-{if count($addons) > 1}6{else}12{/if}">
                                            <div class="panel card panel-default panel-addon{if $addon.status} panel-addon-selected{/if}">
                                                <div class="panel-body card-body">
                                                    <label>
                                                        <input type="checkbox" name="addons[{$addon.id}]"{if $addon.status} checked{/if} />
                                                        {$addon.name}
                                                    </label><br />
                                                    {$addon.description}
                                                </div>
                                                <div class="panel-price">
                                                    {$addon.pricing}
                                                </div>
                                                <div class="panel-add">
                                                    <i class="fas fa-plus"></i>
                                                    {$LANG.addtocart}
                                                </div>
                                            </div>
                                        </div>
                                    {/foreach}
                                </div>
                            </div>
                        {/if}

                        <div class="alert alert-warning info-text-sm">
                            <i class="fas fa-question-circle"></i>
                            {$LANG.orderForm.haveQuestionsContact} <a href="{$WEB_ROOT}/contact.php" target="_blank" class="alert-link">{$LANG.orderForm.haveQuestionsClickHere}</a>
                        </div>

                    </div>
                    <div class="secondary-cart-sidebar" id="scrollingPanelContainer">

                        <div id="orderSummary">
                            <div class="order-summary">
                                <div class="loader" id="orderSummaryLoader">
                                    <i class="fas fa-fw fa-sync fa-spin"></i>
                                </div>
                                <h2 class="font-size-30">{$LANG.ordersummary}</h2>
                                <div class="summary-container" id="producttotal"></div>
                            </div>
                            <div class="text-center">
                                <button type="submit" id="btnCompleteProductConfig" class="btn btn-primary btn-lg">
                                    {$LANG.continue}
                                    <i class="fas fa-arrow-circle-right"></i>
                                </button>
                            </div>
                        </div>

                    </div>

                </div>

            </form>
        </div>
    </div>
</div>



<script>
    recalctotals();
    $(document).ready(function () {
        $('*[data-toggle="tooltip"]').tooltip({
            content: function () {
                return 'HTML';
            },
            position: {
                my: "left bottom-10",
                at: "left-4 top",
                using: function (position, feedback) {
                    $(this).css(position);
                    $("<div>")
                        .addClass("arrow")
                        .addClass(feedback.vertical)
                        .addClass(feedback.horizontal)
                        .appendTo(this);
                }
            }
        });

        // PM #224316: Bare Metal Support Plan WHMCS Calculation
        const inputConfigOptionList = [
            // Bare Metal US-West
            'inputConfigOption2576', 'inputConfigOption2571', 'inputConfigOption2578', 'inputConfigOption2580', 'inputConfigOption2582',
            'inputConfigOption2584', 'inputConfigOption2586', 'inputConfigOption2588', 'inputConfigOption2590', 'inputConfigOption2592',
            // Bare Metal US-East
            'inputConfigOption2594', 'inputConfigOption2596', 'inputConfigOption2598', 'inputConfigOption2600', 'inputConfigOption2602',
            'inputConfigOption2604', 'inputConfigOption2606', 'inputConfigOption2608', 'inputConfigOption2610', 'inputConfigOption2612',
            // Bare Metal Canada
            'inputConfigOption2614', 'inputConfigOption2616', 'inputConfigOption2618', 'inputConfigOption2620', 'inputConfigOption2622',
            'inputConfigOption2624', 'inputConfigOption2626', 'inputConfigOption2628', 'inputConfigOption2630', 'inputConfigOption2632',
            // Bare Metal France
            'inputConfigOption2634', 'inputConfigOption2636', 'inputConfigOption2638', 'inputConfigOption2640', 'inputConfigOption2642',
            'inputConfigOption2644', 'inputConfigOption2646', 'inputConfigOption2648', 'inputConfigOption2650', 'inputConfigOption2652',
            // Bare Metal Germany
            'inputConfigOption2654', 'inputConfigOption2664', 'inputConfigOption2666', 'inputConfigOption2668', 'inputConfigOption2670',
            'inputConfigOption2672', 'inputConfigOption2674', 'inputConfigOption2676', 'inputConfigOption2702', 'inputConfigOption2704',
            // Bare Metal UK
            'inputConfigOption2657', 'inputConfigOption2684', 'inputConfigOption2686', 'inputConfigOption2688', 'inputConfigOption2690',
            'inputConfigOption2692', 'inputConfigOption2694', 'inputConfigOption2696', 'inputConfigOption2698', 'inputConfigOption2700',
            // Bare Metal Singapore
            'inputConfigOption2660', 'inputConfigOption2680',
            // Bare Metal Australia
            'inputConfigOption2662', 'inputConfigOption2682',
			// Bare Metal Servers
            'inputConfigOption3046', 'inputConfigOption3071', 'inputConfigOption3067', 'inputConfigOption3087',
            'inputConfigOption3063', 'inputConfigOption3059', 'inputConfigOption3055', 'inputConfigOption3051'
        ];
		
        $.each(inputConfigOptionList, function (index, inputConfigOption) {
            if (document.getElementById(inputConfigOption)) {
                if ($('#inputBillingcycle').val() === 'monthly') {
                    var str = {if $AddonMonthlyPrice}{$AddonMonthlyPrice}{else}0{/if};
                } else if ($('#inputBillingcycle').val() === 'quarterly') {
                    var str = {if $AddonQuarterlyPrice}{$AddonQuarterlyPrice}{else}0{/if};
                } else if ($('#inputBillingcycle').val() === 'semiannually') {
                    var str = {if $AddonSemiAnnuallyPrice}{$AddonSemiAnnuallyPrice}{else}0{/if};
                } else if ($('#inputBillingcycle').val() === 'annually') {
                    var str = {if $AddonAnnuallyPrice}{$AddonAnnuallyPrice}{else}0{/if};
                } else if ($('#inputBillingcycle').val() === 'biennially') {
                    var str = {if $AddonBienniallyPrice}{$AddonBienniallyPrice}{else}0{/if};
                } else if ($('#inputBillingcycle').val() === 'triennially') {
                    var str = {if $AddonTrienniallyPrice}{$AddonTrienniallyPrice}{else}0{/if};
                }
                var addonPrice = parseFloat(str) + ($('#' + inputConfigOption + ' option:selected').data('price') * 0.20);
                $('article:contains("Support Packages")').find('div.panel-price').text('$' + parseFloat(addonPrice).toFixed(2) + ' USD');

                $('#inputBillingcycle').on('change', function () {
                    $('article:contains("Support Packages")').find('div.panel-price').text('Calculating...');
                    setTimeout(function () {
                        if ($('#inputBillingcycle').val() === 'monthly') {
                            var str = {if $AddonMonthlyPrice}{$AddonMonthlyPrice}{else}0{/if};
                        } else if ($('#inputBillingcycle').val() === 'quarterly') {
                            var str = {if $AddonQuarterlyPrice}{$AddonQuarterlyPrice}{else}0{/if};
                        } else if ($('#inputBillingcycle').val() === 'semiannually') {
                            var str = {if $AddonSemiAnnuallyPrice}{$AddonSemiAnnuallyPrice}{else}0{/if};
                        } else if ($('#inputBillingcycle').val() === 'annually') {
                            var str = {if $AddonAnnuallyPrice}{$AddonAnnuallyPrice}{else}0{/if};
                        } else if ($('#inputBillingcycle').val() === 'biennially') {
                            var str = {if $AddonBienniallyPrice}{$AddonBienniallyPrice}{else}0{/if};
                        } else if ($('#inputBillingcycle').val() === 'triennially') {
                            var str = {if $AddonTrienniallyPrice}{$AddonTrienniallyPrice}{else}0{/if};
                        }
                        var addonPrice = parseFloat(str) + ($('#' + inputConfigOption + ' option:selected').data('price') * 0.20);
                        $('article:contains("Support Packages")').find('div.panel-price').text('$' + parseFloat(addonPrice).toFixed(2) + ' USD');
                    }, 3000);
                });
            }
        });
		
		
        $('.pck-title-click img').on('click',function() {
            $(this).parent().parent().children('.dropdown').slideToggle();
            $(this).toggleClass('rotate');
        });
        // $(".form-group").mouseenter(function(){
        //     $(this).find(".tooltip-qm").fadeIn(400);
        // }).mouseleave(function(){
        //     var someElement = $(this);
        //     someElement.find(".tooltip-qm").fadeOut(400);
        // });

        $(document.getElementsByClassName("addons[2]")[0]).iCheck('check');
        $(document.getElementsByClassName("addons[61]")[0]).iCheck('check');
        $(document.getElementsByClassName("addons[63]")[0]).iCheck('check');
        $(document.getElementsByClassName("addons[64]")[0]).iCheck('check');
        $(document.getElementsByClassName("addons[65]")[0]).iCheck('check');
        $(document.getElementsByClassName("addons[67]")[0]).iCheck('check');
        $(document.getElementsByClassName("addons[74]")[0]).iCheck('check');

        // When any radio button on the page is selected, then deselect all other radio buttons.
        $('input.support-radio').on('ifClicked', function (event) {
            $('input.support-radio').not(this).iCheck('uncheck');
        });
        $('input.plesk-radio').on('ifClicked', function (event) {
            $('input.plesk-radio').not(this).iCheck('uncheck');
        });
        $('input.ms-windows-radio').on('ifClicked', function (event) {
            $('input.ms-windows-radio').not(this).iCheck('uncheck');
        });
        $('input.ms-sql-radio').on('ifClicked', function (event) {
            $('input.ms-sql-radio').not(this).iCheck('uncheck');
        });
        $('input.ddos-radio').on('ifClicked', function (event) {
            $('input.ddos-radio').not(this).iCheck('uncheck');
        });
    });
    $(document).ajaxStop(function () {
        $('*[data-toggle="tooltip"]').tooltip({
            content: function () {
                return 'HERLLO';
            },
            position: {
                my: "left bottom-10",
                at: "left-4 top",
                using: function (position, feedback) {
                    $(this).css(position);
                    $("<div>")
                        .addClass("arrow")
                        .addClass(feedback.vertical)
                        .addClass(feedback.horizontal)
                        .appendTo(this);
                }
            }
        });
    });
	
	// Recalculate addon (Support Package) price
    function getPrice(obj) {
        var uid = obj.options[obj.selectedIndex].getAttribute('data-price');
        var str = addonPrice = 0;
        $('article:contains("Support Packages")').find('div.panel-price').text('Calculating...');
        setTimeout(function () {
            if ($('#inputBillingcycle').val() === 'monthly') {
                var str = {if $AddonMonthlyPrice}{$AddonMonthlyPrice}{else}0{/if};
            } else if ($('#inputBillingcycle').val() === 'quarterly') {
                var str = {if $AddonQuarterlyPrice}{$AddonQuarterlyPrice}{else}0{/if};
            } else if ($('#inputBillingcycle').val() === 'semiannually') {
                var str = {if $AddonSemiAnnuallyPrice}{$AddonSemiAnnuallyPrice}{else}0{/if};
            } else if ($('#inputBillingcycle').val() === 'annually') {
                var str = {if $AddonAnnuallyPrice}{$AddonAnnuallyPrice}{else}0{/if};
            } else if ($('#inputBillingcycle').val() === 'biennially') {
                var str = {if $AddonBienniallyPrice}{$AddonBienniallyPrice}{else}0{/if};
            } else if ($('#inputBillingcycle').val() === 'triennially') {
                var str = {if $AddonTrienniallyPrice}{$AddonTrienniallyPrice}{else}0{/if};
            }
            var addonPrice = parseFloat(str) + (obj.options[obj.selectedIndex].getAttribute('data-price') * 0.20);
            $('article:contains("Support Packages")').find('div.panel-price').text('$' + parseFloat(addonPrice).toFixed(2) + ' USD');
        }, 500);
    }
</script>


{if isset($productinfo.pid) && $productinfo.pid && isset($productinfo.name) && $productinfo.name && isset($productinfo.groupname) && $productinfo.groupname}
<script>
window.dataLayer = window.dataLayer || [];
dataLayer.push({
    event: "view_item",
    ecommerce: {
        currency: "{$currency|default:'USD'}",
        value: (function() {
            var p = "{$pricing.rawpricing.monthly.price|replace:',':''}";
            if (!p || isNaN(p)) { p = "{$pricing.minprice.price|replace:',':''}"; }
            return (p && !isNaN(p)) ? parseFloat(p) : 0;
        })(),
        items: [{
            item_id: "{$productinfo.pid|escape:'javascript'}",
            item_name: "{$productinfo.name|escape:'javascript'}",
            item_category: "{$productinfo.groupname|escape:'javascript'}",
            price: (function() {
                var p = "{$pricing.rawpricing.monthly.price|replace:',':''}";
                if (!p || isNaN(p)) { p = "{$pricing.minprice.price|replace:',':''}"; }
                return (p && !isNaN(p)) ? parseFloat(p) : 0;
            })(),
            quantity: 1
        }]
    }
});
</script>
{/if}

