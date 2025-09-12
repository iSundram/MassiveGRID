                    </div>

                    </div>
                    {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                        <div class="d-lg-none sidebar sidebar-secondary">
                            {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                        </div>
                    {/if}
                <div class="clearfix"></div>
            </div>
        </div>
    </section>

<section id="footer" class="main-footer">
    <div class="container">
        <!-- Website Footer Content will be integrated here-->
                <div class="grid teaser-wrap">
            <div class="m8 s12">
                <p class="teaser">Ready to start the conversation? <br> We're Here For You.</p>
            </div>
            <div class="m4 s12 grid-end">
                <a class="btn orange" href="https://massivegrid.com/contact-us/">Contact Us </a>
            </div>
        </div>
        <div class="awards-wrap">
            <div>
                <a href="https://findbesthosts.com/web-hosting-companies/massivegrid" target="_blank" rel="nofollow">
                <img src="\assets\img\award5.png.webp" alt="Best Dedicated Servers for February 2024" title="Best Dedicated Servers for February 2024">
                </a></div>
            <div><img src="\assets\img\award2.png" alt=""></div>
            <div>
                <a href="https://www.hostreview.com/awards/monthly/dedicated-server/2024/april" target="_blank" rel="nofollow">
                <img src="\assets\img\top10_dedicated202404.png" alt="Best Dedicated Server for April 2024" title="Best Dedicated Server for April 2024"/></a></div>
            <div><img src="\assets\img\award4cloud.webp" alt=""></div>
        </div>
        <div class="grid logo-wrap">
            <div class="m4 s12">
                <img class="logo" src="\assets\img\top-logo.svg" alt="">
                <sub>{$LANG.footer.tagline}</sub>
                <div class="iso-wrapper">
                    <img class="mt5 iso" src="\assets\img\tld_logos\LOGO_IAS_9001.webp" alt="">
                  
                      {* TEMP DISABLE
                    <script data-ha="js/ha">
                        var s = document.createElement('script');
                        s.type = 'text/javascript';
                        s.referrerPolicy = 'no-referrer-when-downgrade';
                        s.src = 'https://www.thewebhostingdir.com/twhdir-ha.js?' + new Date().getTime();
                        document.getElementsByTagName('head')[0].appendChild(s);
                    </script>
                    <div class="twhdirha">
                        <a href="https://www.thewebhostingdir.com/hosting-provider/massivegrid" rel="nofollow" style="display: block;" title="Hosting Assured Verified">
                            <img src="https://hostingassured.thewebhostingdir.com/hostingassuredseal" alt="Hosting Assured Verified" width="190" title="Hosting Assured Verified">
                        </a>
                        <a href="https://www.thewebhostingdir.com/vps-hosting-plans" rel="nofollow" style="font-size: 15px;color: #9d9d9d;font-weight:700;" target="_blank" title="TheWebHostingDIR.com">TheWebHostingDIR.com</a>
                    </div> *}
                </div>
            </div>
            <div class="m3 s12">
                <h5>Legal</h5>
                <ul class="legal">
                    <li>
                        <a href="https://massivegrid.com/terms-of-service/">Terms of Service</a>
                    </li>
                    <li>
                        <a href="https://massivegrid.com/data-privacy-cookies-policy/">Data Privacy &amp; Cookies Policy</a>
                    </li>
                    <li>
                        <a href="https://massivegrid.com/gdpr-compliance/">GDPR Compliance</a>
                    </li>
                </ul>
            </div>

            <div class="m5 s12">
                <h5>Partnerships</h5>
                <div class="logos">
                    
                    <div>
                        <img  src="\assets\img\Footer-Partners-1.png" alt="">
                    </div>
              
                </div>
            </div>
        </div>
        <div class="grid copy-wrap">
            <div class="m10 s12">
                <p class="copy">&copy; MassiveGRID Inc. {$date_year}. All rights reserved.</p>
            </div>
            <div class="m2 s12">
                <div class="social">
                    <a target="_blank" href="https://www.linkedin.com/company/massivegrid/">
                        <img src="https://massivegrid.com/wp-content/themes/massivegrid/assets/linkedin.svg" alt="">
                    </a>
                    <a target="_blank" href="https://www.facebook.com/MassiveGRID">
                        <img src="https://massivegrid.com/wp-content/themes/massivegrid/assets/facebook.svg" alt="">
                    </a>
                    <a target="_blank" href="https://twitter.com/massivegrid">
                        <img src="https://massivegrid.com/wp-content/themes/massivegrid/assets/twitter.svg" alt="">
                    </a>
                    <a target="_blank" href="https://www.youtube.com/channel/UC8bltJQo-T8zsyWOQzNXZSQ">
                        <img src="https://massivegrid.com/wp-content/themes/massivegrid/assets/youtube.svg" alt="">
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

    <div id="fullpage-overlay" class="w-hidden">
        <div class="outer-wrapper">
            <div class="inner-wrapper">
                <img src="{$WEB_ROOT}/assets/img/overlay-spinner.svg" alt="">
                <br>
                <span class="msg"></span>
            </div>
        </div>
    </div>

    <div class="modal system-modal fade" id="modalAjax" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"></h5>
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">{lang key='close'}</span>
                    </button>
                </div>
                <div class="modal-body">
                    {lang key='loading'}
                </div>
                <div class="modal-footer">
                    <div class="float-left loader">
                        <i class="fas fa-circle-notch fa-spin"></i>
                        {lang key='loading'}
                    </div>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        {lang key='close'}
                    </button>
                    <button type="button" class="btn btn-primary modal-submit">
                        {lang key='submit'}
                    </button>
                </div>
            </div>
        </div>
    </div>

    <form method="get" action="{$currentpagelinkback}">
        <div class="modal modal-localisation" id="modalChooseLanguage" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                        {if $languagechangeenabled && count($locales) > 1}
                            <h5 class="h5 pt-5 pb-3">{lang key='chooselanguage'}</h5>
                            <div class="row item-selector">
                                <input type="hidden" name="language" data-current="{$language}" value="{$language}" />
                                {foreach $locales as $locale}
                                    <div class="col-4">
                                        <a href="#" class="item{if $language == $locale.language} active{/if}" data-value="{$locale.language}">
                                            {$locale.localisedName}
                                        </a>
                                    </div>
                                {/foreach}
                            </div>
                        {/if}
                        {if !$loggedin && $currencies}
                            <p class="h5 pt-5 pb-3">{lang key='choosecurrency'}</p>
                            <div class="row item-selector">
                                <input type="hidden" name="currency" data-current="{$activeCurrency.id}" value="">
                                {foreach $currencies as $selectCurrency}
                                    <div class="col-4">
                                        <a href="#" class="item{if $activeCurrency.id == $selectCurrency.id} active{/if}" data-value="{$selectCurrency.id}">
                                            {$selectCurrency.prefix} {$selectCurrency.code}
                                        </a>
                                    </div>
                                {/foreach}
                            </div>
                        {/if}
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-default">{lang key='apply'}</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    {if !$loggedin && $adminLoggedIn}
        <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="btn btn-return-to-admin" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{lang key='adminmasqueradingasclient'} {lang key='logoutandreturntoadminarea'}{else}{lang key='adminloggedin'} {lang key='returntoadminarea'}{/if}">
            <i class="fas fa-redo-alt"></i>
            <span class="d-none d-md-inline-block">{lang key="admin.returnToAdmin"}</span>
        </a>
    {/if}

    {include file="$template/includes/generate-password.tpl"}

{if $templatefile|in_array:["clientregister","clientareadetails", "viewcart"]}
    {* START #251611 GST India - VAT/GST Input switch *}
    {if $templatefile eq "clientareadetails"}
        {$countrySelect = "select#country"}
    {else}
        {$countrySelect = "select#inputCountry"}
    {/if}
<script type="text/javascript">
    const countrySelect = jQuery('{$countrySelect}');
    const vat = jQuery('label:contains("VAT")');
    const gst = jQuery('label:contains("GST")');

    const europeanCountries = [
        'AT', 'BE', 'BG', 'CY', 'CZ', 'DE', 'DK', 'EE', 'ES', 'FI', 'FR', 'GB', 'GR', 'HU', 'HR', 'IE', 'IT', 'LT', 'LU', 'LV', 'MT', 'NL', 'PL', 'PT', 'RO', 'SE', 'SI', 'SK'
    ];

    function updateTaxFields(countryCode) {
        if (countryCode === "IN") {
            // Show GST, Hide VAT
            {if $templatefile|in_array:["clientareadetails"]}
            vat.parent().hide();
            gst.parent().show();
            {else}
            vat.parent().parent().hide();
            gst.parent().parent().show();
            {/if}

            jQuery('input#' + gst.attr('for')).prop("disabled", false);
            jQuery('input#' + vat.attr('for')).prop("disabled", true);

        } else if (europeanCountries.includes(countryCode)) {
            // Show VAT, Hide GST (Fixed GST hiding)
            {if $templatefile|in_array:["clientareadetails"]}
            vat.parent().show();
            gst.parent().hide();
            {else}
            vat.parent().parent().show();
            gst.parent().parent().hide();
            {/if}

            jQuery('input#' + vat.attr('for')).prop("disabled", false);
            jQuery('input#' + gst.attr('for')).prop("disabled", true);

        } else {
            // Hide both VAT & GST
            {if $templatefile|in_array:["clientareadetails"]}
            vat.parent().hide();
            gst.parent().hide();
            {else}
            vat.parent().parent().hide();
            gst.parent().parent().hide();
            {/if}

            jQuery('input#' + vat.attr('for')).prop("disabled", true);
            jQuery('input#' + gst.attr('for')).prop("disabled", true);
        }
    }

    // Initial Check on Page Load
    updateTaxFields(countrySelect.val());

    // Update on Country Selection Change
    countrySelect.on('change', function () {
        updateTaxFields(this.value);
    });
</script>

    {* END #251611 GST India - VAT/GST Input switch *}
{/if}

{literal}
    <!--Start of Tawk.to Script-->
    <script type="text/javascript">
        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
        (function(){
        var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
        s1.async=true;
        s1.src='https://embed.tawk.to/5c7f963a3341d22d9ce79a3a/1gf5put3s';
        s1.charset='UTF-8';
        s1.setAttribute('crossorigin','*');
        s0.parentNode.insertBefore(s1,s0);
        })();
    </script>
    <!--End of Tawk.to Script-->
{/literal}
    {$footeroutput}

</body>
</html>
