$(document).ready(
    $('.cart-item').change(function () {
        let parent = $(this);
        let name = $(this).find('h5').text();
        // size = $(this).find('i').val();
        // color = $(this).find('input[name=color]').val();
        let val = $(this).find('input[name=quantity]').val();
        // parent.focusout(function () {
        $.ajax({
            url: '/cart/',
            method: 'PUT',
            dataType: 'json',
            data: {
                'name': name,
                // 'size': size,
                // 'color': color,
                'quantity': val,
            },
            success: function (data) {
                $('#subtotal').html(data['data']);
                $('#total').html(data['data'])
            }
        })
        // })
    })
);
