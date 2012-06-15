$(function() {
    var s = 0;
    var l = 0;

    $("a[rel*=leanModal]").leanModal({ top : 200, overlay : 0.45, closeButton: ".modal_close" });

    $('.del').css({'opacity': '0.2'});

    $('#mark td.mark').each(function() {
        var id_td = '#' + this.id + ' a';
        var marks = this.outerText.split(', ');
        change_color_of_mark(id_td, marks)
    });

    function change_color_of_mark(id_td, marks) {
        for (var index in marks){
            var id_mark = id_td + ' span.' + marks[index]
            switch (marks[index]) {
                case '5':
                    $(id_mark).css('color', 'red');
                    break;
                case '4':
                    $(id_mark).css('color', 'green');
                    break;
                case '3':
                    $(id_mark).css('color', 'blue');
                    break;
                case '2':
                    $(id_mark).css('color', 'black');
                    break;
            }
        }
    }

    $('td.mark').hover(
        function(){
            var expr = /(\d+)_(\d+)/;
            student = expr.exec($(this).attr('id'))[1];
            day = expr.exec($(this).attr('id'))[2];
        }
    );

    // добавление оценки
    $('#form_marks a').click(function() {
        var id_td = '#' + student + '_' + day  + ' a';
        $.get(
            'add_mark/'+ day + '/' + student + '/' + $(this).attr('mark') + '/',
            {},
            function(mark) {
                var html_marks = $(id_td).html();
                var span_mark = '<span class="' + mark + '">' + mark + '</span>';
                if (html_marks.trim()) {
                    span_mark = ', ' + span_mark;
                }
                $(id_td).html(html_marks.trim() + span_mark);
                change_color_of_mark(id_td, [mark]);
                $("#lean_overlay").fadeOut(200);
                $('#form_marks').css({"display":"none"});
            }
        );
    });

    $('#mark td.mark').mousemove(function() {
        $(this).css({'background-color': '#eee'});
    });

    $('#mark td.mark').mouseout(function() {
        $(this).css({'background-color': '#FFF'});
    });

    $('#days td.theme').mousemove(function() {
        $(this).css({'background-color': '#eee'});
    });

    $('#days td.theme').mouseout(function() {
        $(this).css({'background-color': '#FFF'});
    });




    $('#days td.theme').hover(function(){
        var expr = /day_(\d+)/;
        day = expr.exec($(this).attr('id'))[1]
    });

    // если тема уже есть, то подставляем в инпут
    $("a[name=form_themes]").click(function(){
        $('#form_themes input[name=describe]').attr('value', this.text)
    });

    // добавление темы к дню из расписания
    $('#form_themes a').click(function() {
        var describe = $('input[name=describe]').attr('value');

        $.post(
            'add_theme/'+ day + '/',
            {'describe': describe},
            function(data) {
                $('td#day_' + day + '.theme a').html(data);
                $("#lean_overlay").fadeOut(200);
                $('#form_themes').css({"display":"none"});
            }
        );
    });


//    // реализовать в hover
//    $('#days td.day').mousemove(function() {
//        $(this).css({'background-color': '#5D5'});
//        $('#add_theme_of_day').hide();
//    });
//    $('#days td.day').mouseout(function() {
//        $(this).css({'background-color': '#FFF'});
//    });



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