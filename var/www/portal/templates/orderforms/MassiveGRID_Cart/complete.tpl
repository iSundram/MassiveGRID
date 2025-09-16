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
                {* Preprocess purchase total value *}
                {if $total}
                    {assign var="orderTotal" value=$total|regex_replace:'/[^0-9.]/':''}
                {elseif $totaldue}
                    {assign var="orderTotal" value=$totaldue|regex_replace:'/[^0-9.]/':''}
                {elseif $invoicetotal}
                    {assign var="orderTotal" value=$invoicetotal|regex_replace:'/[^0-9.]/':''}
                {else}
                    {assign var="orderTotal" value="0"}
                {/if}

                <script>
                // Debug: Log available variables
                console.log('WHMCS Order Complete Debug:', {
                    total: '{$total}',
                    orderid: '{$orderid}',
                    ordernumber: '{$ordernumber}',
                    invoiceid: '{$invoiceid}',
                    currency: '{$currency}',
                    products_count: '{if $products}{$products|count}{else}0{/if}',
                    processedTotal: '{$orderTotal}'
                });

                dataLayer.push({
                    event: "purchase",
                    ecommerce: {
                        transaction_id: "{$invoiceid|default:$orderid|default:$ordernumber}",
                        value: parseFloat("{$orderTotal}") || 0,
                        currency: "{$currency|default:'USD'}",
                        items: [
                            {if $products}
                            {foreach $products as $product}
                                {* Preprocess product price *}
                                {if $product.amount}
                                    {assign var="productPrice" value=$product.amount|regex_replace:'/[^0-9.]/':''}
                                {elseif $product.price}
                                    {assign var="productPrice" value=$product.price|regex_replace:'/[^0-9.]/':''}
                                {elseif $product.totaltoday}
                                    {assign var="productPrice" value=$product.totaltoday|regex_replace:'/[^0-9.]/':''}
                                {else}
                                    {assign var="productPrice" value="0"}
                                {/if}
                            {
                                item_id: "{$product.productinfo.pid|default:$product.pid|default:'unknown'}",
                                item_name: "{$product.productinfo.name|default:$product.name|default:'Product'|escape:'javascript'}",
                                item_category: "{$product.productinfo.groupname|default:$product.groupname|default:'General'|escape:'javascript'}",
                                price: parseFloat("{$productPrice}") || 0,
                                quantity: {$product.qty|default:1}
                            }{if !$product@last},{/if}
                            {/foreach}
                            {else}
                            {
                                item_id: "order",
                                item_name: "Order #{$ordernumber}",
                                item_category: "Purchase",
                                price: parseFloat("{$orderTotal}") || 0,
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
