$(document).ready(function () {
    $('.cart-item').change(function () {
        let parent = $(this);
        let pk = $(this).find('.prodid').text();
        // size = $(this).find('i').val();
        // color = $(this).find('input[name=color]').val();
        let val = $(this).find('input[name=quantity]').val();
        // parent.focusout(function () {
        $.ajax({
            url: '/cart/',
            method: 'PUT',
            dataType: 'json',
            data: {
                'pk': pk,
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
            parent = $('body');
            if (data['status'])
                parent.append('<small id="myalert" class="alert alert-success">' + data['data'] + '</small>');
            else
                parent.append('<small id="myalert" class="alert alert-danger">' + data['data'] + '</small>');
            setTimeout(function () {
                $('#myalert').hide('slow', function () {
                    $('#myalert').remove();
                });
            }, 2500);
        }
    });
});

function cartAdd(pk, url, token, qty) {
    if (isNaN(qty))
        qty = '1';
    $.ajax({
        url: url,
        method: 'POST',
        dataType: 'json',
        data: {
            'csrfmiddlewaretoken': token,
            'pk': pk,
            'qty': qty
        },
        success: function (data) {
            parent = $('body');
            if (data['status'])
                parent.append('<small id="myalert" class="alert alert-success">' + data['data'] + '</small>');
            else
                parent.append('<small id="myalert" class="alert alert-danger">' + data['data'] + '</small>');
            setTimeout(function () {
                $('#myalert').hide('slow', function () {
                    $('#myalert').remove();
                });
            }, 2500);
        }
    })
}

function favAdd(url, pk, token) {
    $.ajax({
        url: url,
        method: 'POST',
        dataType: 'json',
        data: {
            'csrfmiddlewaretoken': token,
            'pk': pk
        },
        success: function (data) {
            parent = $('body');
            if (data['status'])
                parent.append('<small id="myalert" class="alert alert-success">' + data['data'] + '</small>');
            else
                parent.append('<small id="myalert" class="alert alert-danger">' + data['data'] + '</small>');
            setTimeout(function () {
                $('#myalert').hide('slow', function () {
                    $('#myalert').remove();
                });
            }, 2500);
        }
    })

}

jQuery(document).ready(function ($) {

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

$("#myform").submit(function (event) {

    /* stop form from submitting normally */
    event.preventDefault();

    /* get the action attribute from the <form action=""> element */
    var $form = $(this),
        url = $form.attr('action');

    /* Send the data using post with element id name and name2*/
    var posting = $.post(url, {
        name: $('#id_name').val(),
        email: $('#id_email').val(),
        rating: $('#id_rating').val(),
        comment: $('#id_comment').val(),
        product: $('#id_product').val()
    });

    /* Alerts the results */
    posting.done(function (data) {
        parent = $('body');
        if (data['status'])
            parent.append('<small id="myalert" class="alert alert-success">' + data['data'] + '</small>');
        else
            parent.append('<small id="myalert" class="alert alert-danger">' + data['data'] + '</small>');
        setTimeout(function () {
            $('#myalert').hide('slow', function () {
                $('#myalert').remove();
            });
        }, 2500);
    });
});