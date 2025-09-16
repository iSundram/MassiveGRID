{include file="orderforms/standard_cart/common.tpl"}

<div id="order-standard_cart">

    <div class="row">
        <div class="cart-sidebar">
            {include file="orderforms/standard_cart/sidebar-categories.tpl"}
        </div>
        <div class="cart-body">
            <div class="header-lined">
                <h1 class="font-size-36">{$LANG.orderconfirmation}</h1>
            </div>
            {include file="orderforms/standard_cart/sidebar-categories-collapsed.tpl"}

            <p>{$LANG.orderreceived}</p>

            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 offset-sm-2">
                    <div class="alert alert-info order-confirmation">
                        {$LANG.ordernumberis} <span>{$ordernumber}</span>
                    </div>
                </div>
            </div>

            <p>{$LANG.orderfinalinstructions}</p>

            {if $expressCheckoutInfo}
                <div class="alert alert-info text-center">
                    {$expressCheckoutInfo}
                </div>
            {elseif $expressCheckoutError}
                <div class="alert alert-danger text-center">
                    {$expressCheckoutError}
                </div>
            {elseif $invoiceid && !$ispaid}
                <div class="alert alert-warning text-center">
                    {$LANG.ordercompletebutnotpaid}
                    <br /><br />
                    <a href="{$WEB_ROOT}/viewinvoice.php?id={$invoiceid}" target="_blank" class="alert-link">
                        {$LANG.invoicenumber}{$invoiceid}
                    </a>
                </div>
            {/if}

            {foreach $addons_html as $addon_html}
                <div class="order-confirmation-addon-output">
                    {$addon_html}
                </div>
            {/foreach}

            {if $ispaid}
                <!-- Enter any HTML code which should be displayed when a user has completed checkout here -->
                <!-- Common uses of this include conversion and affiliate tracking scripts -->
                <script>
                // Debug: Log available variables
                console.log('WHMCS Order Complete Debug:', {
                    total: '{$total}',
                    orderid: '{$orderid}',
                    ordernumber: '{$ordernumber}',
                    invoiceid: '{$invoiceid}',
                    currency: '{$currency}',
                    products_count: '{if $products}{$products|count}{else}0{/if}'
                });

                dataLayer.push({
                    event: "purchase",
                    ecommerce: {
                        transaction_id: "{$invoiceid|default:$orderid|default:$ordernumber}",
                        value: (function() {
                            // Try multiple total variables
                            {if $total}
                            var totalStr = "{$total|replace:',':''}";
                            {elseif $totaldue}
                            var totalStr = "{$totaldue|replace:',':''}";
                            {elseif $invoicetotal}
                            var totalStr = "{$invoicetotal|replace:',':''}";
                            {else}
                            var totalStr = "0";
                            {/if}
                            
                            // Extract numeric value from formatted string
                            var match = totalStr.match(/[\d]+\.?[\d]*/);
                            var value = match ? parseFloat(match[0]) : 0;
                            console.log('Purchase value extracted:', value, 'from:', totalStr);
                            return value;
                        })(),
                        currency: "{$currency|default:'USD'}",
                        items: [
                            {if $products}
                            {foreach $products as $product}
                            {
                                item_id: "{$product.productinfo.pid|default:$product.pid|default:'unknown'}",
                                item_name: "{$product.productinfo.name|default:$product.name|default:'Product'|escape:'javascript'}",
                                item_category: "{$product.productinfo.groupname|default:$product.groupname|default:'General'|escape:'javascript'}",
                                price: (function() {
                                    {if $product.amount}
                                    var priceStr = "{$product.amount|replace:',':''}";
                                    {elseif $product.price}
                                    var priceStr = "{$product.price|replace:',':''}";
                                    {elseif $product.totaltoday}
                                    var priceStr = "{$product.totaltoday|replace:',':''}";
                                    {else}
                                    var priceStr = "0";
                                    {/if}
                                    var match = priceStr.match(/[\d]+\.?[\d]*/);
                                    return match ? parseFloat(match[0]) : 0;
                                })(),
                                quantity: {$product.qty|default:1}
                            }{if !$product@last},{/if}
                            {/foreach}
                            {else}
                            {
                                item_id: "order",
                                item_name: "Order #{$ordernumber}",
                                item_category: "Purchase",
                                price: (function() {
                                    {if $total}
                                    var totalStr = "{$total|replace:',':''}";
                                    {elseif $totaldue}
                                    var totalStr = "{$totaldue|replace:',':''}";
                                    {else}
                                    var totalStr = "0";
                                    {/if}
                                    var match = totalStr.match(/[\d]+\.?[\d]*/);
                                    return match ? parseFloat(match[0]) : 0;
                                })(),
                                quantity: 1
                            }
                            {/if}
                        ]
                    }
                });
                </script>
            {/if}

            <div class="text-center">
                <a href="{$WEB_ROOT}/clientarea.php" class="btn btn-default">
                    {$LANG.orderForm.continueToClientArea}
                    &nbsp;<i class="fas fa-arrow-circle-right"></i>
                </a>
            </div>

            {if $hasRecommendations}
                {include file="orderforms/standard_cart/includes/product-recommendations.tpl"}
            {/if}
        </div>
    </div>
</div>
