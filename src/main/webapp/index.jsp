<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>你好</title>
</head>
<body>
<h2>收入总金额/总优惠票额</h2>
<h4 class="totalIncome"></h4>
<div id="totalIncomeChart" style="width: 800px;height:400px;"></div>

<h2>各时间收入</h2>
<h4 class="moneyByTime"></h4>
<div id="moneyByTimeChart" style="width: 600px;height:400px;"></div>

<h2>平均票价含/不含免费票</h2>
<h4 class="avgTicketPriceIncludeFree"></h4>
<div id="priceIsIncludeFreeChart" style="width: 600px;height:400px;"></div>

<h2>优惠票卡总人数</h2>
<h4 class="totalPeopleDiscount"></h4>
<div id="totalPeopleDiscountChart" style="width: 600px;height:400px;"></div>

<h2>单程票卡丢失数量</h2>
<h4 class="singleTicketLossNum"></h4>
<div id="singleTicketLossNumChart" style="width: 600px;height:400px;"></div>

<h2>不同优惠卡出行人数</h2>
<h4 class="peopleDiscount"></h4>
<div id="peopleDiscountChart" style="width: 600px;height:400px;"></div>

<h2>不同优惠卡优惠额</h2>
<h4 class="moneyDiscount"></h4>
<div id="moneyDiscountChart" style="width: 600px;height:400px;"></div>

<h2>各线路不同票种（畅通卡、单程票卡、免费卡、学生卡、员工卡等）的出行数量、比例与对应票价收入</h2>
<h4>出行数量</h4>
<div id="ticketTypeLineTicketChartByNumber" style="width: 800px;height:600px;"></div>
<h4>比例</h4>
<div id="ticketTypeLineTicketChartByPercent" style="width: 1200px;height:800px;"></div>
<h4>收入</h4>
<div id="ticketTypeLineTicketChartByIncome" style="width: 800px;height:600px;"></div>

<h2>各线路优惠票卡出行总人数、总计优惠票额</h2>
<h4 class="lines"></h4>
<div id="linesChart" style="width: 800px;height:600px;"></div>

<h2>各线路不同优惠卡类型出行人数、优惠的票额</h2>
<h4>出行人数</h4>
<div id="line_ticket_typeChart" style="width: 800px;height:600px;"></div>
<h4>优惠票额</h4>
<div id="line_ticket_typeChartByMoney" style="width: 800px;height:600px;"></div>

<h2>车站使用优惠票卡出行总人数、总计优惠票额</h2>
<h4 class="stations"></h4>
<div id="stationsChart" style="width: 800px;height:3000px;"></div>

<h2>车站不同优惠卡类型出行人数、优惠的票额</h2>
<h4>出行人数</h4>
<div id="station_ticket_typeChart" style="width: 1000px;height:1000px;"></div>
<h4>优惠的票额</h4>
<div id="station_ticket_typeChartByMoney" style="width: 1000px;height:1000px;"></div>


<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/echarts/3.8.5/echarts-en.common.js"></script>
<script src="http://echarts.baidu.com/resource/echarts-gl-latest/dist/echarts-gl.min.js"></script>
<script type="application/javascript">
    Array.prototype.del = function (index) {
        if (isNaN(index) || index >= this.length) {
            return false;
        }
        for (var i = 0, n = 0; i < this.length; i++) {
            if (this[i] != this[index]) {
                this[n++] = this[i];
            }
        }
        this.length -= 1;
    };

    Array.prototype.contain = function (val) {
        for (var i = 0; i < this.length; i++) {
            if (this[i] == val) {
                return true;
            }
        }
        return false;
    };

    $(function () {
        getTest();
        getTest2();
        getTest3();
        getTest4();
        getTest5();
        getTest6();
        getTest7();
        getTest8();
        getTest9();

    });

    function getTest() {
        $.ajax({
            type: 'GET',
            url: 'test/test',
            dataType: 'json',
            success: function (data) {
                //收入总金额
                var totalIncomeChart = echarts.init(document.getElementById('totalIncomeChart'));
                var option = {
                    title: {
                        text: '收入总金额/总优惠票额'
                    },
                    tooltip: {},
                    xAxis: {
                        data: ['收入总金额', '总优惠票额']
                    },
                    yAxis: {},
                    series: [{
                        name: '收入',
                        type: 'bar',
                        data: [data.totalincome, data.total_money_discount]
                    }]
                };
                totalIncomeChart.setOption(option);

                //平均票价
                var priceIsIncludeFreeChart = echarts.init(document.getElementById('priceIsIncludeFreeChart'));
                var option = {
                    title: {
                        text: '平均票价'
                    },
                    tooltip: {},
                    legend: {
                        data: ['票价']
                    },
                    xAxis: {
                        data: ['含优惠票', '不含优惠票']
                    },
                    yAxis: {},
                    series: [{
                        name: '票价',
                        type: 'bar',
                        data: [data.avg_ticketprice_include_free, data.avg_ticketprice_no_include_free]
                    }]
                };
                priceIsIncludeFreeChart.setOption(option);

                //总优惠人数
                var totalPeopleDiscountChart = echarts.init(document.getElementById('totalPeopleDiscountChart'));
                var option = {
                    title: {
                        text: '总优惠人数'
                    },
                    tooltip: {},
                    legend: {
                        data: ['人数']
                    },
                    xAxis: {
                        data: ['总优惠人数']
                    },
                    yAxis: {},
                    series: [{
                        name: '人数',
                        type: 'bar',
                        data: [data.total_people_discount]
                    }]
                };
                totalPeopleDiscountChart.setOption(option);

                //单程票卡丢失数量
                var singleTicketLossNumChart = echarts.init(document.getElementById('singleTicketLossNumChart'));
                var option = {
                    title: {
                        text: '单程票卡丢失数量'
                    },
                    tooltip: {},
                    legend: {
                        data: ['票卡数量']
                    },
                    xAxis: {
                        data: ['单程票卡丢失数量']
                    },
                    yAxis: {},
                    series: [{
                        name: '数量',
                        type: 'bar',
                        data: [data.single_ticket_loss_num]
                    }]
                };
                singleTicketLossNumChart.setOption(option);
            },
            error: function () {
                console.log("请求失败！");
            }
        });
    }

    //各时间收入
    function getTest2() {
        $.ajax({
            type: 'GET',
            url: 'test/test2',
            dataType: 'json',
            success: function (data) {
                var moneyByTimeChart = echarts.init(document.getElementById('moneyByTimeChart'));
                var keys = [];
                var values = [];
                for (var key in data) {
                    keys.push(key);
                    values.push(data[key])
                }
                var option = {
                    title: {
                        text: '各时间收入'
                    },
                    tooltip: {},
                    legend: {
                        data: ['收入']
                    },
                    xAxis: {
                        data: keys
                    },
                    yAxis: {},
                    series: [{
                        name: '收入',
                        type: 'bar',
                        data: values
                    }]
                };
                moneyByTimeChart.setOption(option);
            },
            error: function () {
                console.log("请求失败")
            }
        });
    }

    //不同优惠卡出行人数
    function getTest3() {
        $.ajax({
            type: 'GET',
            url: 'test/test3',
            dataType: 'json',
            success: function (data) {
                var keys = [];
                var values = [];
                for (var key in data) {
                    keys.push(key);
                    values.push(data[key]);
                }
                var peopleDiscountChart = echarts.init(document.getElementById('peopleDiscountChart'));
                var option = {
                    title: {
                        text: '不同优惠卡出行人数'
                    },
                    tooltip: {},
                    xAxis: {
                        data: keys
                    },
                    yAxis: {},
                    series: [{
                        type: 'bar',
                        data: values
                    }]
                };
                peopleDiscountChart.setOption(option);
            },
            error: function () {
                console.log("请求失败")
            }
        });
    }

    //不同优惠卡优惠额
    function getTest4() {
        $.ajax({
            type: 'GET',
            url: 'test/test4',
            dataType: 'json',
            success: function (data) {
                var keys = [];
                var values = [];
                for (var key in data) {
                    keys.push(key);
                    values.push(data[key]);
                }
                var moneyDiscountChart = echarts.init(document.getElementById('moneyDiscountChart'));
                var option = {
                    title: {
                        text: '不同优惠卡优惠额'
                    },
                    tooltip: {},
                    xAxis: {
                        data: keys
                    },
                    yAxis: {},
                    series: [{
                        type: 'bar',
                        data: values
                    }]
                };
                moneyDiscountChart.setOption(option);
            },
            error: function () {
                console.log("请求失败")
            }
        });
    }

    //各线路不同票种（畅通卡、单程票卡、免费卡、学生卡、员工卡等）的出行数量、比例与对应票价收入
    function getTest5() {
        $.ajax({
            type: 'GET',
            url: 'test/test5',
            dataType: 'json',
            success: function (data) {
                var text = '';
                var data2 = data.ticket_type_line_ticket;
//                for(var temp in data2){
//                    alert(temp)
//                    text += data2[temp].line + '->' + data2[temp].ticket_t + '->' + data2[temp].number + '->'
//                            + data2[temp].percent + '->' + data2[temp].income + '<br/>';
//                }
//                $(".ticketTypeLineTicket").html(text);

                var mianfei = [data2[14].number, data2[0].number, data2[12].number, data2[8].number, data2[4].number];
                var dancheng = [data2[2].number, data2[6].number, data2[11].number, data2[19].number, data2[1].number];
                var yuangong = [data2[9].number, data2[13].number, data2[18].number, data2[3].number, data2[7].number];
                var changtong = [data2[16].number, data2[10].number, data2[5].number, data2[15].number, data2[17].number];

                var ticketTypeLineTicketChartByNumber = echarts.init(document.getElementById('ticketTypeLineTicketChartByNumber'));
                var option = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    legend: {
                        data: ['免费卡', '单程卡', '员工卡', '畅通卡']
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: {
                        type: 'value'
                    },
                    yAxis: {
                        type: 'category',
                        data: ['1号线', '2号线', '3号线', '6号线', '56号线']
                    },
                    series: [
                        {
                            name: '免费卡',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: mianfei
                        },
                        {
                            name: '单程卡',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: dancheng
                        },
                        {
                            name: '员工卡',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: yuangong
                        },
                        {
                            name: '畅通卡',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: changtong
                        },
                    ]
                };
                ticketTypeLineTicketChartByNumber.setOption(option);

                var ticketTypeLineTicketChartByPercent = echarts.init(document.getElementById('ticketTypeLineTicketChartByPercent'));
                var option2 = {
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b}: {c} ({d}%)"
                    },
                    legend: {
                        orient: 'vertical',
                        x: 'left',
                        data: ['1号线', '2号线', '3号线', '6号线', '56号线', '1-免费卡', '1-员工卡', '1-畅通卡', '1-单程卡', '2-免费卡', '2-员工卡', '2-畅通卡', '2-单程卡', '3-免费卡', '3-员工卡', '3-畅通卡', '3-单程卡', '6-免费卡', '6-员工卡', '6-畅通卡', '6-单程卡', '56-免费卡', '56-员工卡', '56-畅通卡', '56-单程卡']
                    },
                    series: [
                        {
                            name: '访问来源',
                            type: 'pie',
                            selectedMode: 'single',
                            radius: [0, '30%'],

                            label: {
                                normal: {
                                    position: 'inner'
                                }
                            },
                            labelLine: {
                                normal: {
                                    show: false
                                }
                            },
                            data: [
                                {value: 0.3122, name: '1号线'},
                                {value: 0.1502, name: '2号线'},
                                {value: 0.4752, name: '3号线'},
                                {value: 0.1044, name: '6号线'},
                                {value: 0.0044, name: '56号线'}
                            ]
                        },
                        {
                            name: '访问来源',
                            type: 'pie',
                            radius: ['40%', '55%'],
                            label: {
                                normal: {
                                    formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
                                    backgroundColor: '#eee',
                                    borderColor: '#aaa',
                                    borderWidth: 1,
                                    borderRadius: 4,
                                    // shadowBlur:3,
                                    // shadowOffsetX: 2,
                                    // shadowOffsetY: 2,
                                    // shadowColor: '#999',
                                    // padding: [0, 7],
                                    rich: {
                                        a: {
                                            color: '#999',
                                            lineHeight: 22,
                                            align: 'center'
                                        },
                                        // abg: {
                                        //     backgroundColor: '#333',
                                        //     width: '100%',
                                        //     align: 'right',
                                        //     height: 22,
                                        //     borderRadius: [4, 4, 0, 0]
                                        // },
                                        hr: {
                                            borderColor: '#aaa',
                                            width: '100%',
                                            borderWidth: 0.5,
                                            height: 0
                                        },
                                        b: {
                                            fontSize: 16,
                                            lineHeight: 33
                                        },
                                        per: {
                                            color: '#eee',
                                            backgroundColor: '#334455',
                                            padding: [2, 4],
                                            borderRadius: 2
                                        }
                                    }
                                }
                            },
                            data: [
                                {value: 0.0136, name: '1-免费卡'},
                                {value: 0.0041, name: '1-员工卡'},
                                {value: 0.2392, name: '1-畅通卡'},
                                {value: 0.0553, name: '1-单程卡'},
                                {value: 0.0094, name: '2-免费卡'},
                                {value: 0.0033, name: '2-员工卡'},
                                {value: 0.1143, name: '2-畅通卡'},
                                {value: 0.0232, name: '2-单程卡'},
                                {value: 0.0171, name: '3-免费卡'},
                                {value: 0.0061, name: '3-员工卡'},
                                {value: 0.3444, name: '3-畅通卡'},
                                {value: 0.1076, name: '3-单程卡'},
                                {value: 0.0054, name: '6-免费卡'},
                                {value: 0.0024, name: '6-员工卡'},
                                {value: 0.0790, name: '6-畅通卡'},
                                {value: 0.0176, name: '6-单程卡'},
                                {value: 0.0004, name: '56-免费卡'},
                                {value: 0.0001, name: '56-员工卡'},
                                {value: 0.0023, name: '56-畅通卡'},
                                {value: 0.0016, name: '56-单程卡'}
                            ]
                        }
                    ]
                };
                ticketTypeLineTicketChartByPercent.setOption(option2);

                var ticketTypeLineTicketChartByIncome = echarts.init(document.getElementById('ticketTypeLineTicketChartByIncome'));

                var option3 = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    legend: {
                        data: ['免费卡', '单程卡', '员工卡', '畅通卡']
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: {
                        type: 'value'
                    },
                    yAxis: {
                        type: 'category',
                        data: ['1号线', '2号线', '3号线', '6号线', '56号线']
                    },
                    series: [
                        {
                            name: '免费卡',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: [data2[14].income, data2[0].income, data2[12].income, data2[8].income, data2[4].income]
                        },
                        {
                            name: '单程卡',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: [data2[2].income, data2[6].income, data2[11].income, data2[19].income, data2[1].income]
                        },
                        {
                            name: '员工卡',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: [data2[9].income, data2[13].income, data2[18].income, data2[3].income, data2[7].income]
                        },
                        {
                            name: '畅通卡',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: [data2[16].income, data2[10].income, data2[5].income, data2[15].income, data2[17].income]
                        },
                    ]
                };
                ticketTypeLineTicketChartByIncome.setOption(option3);
            },
            error: function () {
                console.log("请求失败")
            }
        });
    }

    //各线路优惠票卡出行总人数、总计优惠票额
    function getTest6() {
        $.ajax({
            type: 'GET',
            url: 'test/test6',
            dataType: 'json',
            success: function (data) {
                var data2 = data.lines;
                var lines = []
                var people = [];
                var money = [];

                for (var temp in data2) {
                    if (data2[temp].line != undefined) {
                        lines.push(data2[temp].line);
                        people.push(data2[temp].people);
                        money.push(data2[temp].totaolSaveMoney);
                    }
                }
                var linesChart = echarts.init(document.getElementById('linesChart'));
                var option = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        }
                    },
                    legend: {
                        data: ['出行总人数', '总计优惠票额']
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: {
                        type: 'value',
                        boundaryGap: [0, 0.01]
                    },
                    yAxis: {
                        type: 'category',
                        data: lines
                    },
                    series: [
                        {
                            name: '出行总人数',
                            type: 'bar',
                            data: people
                        },
                        {
                            name: '总计优惠票额',
                            type: 'bar',
                            data: money
                        }
                    ]
                };
                linesChart.setOption(option);
            },
            error: function () {
                console.log("请求失败")
            }
        });
    }


    //各线路不同优惠卡类型出行人数、优惠的票额
    function getTest7() {
        $.ajax({
            type: 'GET',
            url: 'test/test7',
            dataType: 'json',
            success: function (data) {
                var text = '';
                var data2 = data.line_ticket_type;
                for (var i = 0; i < data2.length; i++) {
                    if (data2[i].line == '02' && data2[i].ticketType == '14') {
                        data2.del(i)
                        break;
                    }
                }
                for (var i = 0; i < data2.length; i++) {
                    for (var j = i + 1; j < data2.length; j++) {
                        if (parseInt(data2[i].line) > parseInt(data2[j].line)) {
                            var tmp = data2[i];
                            data2[i] = data2[j];
                            data2[j] = tmp;
                        } else if (parseInt(data2[i].line) == parseInt(data2[j].line) && parseInt(data2[i].ticketType) > parseInt(data2[j].ticketType)) {
                            var tmp = data2[i];
                            data2[i] = data2[j];
                            data2[j] = tmp;
                        }
                    }
                }

                var ticketType = [3, 5, 15, 20, 44, 48, 77, 88];
                var tmp = [[], [], [], [], [], [], [], []];
                for (var i = 0; i < data2.length; i += 8) {
                    var index = i % 8;
                    tmp[index].push(data2[i].people);
                    tmp[index + 1].push(data2[i + 1].people);
                    tmp[index + 2].push(data2[i + 2].people);
                    tmp[index + 3].push(data2[i + 3].people);
                    tmp[index + 4].push(data2[i + 4].people);
                    tmp[index + 5].push(data2[i + 5].people);
                    tmp[index + 6].push(data2[i + 6].people);
                    tmp[index + 7].push(data2[i + 7].people);
                }

                var line_ticket_typeChart = echarts.init(document.getElementById('line_ticket_typeChart'));
                var option = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    legend: {
                        data: ticketType
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: {
                        type: 'value'
                    },
                    yAxis: {
                        type: 'category',
                        data: ['1号线', '2号线', '3号线', '6号线', '56号线']
                    },
                    series: [
                        {
                            name: '3',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: tmp[0]
                        },
                        {
                            name: '5',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: tmp[1]
                        },
                        {
                            name: '15',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: tmp[2]
                        },
                        {
                            name: '20',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: tmp[3]
                        },
                        {
                            name: '44',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: tmp[4]
                        },
                        {
                            name: '48',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: tmp[5]
                        },
                        {
                            name: '77',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: tmp[6]
                        },
                        {
                            name: '88',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: tmp[7]
                        }
                    ]
                };
                line_ticket_typeChart.setOption(option);

                var line_ticket_typeChartByMoney = echarts.init(document.getElementById('line_ticket_typeChartByMoney'));
                var tmp_2 = [[], [], [], [], [], [], [], []];
                for (var i = 0; i < data2.length; i += 8) {
                    var index = i % 8;
                    tmp_2[index].push(data2[i].totaolSavedMoney);
                    tmp_2[index + 1].push(data2[i + 1].totaolSavedMoney);
                    tmp_2[index + 2].push(data2[i + 2].totaolSavedMoney);
                    tmp_2[index + 3].push(data2[i + 3].totaolSavedMoney);
                    tmp_2[index + 4].push(data2[i + 4].totaolSavedMoney);
                    tmp_2[index + 5].push(data2[i + 5].totaolSavedMoney);
                    tmp_2[index + 6].push(data2[i + 6].totaolSavedMoney);
                    tmp_2[index + 7].push(data2[i + 7].totaolSavedMoney);
                }
                var option_2 = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    legend: {
                        data: ticketType
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: {
                        type: 'value'
                    },
                    yAxis: {
                        type: 'category',
                        data: ['1号线', '2号线', '3号线', '6号线', '56号线']
                    },
                    series: [
                        {
                            name: '3',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: tmp_2[0]
                        },
                        {
                            name: '5',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: tmp_2[1]
                        },
                        {
                            name: '15',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: tmp_2[2]
                        },
                        {
                            name: '20',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: tmp_2[3]
                        },
                        {
                            name: '44',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: tmp_2[4]
                        },
                        {
                            name: '48',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: tmp_2[5]
                        },
                        {
                            name: '77',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: tmp_2[6]
                        },
                        {
                            name: '88',
                            type: 'bar',
                            stack: '总量',
                            label: {
                                normal: {
                                    //show: true,
                                    position: 'insideRight'
                                }
                            },
                            data: tmp_2[7]
                        }
                    ]
                };
                line_ticket_typeChartByMoney.setOption(option_2);
            },
            error: function () {
                console.log("请求失败")
            }
        });
    }

    function getTest8() {
        $.ajax({
            type: 'GET',
            url: 'test/test8',
            dataType: 'json',
            success: function (data) {
                var seriesLabel = {
                    normal: {
                        show: true,
                        textBorderColor: '#333',
                        textBorderWidth: 2
                    }
                }
                var text = '';
                var stations = [];
                var people = [];
                var money = [];
                var data2 = data.stations;
                for (var i = 0; i < data2.length; i++) {
                    for (var j = i + 1; j < data2.length; j++) {
                        if (parseInt(data2[i].station1) > parseInt(data2[j].station1)) {
                            var tmp = data2[i];
                            data2[i] = data2[j];
                            data2[j] = tmp;
                        }
                    }
                }
                for (var i = 0; i < data2.length; i++) {
                    if (data2[i].station1 != undefined) {
                        stations.push(data2[i].station1);
                        people.push(data2[i].people);
                        money.push(data2[i].totaolSavedMoney);
                    }
                }
//                for(var temp in data2){
//                    text += data2[temp].people + '->'+ data2[temp].station1 + '->' + data2[temp].totaolSavedMoney
//                            + '<br/>';
//                }
//                $(".stations").html(text);

                var stationsChart = echarts.init(document.getElementById('stationsChart'));
                var option = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        }
                    },
                    legend: {
                        data: ['总人数', '总优惠票额']
                    },
                    grid: {
                        left: 100
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            saveAsImage: {}
                        }
                    },
                    xAxis: {
                        type: 'value',
                        axisLabel: {
                            formatter: '{value}'
                        }
                    },
                    yAxis: {
                        type: 'category',
                        data: stations,
                    },
                    series: [
                        {
                            name: '总人数',
                            type: 'bar',
                            data: people,
                            label: seriesLabel,
                        },
                        {
                            name: '总优惠票额',
                            type: 'bar',
                            label: seriesLabel,
                            data: money
                        },
                    ]
                };
                stationsChart.setOption(option);
            },
            error: function () {
                console.log("请求失败")
            }
        });
    }


    function getTest9() {
        $.ajax({
            type: 'GET',
            url: 'test/test9',
            dataType: 'json',
            success: function (data) {
                var text = '';
                var ticketTypeData = [];
                var stationData = [];
                var data2 = data.station_ticket_type;
                for(var temp in data2){
                    if(data2[temp].station1=='5606'){
                        data2[temp].station1='0706';
                    }else if(data2[temp].station1=='5605'){
                        data2[temp].station1='0705';
                    }
                }
                for (var i = 0; i < data2.length; i++) {
                    for (var j = i + 1; j < data2.length; j++) {
                        if (parseInt(data2[i].station1) > parseInt(data2[j].station1)) {
                            var tmp = data2[i];
                            data2[i] = data2[j];
                            data2[j] = tmp;
                        } else if (parseInt(data2[i].station1) == parseInt(data2[j].station1) && parseInt(data2[i].ticketType) > parseInt(data2[j].ticketType)) {
                            var tmp = data2[i];
                            data2[i] = data2[j];
                            data2[j] = tmp;
                        }
                    }
                }

                var rawData = [];
                for (var temp in data2) {
                    if (!ticketTypeData.contain(parseInt(data2[temp].ticketType))) {
                        ticketTypeData.push(parseInt(data2[temp].ticketType));
                    }
                    if (!stationData.contain(parseInt(data2[temp].station1))) {
                        stationData.push(parseInt(data2[temp].station1));
                    }
//                    text += data2[temp].station1 + '->'+ data2[temp].ticketType + '->' + data2[temp].people + '->' + data2[temp].totaolSavedMoney
//                        + '<br/>';
                    rawData.push([parseInt(data2[temp].station1), parseInt(data2[temp].ticketType), parseInt(data2[temp].people)]);
                }
//                $(".station_ticket_type").html(text);

                var station_ticket_typeChart = echarts.init(document.getElementById('station_ticket_typeChart'));
                var option = {
                    tooltip: {},
                    visualMap: {
                        max: 20,
                        inRange: {
                            color: ['#313695', '#4575b4', '#74add1', '#abd9e9', '#e0f3f8', '#ffffbf', '#fee090', '#fdae61', '#f46d43', '#d73027', '#a50026']
                        }
                    },
                    xAxis3D: {
                        type: 'value',
                    },
                    yAxis3D: {
                        type: 'value',
                    },
                    zAxis3D: {
                        type: 'value'
                    },
                    grid3D: {
                        boxWidth: 200,
                        boxDepth: 80,
                        light: {
                            main: {
                                intensity: 1.2
                            },
                            ambient: {
                                intensity: 0.3
                            }
                        }
                    },
                    series: [{
                        type: 'bar3D',
                        data: rawData,
                        shading: 'color',

                        label: {
                            show: false,
                            textStyle: {
                                fontSize: 16,
                                borderWidth: 1
                            }
                        },

                        itemStyle: {
                            opacity: 0.4
                        },

                        emphasis: {
                            label: {
                                textStyle: {
                                    fontSize: 20,
                                    color: '#900'
                                }
                            },
                            itemStyle: {
                                color: '#900'
                            }
                        }
                    }]
                };
                station_ticket_typeChart.setOption(option);

                var station_ticket_typeChartByMoney = echarts.init(document.getElementById('station_ticket_typeChartByMoney'));
                rawData = [];
                for (var temp in data2) {
                    rawData.push([parseInt(data2[temp].station1), parseInt(data2[temp].ticketType), parseInt(data2[temp].totaolSavedMoney)]);
                }
                option = {
                    tooltip: {},
                    visualMap: {
                        max: 20,
                        inRange: {
                            color: ['#313695', '#4575b4', '#74add1', '#abd9e9', '#e0f3f8', '#ffffbf', '#fee090', '#fdae61', '#f46d43', '#d73027', '#a50026']
                        }
                    },
                    xAxis3D: {
                        type: 'value',
                    },
                    yAxis3D: {
                        type: 'value',
                    },
                    zAxis3D: {
                        type: 'value'
                    },
                    grid3D: {
                        boxWidth: 200,
                        boxDepth: 80,
                        light: {
                            main: {
                                intensity: 1.2
                            },
                            ambient: {
                                intensity: 0.3
                            }
                        }
                    },
                    series: [{
                        type: 'bar3D',
                        data: rawData,
                        shading: 'color',

                        label: {
                            show: false,
                            textStyle: {
                                fontSize: 16,
                                borderWidth: 1
                            }
                        },

                        itemStyle: {
                            opacity: 0.4
                        },

                        emphasis: {
                            label: {
                                textStyle: {
                                    fontSize: 20,
                                    color: '#900'
                                }
                            },
                            itemStyle: {
                                color: '#900'
                            }
                        }
                    }]
                };
                station_ticket_typeChartByMoney.setOption(option);
            }
        });
    }
</script>

</body>
</html>
