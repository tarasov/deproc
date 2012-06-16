/**
 * Created with PyCharm.
 * User: django
 * Date: 07.05.12
 * Time: 13:04
 * To change this template use File | Settings | File Templates.
 */
$(function() {

    $('.add-on').click(function() {
        $('#datepicker').datepicker()
            .on('changeDate', function(ev){
                            var day = ev.date.getDate();
                            // почему-то месяц на один меньше, если выбрать июнь, то будет май, по этому прибавляю 1 месяц
                            var month = ev.date.getMonth()+1;
                            var year = ev.date.getFullYear();
                            window.location = '/schedule/choose/?day='+ day + '.' + month + '.' + year;
            });
    });

    var startDate = new Date(2012,1,20);
    var endDate = new Date(2012,1,25);
    $('#date-start')
        .datepicker()
        .on('changeDate', function(ev){
            if (ev.date.valueOf() > endDate.valueOf()){
                $('#alert').show().find('strong').text('The start date must be before the end date.');
            } else {
                $('#alert').hide();
                startDate = new Date(ev.date);
                $('#date-start-display').text($('#date-start').data('date'));
            }
            $('#date-start').datepicker('hide');
        });
    $('#date-end')
        .datepicker()
        .on('changeDate', function(ev){
            if (ev.date.valueOf() < startDate.valueOf()){
                $('#alert').show().find('strong').text('The end date must be after the start date.');
            } else {
                $('#alert').hide();
                endDate = new Date(ev.date);
                $('#date-end-display').text($('#date-end').data('date'));
            }
            $('#date-end').datepicker('hide');
        });
//    });
});