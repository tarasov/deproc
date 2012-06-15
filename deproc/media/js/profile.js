$(function() {
    $('a.visible_schedule .hide').hide();

    $('a.visible_schedule .show').click(function() {
        var url = $(this.parentNode).attr('rel');
        var date = $(this).attr('id');
        var html = '';
        var now = new Date();
        var curr_date = '14';
        var curr_month = '05';
        var curr_year = now.getFullYear();
        $.get(
            url,
//            {'day': date},
            {'day': curr_date + '.' + curr_month + '.' + curr_year},
            function(data) {
                if (data != '{}') {
                    html = '' +
                        '<table class="schedule span5">' +
                        '<tr>' +
                        '<th>Пара</th><th>Группа</th><th>Предмет</th>' +
                        '</tr>';
                } else {
                    html = '<h3>На сегодня пар нету</h3>';
                }

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
                }
                $('a.visible_schedule .show').hide();
                $('a.visible_schedule .hide').show();
                $('#schedule').html(html);
            }
        )
    });

    $('a.visible_schedule .hide').click(function() {
        $('#schedule').html('');
        $('a.visible_schedule .show').show();
        $('a.visible_schedule .hide').hide();
    });
});