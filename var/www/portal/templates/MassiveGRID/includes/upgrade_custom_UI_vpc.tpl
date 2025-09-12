<script>
    $(document).ready(function () {
        // Dynamically assign classes to the related dropdowns.
        $('tr:contains("SUSE Linux") select').addClass('suseDropdown');
        $('tr:contains("cPanel") select').addClass('cpanelDropdown');
        $('tr:contains("Plesk") select').addClass('pleskDropdown');
        $('tr:contains("MS Windows") select').addClass('winDropdown');
        $('tr:contains("MS SQL") select').addClass('sqlDropdown');
        // cPanel Configurable options script starts here.
        $('tr:contains("Auto Select cPanel License") td input[type="checkbox"]').addClass('cpanelAutoSelectCheckbox');
        // Hide cPanel Auto Select checkbox.
        $('.cpanelAutoSelectCheckbox').attr('type', 'hidden');
        // Add Radio Buttons for "Auto Select cPanel License".
        $('tr:contains("Auto Select cPanel License") td:last-child').prepend('<span style="display:inline-table !important;"> <input id="cpanelAutoSelectYes" name="cpanelAutoSelect" type="radio" value="1">  <label style="margin-left:5px;" for="cpanelAutoSelectYes"> Yes </label> <br><input id="cpanelAutoSelectNo" name="cpanelAutoSelect" type="radio" value="0"> <label style="margin-left:5px;" for="cpanelAutoSelectNo"> No </label> </span>');
        // Hide wording next to the cPanel Auto Select checkbox.
        $('tr:contains("Auto Select cPanel License") td:last-child').contents().filter(function () {
            return (this.nodeType === 3);
        }).remove();
        // Assign "Please install cPanel for me" selected value from the radio buttons to the hidden checkbox.
        $('#cpanelAutoSelectYes').click(function () {
            if ($('#cpanelAutoSelectYes').is(':checked') || $('#cpanelInstallHelpYes').is(':checked')) {
                // #262911 automatically enabled / disable configurable option rows based on compatibility.
                // Disable Microsoft configurable options
                $('tr:contains("MS") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("MS")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("MS")').children().children().prop('disabled', true);
                $('tr:contains("MS") input[type="radio"]').prop('disabled', true);
                $('tr:contains("MS") select').css('background-color', 'rgb(0 0 0 / 8%)');
                // Disable SUSE configurable options
                $('tr:contains("SUSE Linux") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("SUSE Linux")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("SUSE Linux")').children().children().prop('disabled', true);
                $('tr:contains("SUSE Linux") select').css('background-color', 'rgb(0 0 0 / 8%)');
                // Disable Plesk configurable options
                $('tr:contains("Plesk") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("Plesk")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("Plesk")').children().children().prop('disabled', true);
                $('tr:contains("Plesk") select').css('background-color', 'rgb(0 0 0 / 8%)');
            }
        });
        $('#cpanelAutoSelectNo').click(function () {
            if (($('#cpanelAutoSelectNo').is(':checked') && $('#cpanelInstallHelpNo').is(':checked')) ||
                (!$('#cpanelAutoSelectNo').is(':checked') && $('#cpanelInstallHelpNo').is(':checked')) ||
                ($('#cpanelAutoSelectNo').is(':checked') && !$('#cpanelInstallHelpNo').is(':checked'))) {
                // #262911 automatically enabled / disable configurable option rows based on compatibility.
                // Enable Microsoft configurable options
                $('tr td:contains("MS")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("MS")').children().children().prop('disabled', false);
                $('tr:contains("MS") input[type="radio"]').prop('disabled', false);
                $('tr:contains("MS") select').css('background-color', '#fcc2467d');
                // Enable SUSE configurable options
                $('tr td:contains("SUSE Linux")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("SUSE Linux")').children().children().prop('disabled', false);
                $('tr:contains("SUSE Linux") select').css('background-color', '#fcc2467d');
                // Enable Plesk configurable options
                $('tr td:contains("Plesk")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("Plesk")').children().children().prop('disabled', false);
                $('tr:contains("Plesk") select').css('background-color', '#fcc2467d');
            }
        });
        // Add Radio Buttons for "Please install cPanel for me".
        $('tr:contains("Please install cPanel for me") td:last-child').prepend('<span style="display:inline-table !important;"> <input id="cpanelInstallHelpYes" name="cpanelInstallHelp" type="radio" value="1">  <label style="margin-left:5px;" for="cpanelInstallHelpYes"> Yes </label> <br><input id="cpanelInstallHelpNo" name="cpanelInstallHelp" type="radio" value="0"> <label style="margin-left:5px;" for="cpanelInstallHelpNo"> No </label> </span>');
        $('tr:contains("Please install cPanel for me") td input[type="checkbox"]').addClass('cpanelInstallHelpCheckbox');
        $('.cpanelInstallHelpCheckbox').attr('type', 'hidden'); // That way, we made it hidden but changeable.
        // Assign "Please install cPanel for me" selected value from the radio buttons to the hidden checkbox.
        $('#cpanelInstallHelpYes').click(function () {
            if ($('#cpanelInstallHelpYes').is(':checked') || $('#cpanelAutoSelectYes').is(':checked')) {
                // #262911 automatically enabled / disable configurable option rows based on compatibility.
                // Disable Microsoft configurable options
                $('tr:contains("MS") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("MS")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("MS")').children().children().prop('disabled', true);
                $('tr:contains("MS") input[type="radio"]').prop('disabled', true);
                $('tr:contains("MS") select').css('background-color', 'rgb(0 0 0 / 8%)');
                // Disable SUSE configurable options
                $('tr:contains("SUSE Linux") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("SUSE Linux")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("SUSE Linux")').children().children().prop('disabled', true);
                $('tr:contains("SUSE Linux") select').css('background-color', 'rgb(0 0 0 / 8%)');
                // Disable Plesk configurable options
                $('tr:contains("Plesk") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("Plesk")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("Plesk")').children().children().prop('disabled', true);
                $('tr:contains("Plesk") select').css('background-color', 'rgb(0 0 0 / 8%)');
            }
        });
        $('#cpanelInstallHelpNo').click(function () {
            if (($('#cpanelAutoSelectNo').is(':checked') && $('#cpanelInstallHelpNo').is(':checked')) ||
                (!$('#cpanelAutoSelectNo').is(':checked') && $('#cpanelInstallHelpNo').is(':checked')) ||
                ($('#cpanelAutoSelectNo').is(':checked') && !$('#cpanelInstallHelpNo').is(':checked'))) {
                // #262911 automatically enabled / disable configurable option rows based on compatibility.
                // Enable Microsoft configurable options
                $('tr td:contains("MS")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("MS")').children().children().prop('disabled', false);
                $('tr:contains("MS") input[type="radio"]').prop('disabled', false);
                $('tr:contains("MS") select').css('background-color', '#fcc2467d');
                // Enable SUSE configurable options
                $('tr td:contains("SUSE Linux")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("SUSE Linux")').children().children().prop('disabled', false);
                $('tr:contains("SUSE Linux") select').css('background-color', '#fcc2467d');
                // Enable Plesk configurable options
                $('tr td:contains("Plesk")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("Plesk")').children().children().prop('disabled', false);
                $('tr:contains("Plesk") select').css('background-color', '#fcc2467d');
            }
        });
        // cPanel changes should apply when the submit button is clicked.
        $('input[type="submit"]').click(function () {
            if ($('#cpanelAutoSelectYes').is(':checked')) {
                $('.cpanelAutoSelectCheckbox').attr('checked', true).val(1);
            } else if ($('#cpanelAutoSelectNo').is(':checked')) {
                $('.cpanelAutoSelectCheckbox').attr('checked', false).val(0);
            }
            // When both options in "Auto Select cPanel License" are unchecked.
            else if (!$('#cpanelAutoSelectYes').is(':checked') && !$('#cpanelAutoSelectNo').is(':checked')) {
                $('.cpanelAutoSelectCheckbox').val();
            }
        });
        $('input[type="submit"]').click(function () {
            if ($('#cpanelInstallHelpYes').is(':checked')) {
                $('.cpanelInstallHelpCheckbox').attr('checked', true).val(1);
                ;
            } else if ($('#cpanelInstallHelpNo').is(':checked')) {
                $('.cpanelInstallHelpCheckbox').attr('checked', false).val(0);
            }
            // When both options in "Please install cPanel for me" are unchecked.
            else if (!$('#cpanelInstallHelpNo').is(':checked') && !$('#cpanelInstallHelpYes').is(':checked')) {
                $('.cpanelInstallHelpCheckbox').val();
            }
        });
        // cPanel Configurable Options script ends here.

        // The following code should apply only in the products of 2021.
        // script which affects Microsoft Licenses with input type: Quantity.
        // Dynamically assign classes to the related classic quantity input fields of MS Windows and SQL Server Licenses.
        $('tr:contains("MS Windows Server Standard") input').addClass('winStdQty');
        $('tr:contains("MS Windows Server Datacenter") input').addClass('winDtcQty');
        $('tr:contains("MS SQL Server Web") input').addClass('sqlWebQty');
        $('tr:contains("MS SQL Server Standard") input').addClass('sqlStdQty');
        // Hide the classic quantity input fields of MS Windows and SQL Server Licenses.
        $('.winStdQty').attr('type', 'hidden');
        $('.winDtcQty').attr('type', 'hidden');
        $('.sqlWebQty').attr('type', 'hidden');
        $('.sqlStdQty').attr('type', 'hidden');
        // Add Radio Buttons for Microsoft Licenses.
        $('tr:contains("MS Windows Server Standard") td:last-child').prepend('<span style="display:inline-table !important;"> <input id="winStdYes" name="MS Windows Server" type="radio" value="">  <label style="margin-left:5px;" for="winStdYes"> Yes </label> - <span class="licenseQty"></span> <br><input id="winStdNo" name="MS Windows Server" type="radio" value=""> <label style="margin-left:5px;" for="winStdNo"> No </label></span>');
        $('tr:contains("MS Windows Server Datacenter") td:last-child').prepend('<span style="display:inline-table !important;"> <input id="winDtcYes" name="MS Windows Server" type="radio" value="">  <label style="margin-left:5px;" for="winDtcYes"> Yes </label> - <span class="licenseQty"></span> <br> <input id="winDtcNo" name="MS Windows Server" type="radio" value=""> <label style="margin-left:5px;" for="winDtcNo"> No </label></span>');
        $('tr:contains("MS SQL Server Web") td:last-child').prepend('<span style="display:inline-table !important;"> <input id="sqlWebYes" type="radio" name="MS SQL Server" value="">  <label style="margin-left:5px;" for="sqlWebYes"> Yes </label> - <span class="licenseQty"></span> <br> <input id="sqlWebNo" name="MS SQL Server" type="radio" value=""> <label style="margin-left:5px;" for="sqlWebNo"> No </label></span>');
        $('tr:contains("MS SQL Server Standard") td:last-child').prepend('<span style="display:inline-table !important;"> <input id="sqlStdYes" name="MS SQL Server" type="radio" value="">  <label style="margin-left:5px;" for="sqlStdYes"> Yes </label> - <span class="licenseQty"></span> <br> <input id="sqlStdNo" name="MS SQL Server" type="radio" value=""> <label style="margin-left:5px;" for="sqlStdNo"> No </label></span>');
        // Assign a distinctive class name to the input field for the quantity of cores.
        $('tr:contains("CPU vCores") input').addClass('coresQty');
        var licenseQty = $('.coresQty').val();
        $('.licenseQty').html(licenseQty);
        // When cores quantity changes so should the licenses quantity for Microsoft Licenses.
        $('.coresQty').change(function () {
            var licenseQty = $('.coresQty').val();
            $('.licenseQty').html(licenseQty);
            if ($('#winStdYes').is(':checked')) {
                $('.winStdQty').val($('.coresQty').val());
                $('.winDtcQty').val(0); // Zero the value of the opposing license.
                var licenseQty = $('.coresQty').val();
                $('.licenseQty').html(licenseQty);
            } else if ($('#winDtcYes').is(':checked')) {
                $('.winDtcQty').val($('.coresQty').val());
                $('.winStdQty').val(0); // Zero the value of the opposing license.
                var licenseQty = $('.coresQty').val();
                $('.licenseQty').html(licenseQty);
            } else if ($('#sqlStdYes').is(':checked')) {
                $('.sqlStdQty').val($('.coresQty').val());
                $('.sqlWebQty').val(0); // Zero the value of the opposing license.
                var licenseQty = $('.coresQty').val();
                $('.licenseQty').html(licenseQty);
            } else if ($('#sqlWebYes').is(':checked')) {
                $('.sqlWebQty').val($('.coresQty').val());
                $('.sqlStdQty').val(0); // Zero the value of the opposing license.
                var licenseQty = $('.coresQty').val();
                $('.licenseQty').html(licenseQty);
            }
        })
        // Automatically enable / disable MS License Radio Buttons based on the selected 'Yes' or 'No' radio option. And assign quantities based on the value entered in the CPU cores input field.
        $('#winStdYes').click(function () {
            if ($('#winStdYes').is(':checked')) {
                $('tr:contains("MS Windows Server Datacenter")').css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("MS Windows Server Datacenter")').prop('disabled', true);
                $('#winDtcYes').prop('disabled', true);
                $('#winDtcNo').prop('disabled', true);
                $('.winStdQty').val($('.coresQty').val());
                $('.winDtcQty').val(0); // Zero the value of the opposing license.
                var licenseQty = $('.coresQty').val();
                $('.licenseQty').html(licenseQty);
            }
        })
        $('#winStdNo').click(function () {
            if ($('#winStdNo').is(':checked')) {
                $('tr:contains("MS Windows Server Datacenter")').css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("MS Windows Server Datacenter")').prop('disabled', false);
                $('#winDtcYes').prop('disabled', false);
                $('#winDtcNo').prop('disabled', false);
                $('.winStdQty').val(0);
                var licenseQty = $('.coresQty').val();
                $('.licenseQty').html(licenseQty);
            }
        })
        $('#winDtcYes').click(function () {
            if ($('#winDtcYes').is(':checked')) {
                $('tr:contains("MS Windows Server Standard")').css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("MS Windows Server Standard")').prop('disabled', true);
                $('#winStdYes').prop('disabled', true);
                $('#winStdNo').prop('disabled', true);
                $('.winDtcQty').val($('.coresQty').val());
                $('.winStdQty').val(0); // Zero the value of the opposing license.
                var licenseQty = $('.coresQty').val();
                $('.licenseQty').html(licenseQty);
            }
        })
        $('#winDtcNo').click(function () {
            if ($('#winDtcNo').is(':checked')) {
                $('tr:contains("MS Windows Server Standard")').css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("MS Windows Server Standard")').prop('disabled', false);
                $('#winStdYes').prop('disabled', false);
                $('#winStdNo').prop('disabled', false);
                $('.winDtcQty').val(0);
                var licenseQty = $('.coresQty').val();
                $('.licenseQty').html(licenseQty);
            }
        })
        $('#sqlWebYes').click(function () {
            if ($('#sqlWebYes').is(':checked')) {
                $('tr:contains("MS SQL Server Standard")').css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("MS SQL Server Standard")').prop('disabled', true);
                $('#sqlStdYes').prop('disabled', true);
                $('#sqlStdNo').prop('disabled', true);
                $('.sqlWebQty').val($('.coresQty').val());
                $('.sqlStdQty').val(0); // Zero the value of the opposing license.
                var licenseQty = $('.coresQty').val();
                $('.licenseQty').html(licenseQty);
            }
        })
        $('#sqlWebNo').click(function () {
            if ($('#sqlWebNo').is(':checked')) {
                $('tr:contains("MS SQL Server Standard")').css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("MS SQL Server Standard")').prop('disabled', false);
                $('#sqlStdYes').prop('disabled', false);
                $('#sqlStdNo').prop('disabled', false);
                $('.sqlWebQty').val(0);
                var licenseQty = $('.coresQty').val();
                $('.licenseQty').html(licenseQty);
            }
        })
        $('#sqlStdYes').click(function () {
            if ($('#sqlStdYes').is(':checked')) {
                $('tr:contains("MS SQL Server Web")').css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("MS SQL Server Web")').prop('disabled', true);
                $('#sqlWebYes').prop('disabled', true);
                $('#sqlWebNo').prop('disabled', true);
                $('.sqlStdQty').val($('.coresQty').val());
                $('.sqlWebQty').val(0); // Zero the value of the opposing license.
                var licenseQty = $('.coresQty').val();
                $('.licenseQty').html(licenseQty);
            }
        })
        $('#sqlStdNo').click(function () {
            if ($('#sqlStdNo').is(':checked')) {
                $('tr:contains("MS SQL Server Web")').css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("MS SQL Server Web")').prop('disabled', false);
                $('#sqlWebYes').prop('disabled', false);
                $('#sqlWebNo').prop('disabled', false);
                $('.sqlStdQty').val(0);
                var licenseQty = $('.coresQty').val();
                $('.licenseQty').html(licenseQty);
            }
        })
        // Microsoft Licenses Quantity Adjustment when the Submit button is clicked.
        $('input[type="submit"]').click(function () {
            if ($('#winStdYes').is(':checked')) {
                $('.winStdQty').val($('.coresQty').val());
            }
            if ($('#winStdNo').is(':checked')) {
                $('.winStdQty').val(0);
            }
            if ($('#winDtcYes').is(':checked')) {
                $('.winDtcQty').val($('.coresQty').val());
            }
            if ($('#winDtcNo').is(':checked')) {
                $('.winDtcQty').val(0);
            }
            if ($('#sqlWebYes').is(':checked')) {
                $('.sqlWebQty').val($('.coresQty').val());
            }
            if ($('#sqlWebNo').is(':checked')) {
                $('.sqlWebQty').val(0);
            }
            if ($('#sqlStdYes').is(':checked')) {
                $('.sqlStdQty').val($('.coresQty').val());
            }
            if ($('#sqlStdNo').is(':checked')) {
                $('.sqlStdQty').val(0);
            }
        })
        // #262911 automatically enabled / disable configurable option rows based on compatibility.
        // SUSE Linux license compatible configurable options
        $('.suseDropdown').on('change', function () {
            if ($('.suseDropdown option:selected:contains("SUSE Linux Enterprise Server")').is(':selected')) {
                // Disable cPanel configurable options
                $('tr:contains("cPanel") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("cPanel")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("cPanel")').children().children().prop('disabled', true);
                $('tr:contains("cPanel") input[type="radio"]').prop('disabled', true);
                $('tr:contains("cPanel") select').css('background-color', 'rgb(0 0 0 / 8%)');

                // Disable Microsoft configurable options
                $('tr:contains("MS") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("MS")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("MS")').children().children().prop('disabled', true);
                $('tr:contains("MS") input[type="radio"]').prop('disabled', true);
                $('tr:contains("MS") select').css('background-color', 'rgb(0 0 0 / 8%)');

                // Disable Plesk configurable options
                $('tr:contains("Plesk") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("Plesk")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("Plesk")').children().children().prop('disabled', true);
                $('tr:contains("Plesk") select').css('background-color', 'rgb(0 0 0 / 8%)');
            } else if ($('.suseDropdown option:selected:contains("No SUSE")').is(':selected') || $('.suseDropdown option:selected:contains("No Change")').is(':selected')) {
                // Enable cPanel configurable options
                $('tr td:contains("cPanel") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("cPanel"):first').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("cPanel"):first').children().children().prop('disabled', false);
                $('tr:contains("cPanel") .cpanelDropdown').prop('disabled', false);
                $('tr:contains("cPanel") .cpanelDropdown').css('background-color', '#fcc2467d');

                // Enable Microsoft configurable options
                $('tr td:contains("MS")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("MS")').children().children().prop('disabled', false);
                $('tr:contains("MS") input[type="radio"]').prop('disabled', false);
                $('tr:contains("MS") select').css('background-color', '#fcc2467d');

                // Enable Plesk configurable options
                $('tr td:contains("Plesk")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("Plesk")').children().children().prop('disabled', false);
                $('tr:contains("Plesk") select').css('background-color', '#fcc2467d');
            }
        });
        //  MS Windows Server license compatible configurable options (Dropdown Select Type)
        $('.winDropdown').on('change', function () {
            if ($('.winDropdown option:selected:contains("MS Windows")').is(':selected') || $('.sqlDropdown option:selected:contains("MS SQL")').is(':selected')) {
                // Disable cPanel configurable options
                $('tr:contains("cPanel") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("cPanel")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("cPanel")').children().children().prop('disabled', true);
                $('tr:contains("cPanel") input').val(0);
                $('tr:contains("cPanel") input[type="radio"]').prop('disabled', true);
                $('tr:contains("cPanel") select').css('background-color', 'rgb(0 0 0 / 8%)');
                // Disable SUSE configurable options
                $('tr:contains("SUSE Linux") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("SUSE Linux")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("SUSE Linux")').children().children().prop('disabled', true);
                $('tr:contains("SUSE Linux") select').css('background-color', 'rgb(0 0 0 / 8%)');
                // Enable Plesk configurable options
                $('tr td:contains("Plesk")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("Plesk")').children().children().prop('disabled', false);
                $('tr:contains("Plesk") select').css('background-color', '#fcc2467d');
            } else if ($('.winDropdown option:selected:contains("No MS")').is(':selected') || $('.winDropdown option:selected:contains("No Change")').is(':selected') ||
                $('.sqlDropdown option:selected:contains("No MS")').is(':selected') || $('.sqlDropdown option:selected:contains("No Change")').is(':selected')) {
                // Enable cPanel configurable options
                $('tr td:contains("cPanel") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("cPanel"):first').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("cPanel"):first').children().children().prop('disabled', false);
                $('tr:contains("cPanel") .cpanelDropdown').prop('disabled', false);
                $('tr:contains("cPanel") .cpanelDropdown').css('background-color', '#fcc2467d');
                // Enable SUSE configurable options
                $('tr td:contains("SUSE Linux")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("SUSE Linux")').children().children().prop('disabled', false);
                $('tr:contains("SUSE Linux") select').css('background-color', '#fcc2467d');
            }
        });
        //  MS SQL Server license compatible configurable options (Dropdown Select Type)
        $('.sqlDropdown').on('change', function () {
            if ($('.winDropdown option:selected:contains("MS Windows")').is(':selected') || $('.sqlDropdown option:selected:contains("MS SQL")').is(':selected')) {
                // Disable cPanel configurable options
                $('tr:contains("cPanel") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("cPanel")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("cPanel")').children().children().prop('disabled', true);
                $('tr:contains("cPanel") input').val(0);
                $('tr:contains("cPanel") input[type="radio"]').prop('disabled', true);
                $('tr:contains("cPanel") select').css('background-color', 'rgb(0 0 0 / 8%)');
                // Disable SUSE configurable options
                $('tr:contains("SUSE Linux") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("SUSE Linux")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("SUSE Linux")').children().children().prop('disabled', true);
                $('tr:contains("SUSE Linux") select').css('background-color', 'rgb(0 0 0 / 8%)');
                // Enable Plesk configurable options
                $('tr td:contains("Plesk")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("Plesk")').children().children().prop('disabled', false);
                $('tr:contains("Plesk") select').css('background-color', '#fcc2467d');
            } else if ($('.winDropdown option:selected:contains("No MS")').is(':selected') || $('.winDropdown option:selected:contains("No Change")').is(':selected') ||
                $('.sqlDropdown option:selected:contains("No MS")').is(':selected') || $('.sqlDropdown option:selected:contains("No Change")').is(':selected')) {
                // Enable cPanel configurable options
                $('tr td:contains("cPanel") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("cPanel"):first').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("cPanel"):first').children().children().prop('disabled', false);
                $('tr:contains("cPanel") .cpanelDropdown').prop('disabled', false);
                $('tr:contains("cPanel") .cpanelDropdown').css('background-color', '#fcc2467d');
                // Enable SUSE configurable options
                $('tr:contains("SUSE Linux") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("SUSE Linux")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("SUSE Linux")').children().children().prop('disabled', false);
                $('tr:contains("SUSE Linux") select').css('background-color', '#fcc2467d');
            }
        });
        //  cPanel compatible configurable options
        $('.cpanelDropdown').on('change', function () {
            if ($('.cpanelDropdown option:selected:contains("cPanel")').is(':selected')) {
                // Disable Microsoft configurable options
                $('tr:contains("MS") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("MS")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("MS")').children().children().prop('disabled', true);
                $('tr:contains("MS") input[type="radio"]').prop('disabled', true);
                $('tr:contains("MS") select').css('background-color', 'rgb(0 0 0 / 8%)');
                // Disable SUSE configurable options
                $('tr:contains("SUSE Linux") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("SUSE Linux")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("SUSE Linux")').children().children().prop('disabled', true);
                $('tr:contains("SUSE Linux") select').css('background-color', 'rgb(0 0 0 / 8%)');
                // Disable Plesk configurable options
                $('tr:contains("Plesk") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("Plesk")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("Plesk")').children().children().prop('disabled', true);
                $('tr:contains("Plesk") select').css('background-color', 'rgb(0 0 0 / 8%)');
                // Enable Auto Select cPanel License
                $('tr td:contains("Auto Select cPanel License")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("Auto Select cPanel License")').children().children().prop('disabled', false);
                $('tr:contains("Auto Select cPanel License") input[type="radio"]').attr('disabled', false);
                // Enable Please install cPanel for me
                $('tr td:contains("Please install cPanel for me")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("Please install cPanel for me")').children().children().prop('disabled', false);
                $('tr:contains("Please install cPanel for me") input[type="radio"]').attr('disabled', false);
            }
            // When No cPanel / No change is selected.
            else if ($('.cpanelDropdown option:selected:contains("No cPanel")').is(':selected') || $('.cpanelDropdown option:selected:contains("No Change")').is(':selected')) {
                // Enable Microsoft configurable options
                $('tr td:contains("MS")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("MS")').children().children().prop('disabled', false);
                $('tr:contains("MS") input[type="radio"]').prop('disabled', false);
                $('tr:contains("MS") select').css('background-color', '#fcc2467d');
                // Enable SUSE configurable options
                $('tr td:contains("SUSE Linux")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("SUSE Linux")').children().children().prop('disabled', false);
                $('tr:contains("SUSE Linux") select').css('background-color', '#fcc2467d');
                // Enable Plesk configurable options
                $('tr td:contains("Plesk")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("Plesk")').children().children().prop('disabled', false);
                $('tr:contains("Plesk") select').css('background-color', '#fcc2467d');
                // Disable Auto Select cPanel License
                $('tr td:contains("Auto Select cPanel License")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("Auto Select cPanel License")').children().children().prop('disabled', true);
                $('tr:contains("Auto Select cPanel License") input[type="radio"]').attr('disabled', true);
                // Disable Please install cPanel for me
                $('tr td:contains("Please install cPanel for me")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("Please install cPanel for me")').children().children().prop('disabled', true);
                $('tr:contains("Please install cPanel for me") input[type="radio"]').attr('disabled', true);
            }
        });
        //  Plesk compatible configurable options
        $('.pleskDropdown').on('change', function () {
            if ($('.pleskDropdown option:selected:contains("Plesk")').is(':selected')) {
                // Enable Microsoft Configurable options
                $('tr:contains("MS") input[type="radio"]').prop('disabled', false);
                $('tr:contains("MS") select').css('background-color', '#fcc2467d');
                // Disable SUSE configurable options
                $('tr:contains("SUSE Linux") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("SUSE Linux")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("SUSE Linux")').children().children().prop('disabled', true);
                $('tr:contains("SUSE Linux") select').css('background-color', 'rgb(0 0 0 / 8%)');
                // Disable cPanel configurable options
                $('tr:contains("cPanel") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("cPanel")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("cPanel")').children().children().prop('disabled', true);
                $('tr:contains("cPanel") input').val(0);
                $('tr:contains("cPanel") input[type="radio"]').prop('disabled', true);
                $('tr:contains("cPanel") select').css('background-color', 'rgb(0 0 0 / 8%)');
            } else if ($('.pleskDropdown option:selected:contains("No Plesk")').is(':selected') || $('.pleskDropdown option:selected:contains("No Change")').is(':selected')) {
                // Enable SUSE configurable options
                $('tr td:contains("SUSE Linux") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("SUSE Linux")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("SUSE Linux")').children().children().prop('disabled', false);
                $('tr:contains("SUSE Linux") select').css('background-color', '#fcc2467d');
                // Enable cPanel configurable options
                $('tr td:contains("cPanel") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("cPanel"):first').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("cPanel"):first').children().children().prop('disabled', false);
                $('tr:contains("cPanel") .cpanelDropdown').prop('disabled', false);
                $('tr:contains("cPanel") .cpanelDropdown').css('background-color', '#fcc2467d');
            }
        });
        //  MS Windows Server license compatible configurable options (Quantity Input Type)
        $('tr:contains("MS Windows Server") input').change(function () {
            if (($('.winStdQty').val() >= 1) || ($('.sqlStdQty').val() >= 1) || ($('.winDtcQty').val() >= 1) || ($('.sqlWebQty').val() >= 1)) {
                // Disable cPanel configurable options
                $('tr:contains("cPanel") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("cPanel")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("cPanel")').children().children().prop('disabled', true);
                $('tr:contains("cPanel") input').val(0);
                $('tr:contains("cPanel") input[type="radio"]').prop('disabled', true);
                $('tr:contains("cPanel") select').css('background-color', 'rgb(0 0 0 / 8%)');
                // Disable SUSE configurable options
                $('tr:contains("SUSE Linux") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("SUSE Linux")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("SUSE Linux")').children().children().prop('disabled', true);
                $('tr:contains("SUSE Linux") select').css('background-color', 'rgb(0 0 0 / 8%)');
                // Enable Plesk configurable options
                $('tr td:contains("Plesk")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("Plesk")').children().children().prop('disabled', false);
                $('tr:contains("Plesk") select').css('background-color', '#fcc2467d');
            } else if (($('.winStdQty').val() <= 0) && ($('.sqlStdQty').val() <= 0) && ($('.winDtcQty').val() <= 0) && ($('.sqlWebQty').val() <= 0)) {
                // Enable cPanel configurable options
                $('tr td:contains("cPanel") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("cPanel"):first').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("cPanel"):first').children().children().prop('disabled', false);
                $('tr:contains("cPanel") .cpanelDropdown').prop('disabled', false);
                $('tr:contains("cPanel") .cpanelDropdown').css('background-color', '#fcc2467d');
                // Enable SUSE configurable options
                $('tr:contains("SUSE Linux") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("SUSE Linux")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("SUSE Linux")').children().children().prop('disabled', false);
                $('tr:contains("SUSE Linux") select').css('background-color', '#fcc2467d');
            }
        });
        //  MS SQL Server Standard Edition license compatible configurable options (Quantity Input Type)
        $('tr:contains("MS SQL Server") input').change(function () {
            if (($('.winStdQty').val() >= 1) || ($('.sqlStdQty').val() >= 1) || ($('.winDtcQty').val() >= 1) || ($('.sqlWebQty').val() >= 1)) {
                // Disable cPanel configurable options
                $('tr:contains("cPanel") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("cPanel")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("cPanel")').children().children().prop('disabled', true);
                $('tr:contains("cPanel") input').val(0);
                $('tr:contains("cPanel") input[type="radio"]').prop('disabled', true);
                $('tr:contains("cPanel") select').css('background-color', 'rgb(0 0 0 / 8%)');
                // Disable SUSE configurable options
                $('tr:contains("SUSE Linux") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("SUSE Linux")').parent().css('background-color', 'rgb(226, 226, 226)').css('color', '#888').css('opacity', '0.9').css('cursor', 'not-allowed');
                $('tr:contains("SUSE Linux")').children().children().prop('disabled', true);
                $('tr:contains("SUSE Linux") select').css('background-color', 'rgb(0 0 0 / 8%)');
                // Enable Plesk configurable options
                $('tr td:contains("Plesk")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("Plesk")').children().children().prop('disabled', false);
                $('tr:contains("Plesk") select').css('background-color', '#fcc2467d');
            } else if (($('.winStdQty').val() <= 0) && ($('.sqlStdQty').val() <= 0) && ($('.winDtcQty').val() <= 0) && ($('.sqlWebQty').val() <= 0)) {
                // Enable cPanel configurable options
                $('tr td:contains("cPanel") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("cPanel"):first').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("cPanel"):first').children().children().prop('disabled', false);
                $('tr:contains("cPanel") .cpanelDropdown').prop('disabled', false);
                $('tr:contains("cPanel") .cpanelDropdown').css('background-color', '#fcc2467d');
                // Enable SUSE configurable options
                $('tr:contains("SUSE Linux") option:contains("No Change")').prop('selected', true);
                $('tr td:contains("SUSE Linux")').parent().css('background-color', '#fff').css('color', '#333').css('opacity', '1').css('cursor', 'default');
                $('tr:contains("SUSE Linux")').children().children().prop('disabled', false);
                $('tr:contains("SUSE Linux") select').css('background-color', '#fcc2467d');
            }
        });
        // Table Re-ordering of License Rows
        $('tr:contains("MS SQL Server Web Edition")').insertAfter('tr:contains("MS Windows Server Datacenter Edition")');
        $('tr:contains("MS SQL Server Standard Edition")').insertAfter('tr:contains("MS SQL Server Web Edition")');
        $('tr:contains("SUSE Linux License")').insertAfter('tr:contains("Plesk License")');
        $('<tr style="text-align:center;"><th></th><th> Microsoft License Options </th> <th style="text-align:right;padding-right:2%;"> <div id="ms-rows-hide-btn" class="th-toggle-row-btn"><i class="fas fa-chevron-up panel-minimise pull-right"></i></div> <div id="ms-rows-show-btn" style="display:none;" class="th-toggle-row-btn"> <i class="fas fa-chevron-down panel-minimise pull-right"></i></div></th></tr>').insertBefore('tr:contains("MS Windows Server Standard Edition licence")');
        $('<tr style="text-align:center;"><th></th><th> Plesk License Options </th> <th style="text-align:right;padding-right:2%;"> <div id="plesk-rows-hide-btn" class="th-toggle-row-btn"><i class="fas fa-chevron-up panel-minimise pull-right"></i></div> <div id="plesk-rows-show-btn" style="display:none;" class="th-toggle-row-btn"> <i class="fas fa-chevron-down panel-minimise pull-right"></i></div></th></tr>').insertBefore('tr.pleskvpswebadminedition');
        $('<tr style="text-align:center;"><th></th><th> SUSE Linux License Options </th> <th style="text-align:right;padding-right:2%;"> <div id="suse-rows-hide-btn" class="th-toggle-row-btn"><i class="fas fa-chevron-up panel-minimise pull-right"></i></div> <div id="suse-rows-show-btn" style="display:none;" class="th-toggle-row-btn"> <i class="fas fa-chevron-down panel-minimise pull-right"></i></div></th></tr>').insertBefore('tr.suselinuxenterpriseserver-upto2vcores-standardsubscription');
        $('<tr style="text-align:center;"><th></th><th> cPanel License Options </th> <th style="text-align:right;padding-right:2%;"> <div id="cpanel-rows-hide-btn" class="th-toggle-row-btn"><i class="fas fa-chevron-up panel-minimise pull-right"></i></div> <div id="cpanel-rows-show-btn" style="display:none;" class="th-toggle-row-btn"> <i class="fas fa-chevron-down panel-minimise pull-right"></i></div></th></tr>').insertBefore('tr:contains("cPanel License"):first');
        // Add tooltips
        $('<th><a href="javascript:void(0);" class="tooltip-qm" id="ms-tooltip" data-toggle="tooltip" title="" data-original-title="The quantity of Microsoft Licenses is defined automatically by the number of CPU vCores entered. Select -Yes- if you want to change the number of licenses or -No- if you want to eliminate the number of licenses and disable the configurable option. MS licenses can be offered alongside Plesk licenses but they are incompatible with cPanel and SUSE Linux licenses."><span><i class="fas fa-info-circle"></i></span></a></th>').insertAfter('tr th:contains("Microsoft License Options")');
        $('<th><a href="javascript:void(0);" class="tooltip-qm" id="plesk-tooltip" data-toggle="tooltip" title="" data-original-title="Plesk is a commercial, control panel based, web hosting platform that allows server administrators to set up new websites, reseller and e-mail accounts, as well as DNS entries, through a friendly web interface. Plesk Licenses can be offered alongside MS licenses but they are incompatible with cPanel and SUSE Licenses."><span><i class="fas fa-info-circle"></i></span></a></th>').insertAfter('tr th:contains("Plesk License Options")');
        $('<th><a href="javascript:void(0);" class="tooltip-qm" id="suse-tooltip" data-toggle="tooltip" title="" data-original-title="SUSE Linux Enterprise Server is charged monthly, per number of virtual cores. For non-production and test environments, we recommend Standard Subscription. For Production and Business-Critical environments, we recommend Priority Subscription. For more details on subscription, please visit the relevant SUSE page (https://www.suse.com/support/). SUSE Linux licenses are not compatible with cPanel, Plesk, MS Windows Server and MS SQL Server Licenses."><span><i class="fas fa-info-circle"></i></span></a></th>').insertAfter('tr th:contains("SUSE Linux License Options")');
        $('<th><a href="javascript:void(0);" class="tooltip-qm" id="cpanel-tooltip" data-toggle="tooltip" title="" data-original-title="You can purchase a cPanel License based on the amount of accounts you need. The pricing regarding a cPanel License is set depending on the number of cPanel accounts of your service. If you have selected a cPanel License and you need help with the installation of your cPanel server please select the option: Please install cPanel for me. cPanel-related configurable options and licenses are not compatible with Plesk, SUSE Linux and MS Windows and MS SQL Server Licenses."><span><i class="fas fa-info-circle"></i></span></a></th>').insertAfter('tr th:contains("cPanel License Options")');

        if ($('.winDropdown') || $('.sqlDropdown')) {
            winDropdownExists = document.querySelector('.winDropdown');
            sqlDropdownExists = document.querySelector('.sqlDropdown');
            if (winDropdownExists != null && sqlDropdownExists != null) {
                // Hide Microsoft Licenses Radio buttons when inputs of type dropdown are present in the row.
                if (winDropdownExists.classList.contains('winDropdown') || sqlDropdownExists.classList.contains('winDropdown')) {
                    $('tr:contains("MS Windows Licen") input[type="radio"]').parent().remove();
                    $('tr:contains("MS SQL Licen") input[type="radio"]').parent().remove();
                    // Display Appropriate Tooltip
                    $('#ms-tooltip').attr('data-original-title', 'MS licenses can be offered alongside Plesk licenses but they are incompatible with cPanel and SUSE Linux licenses.');
                }
            }
        }
        // Toggle buttons functionality script
        // Microsoft Options Rows
        $('#ms-rows-hide-btn').click(function () {
            $('tr td:contains("MS Windows Server Standard")').parent().css('display', 'none');
            $('tr td:contains("MS Windows Server Datacenter")').parent().css('display', 'none');
            $('tr td:contains("MS SQL Server Web")').parent().css('display', 'none');
            $('tr td:contains("MS SQL Server Standard")').parent().css('display', 'none');
            $('#ms-rows-hide-btn').css('display', 'none');
            $('#ms-rows-show-btn').css('display', 'block');
        });
        $('#ms-rows-show-btn').click(function () {
            $('tr td:contains("MS Windows Server Standard")').parent().css('display', 'table-row');
            $('tr td:contains("MS Windows Server Datacenter")').parent().css('display', 'table-row');
            $('tr td:contains("MS SQL Server Web")').parent().css('display', 'table-row');
            $('tr td:contains("MS SQL Server Standard")').parent().css('display', 'table-row');
            $('#ms-rows-show-btn').css('display', 'none');
            $('#ms-rows-hide-btn').css('display', 'block');
        });
        // Plesk Options Rows
        $('#plesk-rows-hide-btn').click(function () {
            $('tr td:contains("Plesk")').parent().css('display', 'none');
            $('#plesk-rows-hide-btn').css('display', 'none');
            $('#plesk-rows-show-btn').css('display', 'block');
        });
        $('#plesk-rows-show-btn').click(function () {
            $('tr td:contains("Plesk")').parent().css('display', 'table-row');
            $('#plesk-rows-show-btn').css('display', 'none');
            $('#plesk-rows-hide-btn').css('display', 'block');
        });
        // SUSE Linux Options Rows
        $('#suse-rows-hide-btn').click(function () {
            $('tr td:contains("SUSE")').parent().css('display', 'none');
            $('#suse-rows-hide-btn').css('display', 'none');
            $('#suse-rows-show-btn').css('display', 'block');
        });
        $('#suse-rows-show-btn').click(function () {
            $('tr td:contains("SUSE")').parent().css('display', 'table-row');
            $('#suse-rows-show-btn').css('display', 'none');
            $('#suse-rows-hide-btn').css('display', 'block');
        });
        // cPanel Options Rows
        $('#cpanel-rows-hide-btn').click(function () {
            $('tr td:contains("cPanel License")').parent().css('display', 'none');
            $('tr td:contains("Auto Select cPanel License")').parent().css('display', 'none');
            $('tr td:contains("Please install cPanel for me")').parent().css('display', 'none');
            $('#cpanel-rows-hide-btn').css('display', 'none');
            $('#cpanel-rows-show-btn').css('display', 'block');
        });
        $('#cpanel-rows-show-btn').click(function () {
            $('tr td:contains("cPanel License")').parent().css('display', 'table-row');
            $('tr td:contains("Auto Select cPanel License")').parent().css('display', 'table-row');
            $('tr td:contains("Please install cPanel for me")').parent().css('display', 'table-row');
            $('#cpanel-rows-show-btn').css('display', 'none');
            $('#cpanel-rows-hide-btn').css('display', 'block');
        });
    });
</script>