/**
 * Created with PyCharm.
 * User: django
 * Date: 07.05.12
 * Time: 13:04
 * To change this template use File | Settings | File Templates.
 */
$(function() {


    $('.bar.progress.progress-striped.active').each(function() {
        var m = $(this).attr('m');

        if (m == 'Лекция') {
            $(this).addClass("progress-danger");
        }
        if (m == 'Проверка курсового проекта') {
            $(this).addClass("progress-indigo");
        }
        if (m == 'Консультация') {
            $(this).addClass("progress-success");
        }
        if (m == 'Практика') {
            $(this).addClass("progress-warning");
        }
        if (m == 'Курсовое проектирование') {
            $(this).addClass("progress-info");
        }
        if (m == 'Экзамен') {
            $(this).addClass("progress-cabal");
        }
    });

});