$(function() {
    var s = 0;
    var l = 0;




    $('#selMark').hide();
    $('.del').css({'opacity': '0.2'});

    $('#mark td.mark').each(function() {
        var m = $.trim($(this).html());

        if (m == '5') {
            $(this).css({'color': 'red'});
        }
        if (m == '4') {
            $(this).css({'color': 'green'});
        }
        if (m == '3') {
            $(this).css({'color': 'blue'});
        }
        if (m == '2') {
            $(this).css({'color': 'black'});
        }
    });
    $('td.mark').hover(
        function(){
            var expr = /(\d+)_(\d+)/;
            student = expr.exec($(this).attr('id'))[1];
            day = expr.exec($(this).attr('id'))[2];


            // подсветка лабораторной работы
            themeElem = '#' + l;
            $('#days tr').css({'background-color': '#FFF'});
            $(themeElem).css({'background-color': '#9CF'});
            // подсветка фамилии студента
            studElem = '#stud_' + s;
            $('#mark td.name').css({'background-color': '#FFF'});
            $(studElem).css({'background-color': '#9CF'});
        },
        function(){
            $('#days tr').css({'background-color': '#FFF'})
            $('#mark td.name').css({'background-color': '#FFF'});

        }
    )
    // клик по ячейке с оценкой
    $('td.mark').click(function() {

        // перемещаем блок с оценками
        $('#selMark').show();
        $(this).offset(function(i, v) {
            $('#selMark').animate({'top': v.top + 0, 'left': v.left + 0}, 150);
        });
    });
    
    // закрыть окно с оценками
    $('#selMark .close a').click(function() {
        $('#selMark').hide();
    });
    
    // закрыть окно с формой.. студента
    $('#newStud .close a').click(function() {
        $('#newStud').hide();
    });
    
    // клик по оценке
    $('#selMark a').click(function() {
        var id_td = '#' + student + '_' + day;
        $.get(
            'add_mark/'+ day + '/' + student + '/' + $(this).attr('mark') + '/',
            {},
            function(data) {
                $(id_td).html(data);
                $('#selMark').hide();
            }
        );
    });

    $('#mark td.mark').mousemove(function() {
        $(this).css({'background-color': '#5D5'});
        $('#selMark').hide();      
    });
    
    $('#mark td.mark').mouseout(function() {
        $(this).css({'background-color': '#FFF'});
    });



    // Лабы

    $('#add_theme_of_day').hide()

//    $('#days td.theme').click(function(){
//        var theme = $(this).attr('l');
//        $('#mark td').show()
//        $('#mark th').show()
//        $('#mark td[l!='+ theme +']:not(.notHide)').hide();
//        $('#mark th[l!='+ theme +']:not(.notHide)').hide();
//    })

    $('#days td.theme').click(function(){
        var expr = /day_(\d+)/;
        var day = expr.exec($(this).attr('id'))[1]

        $('#add_theme_of_day a').attr('id', day);
        $('#add_theme_of_day').show()
        $(this).offset(function(i, v) {
            $('#add_theme_of_day').animate({'top': v.top + 0, 'left': v.left + 0}, 150);
        });
    });





    // добавление темы к дате
    $('#add_theme_of_day a').click(function() {
        var day = $(this).attr('id')
        var describe = $('input[name=describe]').attr('value');

//        alert('#day'+day)

        $.post(
            'add_theme/'+ day + '/',
            {'describe': describe},
            function(data) {
                $('td#' + day + '.theme').html(data);
                $('#add_theme_of_day').hide();
            }
        );
    });


    // реализовать в hover
    $('#days td.day').mousemove(function() {
        $(this).css({'background-color': '#5D5'});
        $('#add_theme_of_day').hide();
    });
    $('#days td.day').mouseout(function() {
        $(this).css({'background-color': '#FFF'});
    });





    // for csfr
    $('html').ajaxSend(function(event, xhr, settings) {
        function getCookie(name) {
            var cookieValue = null;
            if (document.cookie && document.cookie != '') {
                var cookies = document.cookie.split(';');
                for (var i = 0; i < cookies.length; i++) {
                    var cookie = jQuery.trim(cookies[i]);
                    // Does this cookie string begin with the name we want?
                    if (cookie.substring(0, name.length + 1) == (name + '=')) {
                        cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                        break;
                    }
                }
            }
            return cookieValue;
        }
        if (!(/^http:.*/.test(settings.url) || /^https:.*/.test(settings.url))) {
            // Only send the token to relative URLs i.e. locally.
            xhr.setRequestHeader("X-CSRFToken", getCookie('csrftoken'));
        }
    });


});