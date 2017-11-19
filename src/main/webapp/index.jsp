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
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script type="application/javascript">
    $(function(){
        getTest();
        getTest2();
        getTest3();
        getTest4();
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
</script>

</body>
</html>
