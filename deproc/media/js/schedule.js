/**
 * Created with PyCharm.
 * User: django
 * Date: 07.05.12
 * Time: 13:04
 * To change this template use File | Settings | File Templates.
 */
$(function() {

    $('b.type_hour').each(function() {
        var m = $.trim($(this).html());

        if (m == 'Л') {
            $(this).css({'color': '#dc143c'});
        }
        if (m == 'П') {
            $(this).css({'color': '#df73ff'});
        }
        if (m == 'К') {
            $(this).css({'color': '#77dd77'});
        }
        if (m == 'Э') {
            $(this).css({'color': '#ff7518'});
        }
    });




    $('b.type_hour').each(function() {
        var m = $.trim($(this).html());

        if (m == 'ЛК') {
            $(this).css({'color': '#dc143c'});
        }
        if (m == 'ПР') {
            $(this).css({'color': '#df73ff'});
        }
        if (m == 'КН') {
            $(this).css({'color': '#77dd77'});
        }
        if (m == 'ЭК') {
            $(this).css({'color': '#ff7518'});
        }
        if (m == 'КП') {
            $(this).css({'color': '#d2b48c'});
        }
        if (m == 'ПК') {
            $(this).css({'color': '#c9a0dc'});
        }
    });

});