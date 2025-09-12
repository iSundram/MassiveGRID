{$partnerssystemenabled=true}
{if $partnerssystemenabled}
    {*    {include file="$template/includes/alert.tpl" type="info" title=$LANG.partnersignuptitle msg=$LANG.partnersignupintro|cat:'<br /><br />' textcenter=true}*}
    <br/>
    <div class="text-center" style="margin-bottom: 20px;">
        <h3>{$LANG.partnersinfotitle}</h3>
    </div>
    <div class="col-md-12 text-justify">
        <p>{$LANG.partnerinfotext1}</p>
        <p>{$LANG.partnerinfotext2}</p>
    </div>
    <div class="col-md-8 col-md-offset-2">
        <table class="table table-striped table-rounded text-center">
            <thead>
            <tr>
                <th class="text-center">{$LANG.partnertable.head1}</th>
                <th class="text-center">{$LANG.partnertable.head2}</th>
                <th class="text-center">{$LANG.partnertable.head3}</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>{$LANG.partnertable.row1.column1}</td>
                <td>{$LANG.partnertable.row1.column2}</td>
                <td>{$LANG.partnertable.row1.column3}</td>
            </tr>
            <tr>
                <td>{$LANG.partnertable.row2.column1}</td>
                <td>{$LANG.partnertable.row2.column2}</td>
                <td>{$LANG.partnertable.row2.column3}</td>
            </tr>
            <tr>
                <td>{$LANG.partnertable.row3.column1}</td>
                <td>{$LANG.partnertable.row3.column2}</td>
                <td>{$LANG.partnertable.row3.column3}</td>
            </tr>
            <tr>
                <td>{$LANG.partnertable.row4.column1}</td>
                <td>{$LANG.partnertable.row4.column2}</td>
                <td>{$LANG.partnertable.row4.column3}</td>
            </tr>
            <tr>
                <td>{$LANG.partnertable.row5.column1}</td>
                <td>{$LANG.partnertable.row5.column2}</td>
                <td>{$LANG.partnertable.row5.column3}</td>
            </tr>
            <tr>
                <td>{$LANG.partnertable.row6.column1}</td>
                <td>{$LANG.partnertable.row6.column2}</td>
                <td>{$LANG.partnertable.row6.column3}</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-12 text-justify">
        <p>{$LANG.partnerinfotext3}</p>
        <p>{$LANG.partnerinfotext4}</p>
    </div>
    <div class="col-md-12" style="margin-top: 30px;">
        {if $partnersactivateerror}
            {include file="$template/includes/alert.tpl" type="danger" msg=$LANG.partnersactivate.error textcenter=true}
        {/if}
		{* DISABLED DUE TO 294214 *}
        {* {if $isPartner neq "Yes" && $notapplicable eq false} *}
        {if $isPartner neq "Yes"}
        <form method="post" action="partners.php">
            <input type="hidden" name="activate" value="true"/>
            <p align="center"><input type="submit" value="{$LANG.partneractivate}" class="btn btn-lg btn-success"/></p>
        </form>
        {* DISABLED DUE TO 294214 *}
        {* {elseif $isPartner neq "Yes" && $notapplicable eq true}
            {include file="$template/includes/alert.tpl" type="info" msg=$LANG.partnersactivate.warning textcenter=true} *}
        {else}
            {include file="$template/includes/alert.tpl" type="success" msg=$LANG.ispartner textcenter=true}
        {/if}
    </div>
{else}
    {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.partnersdisabled textcenter=true}
{/if}