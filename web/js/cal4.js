var Cal = function (divId) {
    this.divId = divId;

    this.DaysOfWeek = [
        'Sun',
        'Mon',
        'Tue',
        'Wed',
        'Thu',
        'Fri',
        'Sat'
    ];

    this.Months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

    var d = new Date();

    this.currMonth = d.getMonth();
    this.currYear = d.getFullYear();
    this.currDay = d.getDate();
};

Cal.prototype.nextMonth = function () {
    if (this.currMonth == 11) {
        this.currMonth = 0;
        this.currYear = this.currYear + 1;
    } else {
        this.currMonth = this.currMonth + 1;
    }
};

Cal.prototype.previousMonth = function () {
    if (this.currMonth == 0) {
        this.currMonth = 11;
        this.currYear = this.currYear - 1;
    } else {
        this.currMonth = this.currMonth - 1;
    }
};

Cal.prototype.showcurr = function (sobiList, manjokList) {
    this.showMonth(this.currYear, this.currMonth, sobiList, manjokList);
};

Cal.prototype.showMonth = function (y, m, sobiList, manjokList) {
    var d = new Date(),
        firstDayOfMonth = new Date(y, m, 1).getDay(),
        lastDateOfMonth = new Date(y, m + 1, 0).getDate(),
        lastDayOfLastMonth = m == 0 ? new Date(y - 1, 11, 0).getDate() : new Date(y, m, 0).getDate();

    var html = '<table class="calendarTable">';
    // Write selected month and year
    html += '<thead><tr>';
    html += '<td colspan="7">';
    html += this.Months[m] + y + '</td>';
    html += '</tr></thead>';

    html += '<tr class="days">';
    for (var i = 0; i < this.DaysOfWeek.length; i++) {

        html += '<td class="weeks">'
        html += this.DaysOfWeek[i] + '</td>';
    }
    html += '</tr>';

    var i = 1;
    do {
        var dow = new Date(y, m, i).getDay();

        if (dow == 0) {
            html += '<tr>';
        } else if (i == 1) {
            html += '<tr>';
            var k = lastDayOfLastMonth - firstDayOfMonth + 1;
            for (var j = 0; j < firstDayOfMonth; j++) {
                html += '<td class="not-current">' + k + '</td>';
                k++;
            }
        }

        var chk = new Date();
        var chkY = chk.getFullYear();
        var chkM = chk.getMonth();
        if (chkY == this.currYear && chkM == this.currMonth && i == this.currDay) {
            html += '<td class="normal">' + i + '<br>';

            $.each(manjokList, function (index, item) {
                dt = new Date(item.manjokSobiDate);
                if (dt.getDate() == i) {
                    html += '<i class=" tiny yellow star icon"></i>';
                }
            });

            $.each(sobiList, function (index, item) {
                dt = new Date(item.sobiDate);
                param = dt.getFullYear() + "-" + (dt.getMonth() + 1) + "-" + dt.getDate();
                if (dt.getDate() == i) {
                    html += '<a href="#" class="daya" data-id=' + param + '><i class="won icon"></i>' + item.balance.toLocaleString() + '</a>';
                }
            });

            html += '</td>';
        } else {
            html += '<td class="normal">' + i + '<br>';

            $.each(manjokList, function (index, item) {
                dt = new Date(item.manjokSobiDate);
                if (dt.getDate() == i) {
                    html += '<i class=" tiny yellow star icon"></i>';
                }
            });

            $.each(sobiList, function (index, item) {
                dt = new Date(item.sobiDate);
                param = dt.getFullYear() + "-" + (dt.getMonth() + 1) + "-" + dt.getDate();
                if (dt.getDate() == i) {
                    html += '<a href="#" class="daya" data-id=' + param + '><i class="won icon"></i>' + item.balance.toLocaleString() + '</a>';

                }
            });
            html += '</td>';
        }

        if (dow == 6) {
            html += '</tr>';
        } else if (i == lastDateOfMonth) {
            var k = 1;
            for (dow; dow < 6; dow++) {
                html += '<td class="not-current">' + k + '</td>';
                k++;
            }
        }
        i++;
    } while (i <= lastDateOfMonth);
    html += '</table>';
    document.getElementById(this.divId).innerHTML = html;
};

window.onload = function () {
    var c = new Cal("divCal");
    var cd = new Date();
    var params = "currMonth=" + cd.getMonth() + "&currYear=" + cd.getFullYear();

    $.ajax({
        url: 'getCalendarList.do',
        data: params,
        dataType: 'json',
        success: function (data) {
            var sobiList = data.sobiList;
            var manjokList = data.manjokList;
            displaySumCal(sobiList);
            c.showcurr(sobiList, manjokList);
        }
    });

    $(document).on('click', '.daya', function () {
        var param = $(this).attr('data-id');
        window.location.href = 'dailyCategory.do?day=' + param;

    });

    $('#btnNext').on('click', function () {
        c.nextMonth();

        var params = "currMonth=" + c.currMonth + "&currYear=" + c.currYear;

        $.ajax({
            url: 'getCalendarList.do',
            data: params,
            dataType: 'json',
            success: function (data) {

                var sobiList = data.sobiList;
                var manjokList = data.manjokList;
                displaySumCal(sobiList);
                c.showcurr(sobiList, manjokList);

            }
        });
    });

    $('#btnPrev').on('click', function () {
        c.previousMonth();

        var params = "currMonth=" + c.currMonth + "&currYear=" + c.currYear;

        $.ajax({
            url: 'getCalendarList.do',
            data: params,
            dataType: 'json',
            success: function (data) {

                var sobiList = data.sobiList;
                var manjokList = data.manjokList;
                displaySumCal(sobiList);
                c.showcurr(sobiList, manjokList);

            }
        });
    });

    $(document).on('click', '#monthlyBtn', function () {
        var params = "month=" + c.currMonth + "&year=" + c.currYear;
        window.location.href = 'monthlyCategory.do?' + params;
    });

    function displaySumCal(sobiList) {
        var sumCount = sobiList.length;
        var sumTotal = 0;

        $.each(sobiList, function (index, item) {
            sumTotal += item.balance;
        });

        $(".sumCount").html(sumCount);
        $(".sumTotal").html(sumTotal.toLocaleString());

        if (sumCount > 0) {
            $("#monthlyDiv").html('<button class="ui blue basic button" id="monthlyBtn"><i class="bar chart icon"></i> 이 달의 소비내역보기</button>');
        } else {
            $("#monthlyDiv").html('<button  class="ui blue basic button" id="disabledBtn"><i class="smile icon"></i> 이 달의 소비가 없습니다</button>');
        }
    }
}

function getId(id) {
    return document.getElementById(id);
}