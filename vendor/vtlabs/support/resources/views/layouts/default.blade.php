<!DOCTYPE html>
<html lang="en">

<head>
    <title>Support</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="../assets/vendor/support/css/main.css">
</head>

<body>


    <div class="container-contact100" style="background-color: grey;">

        <div class="wrap-contact100">
            <div class="contact100-form-title" style="background-image: url(../assets/vendor/support/images/bg-01.jpg);">
                <span class="contact100-form-title-1">
                    Contact Us:
                </span>

                <table style="color: white; font-size: 20px; margin-bottom: 16px">
                    @if ($settings['support_email'])
                        <tr>
                            <td colspan="2">Email: </td>
                            <td>{{ $settings['support_email'] }}</td>
                        </tr>
                    @endif

                    @if ($settings['support_phone'])
                        <tr>
                            <td colspan="2">Phone: </td>
                            <td>{{ $settings['support_phone'] }}</td>
                        </tr>
                    @endif
                </table>

                <span class="contact100-form-title-2">
                    Also, Feel free to drop us a line below!
                </span>
            </div>

            <form class="contact100-form validate-form" id="contact-form">
                <div class="wrap-input100 validate-input" data-validate="Name is required">
                    <span class="label-input100">Name:</span>
                    <input id="contact-name" class="input100" type="text" name="name" placeholder="Enter full name"
                        required>
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                    <span class="label-input100">Email:</span>
                    <input id="contact-email" class="input100" type="email" name="email"
                        placeholder="Enter email addess" required>
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Message is required">
                    <span class="label-input100">Message:</span>
                    <input id="contact-message" class="input100" type="text" name="message"
                        placeholder="Your Comment..." required />
                    <span class="focus-input100"></span>
                </div>

                <div class="container-contact100-form-btn">
                    <button id="contact-button" class="contact100-form-btn">Submit</button>
                </div>
            </form>
        </div>
    </div>



    <div id="dropDownSelect1"></div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script type="text/javascript">
        // contact form submit
        $("#contact-form").submit(function(event) {
            event.preventDefault();
            $("#contact-button").text('Submitting...');
            var formData = {
                name: $("#contact-name").val(),
                email: $("#contact-email").val(),
                message: $("#contact-message").val(),
            };

            $.ajax({
                type: "POST",
                url: 'api/support',
                data: formData,
                dataType: "json",
                encode: true,
            }).done(function(data) {
                console.log('ok');
                $("#contact-name").val('');
                $("#contact-email").val('');
                $("#contact-message").val('');
                $("#contact-button").text('Submitted');
            });
        });
    </script>
</body>

</html>
