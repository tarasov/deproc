/**
 * Created with PyCharm.
 * User: django
 * Date: 07.05.12
 * Time: 13:04
 * To change this template use File | Settings | File Templates.
 */
$(function() {

    $('td.group').hover(
        function(){
            plan = this.id
        }
    );

    $('#form_hours a').click(function() {
            window.location = 'add/'+ plan + '/' + $(this).attr('count_hours') + '/'
    });

    $('b.type_hour').each(function() {
        var m = $.trim($(this).html());

        if (m == 'лк') {
            $(this).css({'color': '#dc143c'});
        }
        if (m == 'пр') {
            $(this).css({'color': '#df73ff'});
        }
        if (m == 'кн') {
            $(this).css({'color': '#77dd77'});
        }
        if (m == 'эк') {
            $(this).css({'color': '#ff7518'});
        }
        if (m == 'кп') {
            $(this).css({'color': '#d2b48c'});
        }
        if (m == 'пк') {
            $(this).css({'color': '#c9a0dc'});
        }
    });

    $("a[rel*=leanModal]").leanModal({ top : 200, overlay : 0.45, closeButton: ".modal_close" });

});