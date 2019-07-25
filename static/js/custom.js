$(document).ready(function () {
    $('.cart-item').change(function () {
        let parent = $(this);
        let id = $(this).find('.prodid').text();
        // size = $(this).find('i').val();
        // color = $(this).find('input[name=color]').val();
        let val = $(this).find('input[name=quantity]').val();
        // parent.focusout(function () {
        $.ajax({
            url: '/cart/',
            method: 'PUT',
            dataType: 'json',
            data: {
                'id': id,
                // 'size': size,
                // 'color': color,
                'qty': val,
            },
            success: function (data) {
                $('#subtotal').html(data['data'] + ' som');
                $('#total').html(data['data'] + ' som')
            }
        })
    });
    setTimeout(function () {
        $('.messagelist').hide('slow');
    }, 2500);
    // $('.messagelist').delay(14500000000).hide();
});
$('#cartDelete').click(function () {
    let path = window.location.href;
    let token = $('input[name="csrfmiddlewaretoken"]').val();
    $.ajax({
        url: path,
        method: 'DELETE',
        dataType: 'json',
        data: {
            'csrfmiddlewaretoken': token,
        },
        success: function (data) {
            $('#cartList').html('');
            $('#subtotal').html('0 som');
            $('#total').html('0 som');
            parent = $('body');
            if (data['status'])
                if ($('#myalert').length <= 0) parent.append('<small id="myalert" class="alert alert-success" style="z-index: 999;">' + data['data'] + '</small>');
                else if ($('#myalert').length <= 0) parent.append('<small id="myalert" class="alert alert-danger" style="z-index: 999;">' + data['data'] + '</small>');
            setTimeout(function () {
                $('#myalert').hide('slow', function () {
                    $('#myalert').remove();
                });
            }, 2500);
        }
    });
});

function cartAdd(id, url, token, qty) {
    if (isNaN(qty))
        qty = '1';
    $.ajax({
        url: url,
        method: 'POST',
        dataType: 'json',
        data: {
            'csrfmiddlewaretoken': token,
            'id': id,
            'qty': qty
        },
        success: function (data) {
            parent = $('body');
            if (data['status'])
                if ($('#myalert').length <= 0) parent.append('<small id="myalert" class="alert alert-success" style="z-index: 999;">' + data['data'] + '</small>');
                else if ($('#myalert').length <= 0) parent.append('<small id="myalert" class="alert alert-danger" style="z-index: 999;">' + data['data'] + '</small>');
            setTimeout(function () {
                $('#myalert').hide('slow', function () {
                    $('#myalert').remove();
                });
            }, 2500);
        }
    })
}

function favAdd(url, slug, token) {
    $.ajax({
        url: url,
        method: 'POST',
        dataType: 'json',
        data: {
            'csrfmiddlewaretoken': token,
            'slug': slug
        },
        success: function (data) {
            parent = $('body');
            if (data['status'])
                if ($('#myalert').length <= 0) parent.append('<small id="myalert" class="alert alert-success" style="z-index: 999;">' + data['data'] + '</small>');
                else if ($('#myalert').length <= 0) parent.append('<small id="myalert" class="alert alert-danger" style="z-index: 999;">' + data['data'] + '</small>');
            setTimeout(function () {
                $('#myalert').hide('slow', function () {
                    $('#myalert').remove();
                });
            }, 2500);
        }
    })

}

jQuery(document).ready(function ($) {
    setTimeout(function () {
        $('#danger').hide('slow', function () {
            $('#danger').remove();
        });
    }, 2500);

    $(".btnrating").on('click', (function (e) {
        let previous_value = $('#id_rating').val();

        let selected_value = $(this).attr("data-attr");
        $("#id_rating").val(selected_value);

        $(".selected-rating").empty();
        $(".selected-rating").html(selected_value);

        for (i = 1; i <= selected_value; ++i) {
            $("#rating-star-" + i).toggleClass('btn-warning');
            $("#rating-star-" + i).toggleClass('btn-default');
        }

        for (ix = 1; ix <= previous_value; ++ix) {
            $("#rating-star-" + ix).toggleClass('btn-warning');
            $("#rating-star-" + ix).toggleClass('btn-default');
        }

    }));


});

$('.open-modal').click(function (e) {
    e.preventDefault();
    $('#mymodal').modal('show');
});
$(document).ready(function () {
    jQuery.validator.addMethod(
        "regex",
        function (value, element, regexp) {
            alert('inside add method');
            if (regexp.test(value)) {
                console.log(regexp);
                console.log(value);
                console.log(element);
                console.log(true);

                return true;
            } else {
                console.log(regexp);
                console.log(value);
                console.log(element);
                console.log(false);
                return false

            }
        },
        "Please check your input."
    );
    // validation of the subscribe form
    $('form[id="email-form"]').validate({
        rules: {
            email: {
                required: true,
                email: true,
            }
        },
        messages: {
            email: "<small class='invalid feedback text-white'> gettext('Enter a valid email')</small>",
        },
        submitHandler: function (form) {
            $.ajax({
                url: $(form).attr('action'),
                method: 'post',
                datatype: 'json',
                data: {
                    email: $('#subs-email').val(),
                    csrfmiddlewaretoken: $('input[name="csrfmiddlewaretoken"]').val()
                },
                success: function (data) {
                    msg = 'Your review added successfully';
                    $('body').append('<small id="myalert" class="alert alert-success">' + msg + '</small>');
                    setTimeout(function () {
                        $('#myalert').hide('slow', function () {
                            $('#myalert').remove();
                        });
                    }, 2500);

                },
                error: function (data) {
                    msg = 'This email is already exists!';
                    $('body').append('<small id="myalert" class="alert alert-danger">' + msg + '</small>');
                    setTimeout(function () {
                        $('#myalert').hide('slow', function () {
                            $('#myalert').remove();
                        });
                    }, 2500);
                }
            });
            return false;
        }
    });
    // validation of the review form
    $('#review-form').validate({
        rules: {
            name: {
                required: true,
                minlength: 3
            },
            email: {
                required: true,
                email: true
            },
            rating: {
                required: true,
            },
            comment: {
                required: false,
                minlength: 25
            }
        },
        messages: {
            name: {
                required: "<small class='invalid feedback text-danger'>gettext('Please enter your name') </small>",
                minlength: "<small class='invalid feedback text-danger'>gettext('The name can not be short than 3 character') </small>"
            },
            email: {
                required: "<small class='invalid feedback text-danger'> The email field can not be empty </small>",
                email: "<small class='invalid feedback text-danger'> Please enter a valid email </small>"
            },
            rating: "<small class='invalid feedback text-danger'> Please rate us </small>",
            comment: "<small class='invalid feedback text-danger'> Comment must contain at least 25 character"
        },
        submitHandler: function (form) {
            let $form = $(form),
                url = $form.attr('action');

            /* Send the data using post with element id name and name2*/
            let request = $.ajax({
                url: url,
                method: 'POST',
                dataType: 'json',
                data: {
                    name: $('#id_name').val(),
                    email: $('#id_email').val(),
                    rating: $('#id_rating').val(),
                    comment: $('#id_comment').val(),
                    product: $('#id_product').val(),
                    csrfmiddlewaretoken: $('input[name="csrfmiddlewaretoken"]').val()
                },
            });
            request.done(function (msg) {
                $('#mymodal').modal('hide');
                parent = $('body');
                msg = 'Your review added successfully';
                parent.append('<small id="myalert" class="alert alert-success">' + msg + '</small>');
                setTimeout(function () {
                    $('#myalert').hide('slow', function () {
                        $('#myalert').remove();
                    });
                }, 2500);
            });
            request.fail(function (jqXHR, status) {
                let temp = JSON.parse(jqXHR['responseText']);
                console.log(temp);
                parent = $form;
                if (temp != null)
                    for (let i = 0; i < temp.email.length; i++) {
                        parent.append('<small id="myalert" class="alert alert-danger">' + temp.email[i] + '</small>');
                        setTimeout(function () {
                            $('#myalert').hide('slow', function () {
                                $('#myalert').remove();
                            });
                        }, 2500);
                    }

            });
            return false;
        }
    });
    // Checkout form validation
    $('#checkout-form').validate({
        rule: {
            first_name: {
                required: true,
                minlength: 3
            },
            last_name: {
                required: true,
                minlength: 4
            },
            email: {
                required: true,
                email: true,
            },
            address: {
                required: true,
                minlength: 8,
                maxlength: 254
            },
            phone: {
                required: true,
                minlength: 12,
                regex: "\+996?\d{10,15}",
                digits: true
            },
            comment: {
                required: false,
                minlength: 25
            }
        },
        messages: {
            first_name: {
                required: "<small class='invalid feedback text-danger'> Please enter your name </small>",
                minlength: "<small class='invalid feedback text-danger'> The name can't be short than 3 character </small>"
            },
            last_name: {
                required: "<small class='invalid feedback text-danger'> Last name can't be blank </small>",
                minlength: "<small class='invalid feedback text-danger'> The last name can't be short than 4 character </small>"
            },
            email: {
                required: "<small class='invalid feedback text-danger'> Enter your email </small>",
                email: "<small class='invalid feedback text-danger'> Please enter a valid email </small>",
                maxlength: "<small class='invalid feedback text-danger'> Enter shorter email </small>"
            },
            address: {
                required: "<small class='invalid feedback text-danger'> We can't take order without address </small>",
                minlength: "<small class='invalid feedback text-danger'> The address can't be short than 8 digits </small>",
                maxlength: "<small class='invalid feedback text-danger'> Enter shorter address </small>"
            },
            phone: {
                required: "<small class='invalid feedback text-danger'> Enter your phone number </small>",
                minlength: "<small class='invalid feedback text-danger'> Phone can't be shorter than 12 digits </small>",
                regex: "<small class='invalid feedback text-danger'> You just entered invalid phone format </small>"
            },
            comment: {
                minlength: "<small class='invalid feedback text-danger'> Comment must contain at least 25 character </small>"
            }
        },
        submitHandler: function (form) {
            form.phone.unmusk();
            form.submit();
        }
    })
});