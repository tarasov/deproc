/**
 * Created with PyCharm.
 * User: django
 * Date: 07.05.12
 * Time: 13:04
 * To change this template use File | Settings | File Templates.
 */
$(function() {
    $('a.visible_report .hide').hide();

    $('a.visible_report .show').click(function() {
        var url = $(this.parentNode).attr('rel');
        var html = '';
        var expr = /(.+)_(.+)/;

        $.get(
            url,
            {},
            function(data) {
                if (data != '{}') {



                    html = ''
                } else {
                    html = '<h3>Вас обдилили, вы кто? Для вас нету тарификации!</h3>';
                }
//                {% for keys,values in report.items %}
//                    <h3 style="color: #339bb9;"> {{ keys.0 }} {{ keys.1 }}</h3> <hr/>
//                    {% for key, value in values.items %}
//
//                    {% if value.vsego != 0 %}
//                        {{ key }}: <b>{{ value.vidano }}/{{ value.vsego }}</b>
//
//                    <div class="row-fluid">
//                        <div class="bar progress progress-striped active " m="{{ key }}" style="margin-bottom: 9px">
//                            <div class="bar" style="width: {{ value.procent }}%"><span class="pull-right" style="color: #080808;"></span></div>
//                        </div>
//                        </div>
//
//                        {% endif %}
//                        {% endfor %}
//                        <hr/>
//                        {% endfor %}

                var tr = JSON.parse(data);
                for(var key in tr) {
                    var group = expr.exec(key)[1];
                    var discipline = expr.exec(key)[2];
                    html += '<div class="row-fluid">';
                    html += '<h3 style="color: #339bb9;"> '+ group +' ' + discipline + '</h3><hr/>'
                    for (var value in tr[key]) {
                        if (tr[key][value]['vsego'] != 0 ) {
                            html += value + ': <b>' + tr[key][value]['vidano'] + '/' + tr[key][value]['vsego'] + '</b>'
                            if (tr[key][value] != '' ) {
                                html += '   <div class="bar progress progress-striped active " m="' + value + '" style="margin-bottom: 9px">';
                                html += '       <div class="bar" style="width: ' + tr[key][value]['procent'] + '%"><span class="pull-right" style="color: #080808;"></span></div>';
                                html += '   </div>';
                            }
                        }
                    }
                }
                html += '</div>';
                $('a.visible_report .show').hide();
                $('a.visible_report .hide').show();
                $('#report').html(html);
                color_typehours()
            }
        )
    });

    $('a.visible_report .hide').click(function() {
        $('#report').html('');
        $('a.visible_report .show').show();
        $('a.visible_report .hide').hide();
    });

    color_typehours();

    function color_typehours() {
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
    }
});
