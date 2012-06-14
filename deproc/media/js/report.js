/**
 * Created with PyCharm.
 * User: django
 * Date: 07.05.12
 * Time: 13:04
 * To change this template use File | Settings | File Templates.
 */
$(function() {


    $('div.bar progress').each(function() {
        var m = $.trim($(this).html());

        if (m == 'Лекция') {
//            $($(this).attr('class') + "progress-danger");
            $(this).addClass('progress-danger');
//            this.addClass('progress-danger')
//            $(this).hide();
//            this.hide();
        }
        if (m == 'Проверка курсового проекта') {
            $(this).css({'color': '#df73ff'});
        }
        if (m == 'Консультация') {
            $(this).css({'color': '#77dd77'});
        }
        if (m == 'Практика') {
            $(this).css({'color': '#ff7518'});
        }
        if (m == 'Курсовое проектирование') {
            $(this).css({'color': '#d2b48c'});
        }
        if (m == 'Экзамен') {
            $(this).css({'color': '#c9a0dc'});
        }
    });

});