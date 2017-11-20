<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>你好</title>
</head>
<body>
<h2>收入总金额</h2>
<h4 class="totalIncome"></h4>
<h2>各时间收入</h2>
<h4 class="moneyByTime"></h4>
<h2>平均票价含免费票</h2>
<h4 class="avgTicketPriceIncludeFree"></h4>
<h2>平均票价不含免费票</h2>
<h4 class="avgTicketPriceNoIncludedFree"></h4>
<h2>优惠票卡总人数</h2>
<h4 class="totalPeopleDiscount"></h4>
<h2>总优惠票额</h2>
<h4 class="totalMoneyDiscount"></h4>
<h2>不同优惠卡出行人数</h2>
<h4 class="peopleDiscount"></h4>
<h2>不同优惠卡优惠额</h2>
<h4 class="moneyDiscount"></h4>
<h2>单程票卡丢失数量</h2>
<h4 class="singleTicketLossNum"></h4>
<h2>各线路不同票种（畅通卡、单程票卡、免费卡、学生卡、员工卡等）的出行数量、比例与对应票价收入</h2>
<h4 class="ticketTypeLineTicket"></h4>
<h2>各线路优惠票卡出行总人数、总计优惠票额</h2>
<h4 class="lines"></h4>
<h2>各线路不同优惠卡类型出行人数、优惠的票额</h2>
<h4 class="line_ticket_type"></h4>
<h2>车站使用优惠票卡出行总人数、总计优惠票额</h2>
<h4 class="stations"></h4>
<h2>车站不同优惠卡类型出行人数、优惠的票额</h2>
<h4 class="station_ticket_type"></h4>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script type="application/javascript">
    $(function(){
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

    function getTest(){
        $.ajax({
            type:'GET',
            url:'test/test',
            dataType:'json',
            success: function(data){
                $(".totalIncome").html(data.totalincome);
                $(".avgTicketPriceIncludeFree").html(data.avg_ticketprice_include_free);
                $(".avgTicketPriceNoIncludedFree").html(data.avg_ticketprice_no_include_free);
                $(".totalPeopleDiscount").html(data.total_people_discount);
                $(".totalMoneyDiscount").html(data.total_money_discount);
                $(".singleTicketLossNum").html(data.single_ticket_loss_num);
            },
            error: function () {
                console.log("请求失败！");
            }
        });
    }
    function getTest2(){
        $.ajax({
            type:'GET',
            url:'test/test2',
            dataType:'json',
            success: function (data) {
                var text = '';
                for(var key in data){
                    text += key + ' -> ' + data[key] + '<br/>';
                }
                $(".moneyByTime").html(text);
            },
            error: function(){
                console.log("请求失败")
            }
        });
    }
    function getTest3(){
        $.ajax({
            type:'GET',
            url:'test/test3',
            dataType:'json',
            success: function (data) {
                var text = '';
                for(var key in data){
                    text += key + ' -> ' + data[key] + '<br/>';
                }
                $(".peopleDiscount").html(text);
            },
            error: function(){
                console.log("请求失败")
            }
        });
    }
    function getTest4(){
        $.ajax({
            type:'GET',
            url:'test/test4',
            dataType:'json',
            success: function (data) {
                var text = '';
                for(var key in data){
                    text += key + ' -> ' + data[key] + '<br/>';
                }
                $(".moneyDiscount").html(text);
            },
            error: function(){
                console.log("请求失败")
            }
        });
    }

    function getTest5(){
        $.ajax({
            type:'GET',
            url:'test/test5',
            dataType:'json',
            success: function (data) {
                var text = '';
                var data2 = data.ticket_type_line_ticket;
                for(var temp in data2){
                    text += data2[temp].line + '->' + data2[temp].ticket_t + '->' + data2[temp].number + '->'
                            + data2[temp].percent + '->' + data2[temp].income + '<br/>';
                }
                $(".ticketTypeLineTicket").html(text);
            },
            error: function(){
                console.log("请求失败")
            }
        });
    }

    function getTest6(){
        $.ajax({
            type:'GET',
            url:'test/test6',
            dataType:'json',
            success: function (data) {
                var text = '';
                var data2 = data.lines;
                for(var temp in data2){
                    text += data2[temp].line + '->' + data2[temp].people + '->' + data2[temp].totaolSaveMoney
                             + '<br/>';
                }
                $(".lines").html(text);
            },
            error: function(){
                console.log("请求失败")
            }
        });
    }

    function getTest7(){
        $.ajax({
            type:'GET',
            url:'test/test7',
            dataType:'json',
            success: function (data) {
                var text = '';
                var data2 = data.line_ticket_type;
                for(var temp in data2){
                    text += data2[temp].line + '->'+ data2[temp].ticketType + '->' + data2[temp].people + '->' + data2[temp].totaolSavedMoney
                            + '<br/>';
                }
                $(".line_ticket_type").html(text);
            },
            error: function(){
                console.log("请求失败")
            }
        });
    }

    function getTest8(){
        $.ajax({
            type:'GET',
            url:'test/test8',
            dataType:'json',
            success: function (data) {
                var text = '';
                var data2 = data.stations;
                for(var temp in data2){
                    text += data2[temp].people + '->'+ data2[temp].station1 + '->' + data2[temp].totaolSavedMoney
                            + '<br/>';
                }
                $(".stations").html(text);
            },
            error: function(){
                console.log("请求失败")
            }
        });
    }


    function getTest9(){
        $.ajax({
            type:'GET',
            url:'test/test9',
            dataType:'json',
            success: function (data) {
                var text = '';
                var data2 = data.station_ticket_type;
                for(var temp in data2){
                    text += data2[temp].station1 + '->'+ data2[temp].ticketType + '->' + data2[temp].people + '->' + data2[temp].totaolSavedMoney
                            + '<br/>';
                }
                $(".station_ticket_type").html(text);
            },
            error: function(){
                console.log("请求失败")
            }
        });
    }
</script>

</body>
</html>
