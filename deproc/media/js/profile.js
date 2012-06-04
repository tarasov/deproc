$(function() {
    $('a.visible_schedule .hide').hide();

    $('a.visible_schedule .show').click(function() {
        var url = $(this.parentNode).attr('rel');
        var now = new Date();
//        var curr_date = now.getDate();
//        var curr_month = now.getMonth();
        var curr_date = '14';
        var curr_month = '05';
        var curr_year = now.getFullYear();
        var html = '' +
            '<table class="schedule span5">' +
            '<tr>' +
                '<th>Пара</th><th>Группа</th><th>Предмет</th>' +
            '</tr>';
        $.get(
            url,
            {'day': curr_date + '.' + curr_month + '.' + curr_year},
            function(data) {
                var tr = JSON.parse(data);
                for(var key in tr) {
                    for (var value in tr[key]) {
                        if (tr[key][value] != '' ) {
                            html += '<tr><td>' + value + '</td>';
                            html += '<td>' + tr[key][value][1].toString() + '</td>';
                            html += '<td>' + tr[key][value][0] + ' (' + tr[key][value][2] + ')</td>';
                        html += '</tr>';
                        }
                    }
                    html += '</table>';
                    $('a.show_schedule span').html('скрыть');
                    $('a.visible_schedule .show').hide();
                    $('a.visible_schedule .hide').show();
                    $('p#schedule').html(html);
                }
            }
        )
    });

    $('a.visible_schedule .hide').click(function() {
        $('p#schedule').html('');
        $('a.visible_schedule .show').show();
        $('a.visible_schedule .hide').hide();
    });

    $('td.mark').hover(
        function(){
            var expr = /(\d+)_(\d+)/;
            student = expr.exec($(this).attr('id'))[1];
            day = expr.exec($(this).attr('id'))[2];
        }
    );
});