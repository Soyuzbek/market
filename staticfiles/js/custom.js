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
                if($('#myalert').length <= 0) parent.append('<small id="myalert" class="alert alert-success" style="z-index: 999;">' + data['data'] + '</small>');
            else
               if($('#myalert').length <= 0) parent.append('<small id="myalert" class="alert alert-danger" style="z-index: 999;">' + data['data'] + '</small>');
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
                if($('#myalert').length <= 0) parent.append('<small id="myalert" class="alert alert-success" style="z-index: 999;">' + data['data'] + '</small>');
            else
               if($('#myalert').length <= 0) parent.append('<small id="myalert" class="alert alert-danger" style="z-index: 999;">' + data['data'] + '</small>');
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
                if($('#myalert').length <= 0) parent.append('<small id="myalert" class="alert alert-success" style="z-index: 999;">' + data['data'] + '</small>');
            else
               if($('#myalert').length <= 0) parent.append('<small id="myalert" class="alert alert-danger" style="z-index: 999;">' + data['data'] + '</small>');
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


$('.open-modal').click(function(e)
{
    e.preventDefault();
    $('#mymodal').modal('show');
});
