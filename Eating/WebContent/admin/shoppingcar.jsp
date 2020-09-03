<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.regex.*" %>

<%
List<Map<String, Object>> lists = (List<Map<String, Object>>)request.getAttribute("lists");
Map<String, Object> userid = (Map<String, Object>)session.getAttribute("userid");
%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			.mainboxtu1 .w1{
				width: 50px;
				height: 50px;
				background-color: blue;
			}
			.mainboxtu11{
				width: 435.5px;
				height: 20%;
				background-color: red;
			}
			#btngotoorder{
				display: block;
				width: 200px;
				height: 40px;
				background-color:#3091f2;
				line-height: 40px;
				text-align: center;
				color: #fff;
				cursor: pointer;
				margin-top: 20px;
				margin-left:84px;
			}
		</style>
		 <link rel="stylesheet" type="text/css" href="css/index.css"/>
		 <link rel="stylesheet" type="text/css" href="css/common.css"/>
		 <link rel="stylesheet" type="text/css" href="css/shoppingcar.css"/>
		 <link rel="stylesheet" type="text/css" href="css/productview.css"/>
	</head>
	<body>
	<form method="post" action="/Eating/DingdanAdd?userid=<%=userid.get("id") %>">
		<div class="head">
			<div class="hbox"> 
				<p class="hbox1"><a href="index.html" >首页</a><a href="dingdan.html">我的订单</a><a href="###">加盟合作</a><a href="###">我的客户</a></p>
				<p class="hbox2"><a href="guize.html" >规则中心</a><a href="###">手机应用</a><a href="###" >新闻资询</a> </p>
				
				<div class="navbox3">
						<ul class="menu">
							<li>
								登录|注册
								<div class="subnav">
									<a href="zhuce.html">注册</a>
									<a href="index_login.html">登录</a>
									<a href="###">退出登录</a>
									<%=userid.get("loginname") %>
								</div>
							</li>
						</ul>
				</div> 
				<div class="navbox4">
						<ul class="menu">
							<li>
								产品系列
								<div class="subnav">
									<a href="###">川菜</a>
									<a href="###">粤菜</a>
									<a href="###">苏菜</a>
									<a href="###">浙菜</a>
									<a href="###">徽菜</a>
									<a href="###">闽菜</a>
									<a href="###">鲁菜</a>
									<a href="###">湘菜</a>
								</div>
							</li>
						</ul>
				</div> 
			</div>
		</div>

		<div id="carheader">
			<div id="carheaderwrapper" class="innerclass">
				<a href="index.html" id="carlogo"><img src="img/logo.png" style="width: 60px;height:60px; "/></a>
				<span id="mycar">我的购物车</span>
				<span id="msg">温馨提示：商品是否购买成功，以下单为准，请尽快结算哦.</span>
			</div>
		</div>
		
		<table border="0" cellspacing="0" cellpadding="0" class="innerclass" id="cartable">
			<tr>
				<td style="width: 150px;height: 30px;">菜品图片</td>
				<td style="width: 150px;">菜品名称</td>
				<td style="width: 150px;">单价</td>
				<td style="width: 150px;">数量</td>
				<td style="width: 150px;">小计</td>
				<td style="width: 150px;">操作</td>
			</tr>
			
			<%for (Map<String, Object> m : lists) { %>
            <tr class="orderitem" data-price="<%=m.get("price")%>">
       		<td style="width: 150px;height: 30px;">菜品图片</td>
       		<td ><%=m.get("cainame")%></td>
       		<td ><%=m.get("price")%></td>
       		<td >    
       		        
       		        <input style="width: 22px; height: 25px;font-size:16px;text-align: center;background-color: white;border: 1px solid #EEEEEE;left: 1px;"  class="min left" type="button" value="-" />
                    <input class="text_box"  name="bunnum"  type="text" value="<%=m.get("count")%>" style="width: 26px;text-align: center;border: 1px solid #EEEEEE;height: 23px;margin: 0;"/>
                    <input style="width: 22px; height: 25px;font-size:16px;text-align: center;background-color: white;border: 1px solid #EEEEEE;" class="add right" type="button" value="+" />
                    
            </td>
       		
       		    <td>¥ <b class="sumitem"></b></td>
				<td><span class="del">删除</span></td>
			<% } %>
			</tr>
			<tr >    
       	            <td style="border-bottom: none;"><span>配送费</span>
                        <span >¥<b class="sendprice">2.0</b></span>
                    </td>
            </tr>
		</table>
		
		<p id="carbuy" class="innerclass"><a href="index.html">继续购物</a> <span style="padding-left: 20px;color:#3091f2;font-size:18px;">合计 <span id="sumprice"></span>元 </span> <span id="btnorder">去结算</span></p>
		<div id="receiverinfo" class="innerclass">
				<p>取餐者姓名:<input type="text" name="sname" id="sname" /></p>
				<p>取餐者电话:<input type="text" name="stel" id="stel" /></p>
				<p>
					取餐者地址:
					<!--<input type="text" name="tbaddress" id="tbaddress" />-->
					<select name="saddress" id="saddress" class="dong">
						<option value="" disabled selected>------------------下拉选择地址------------------</option>
						<option value="C13">重庆工商大学融智学院13栋</option>
						<option value="C12">重庆工商大学融智学院12栋</option>
						<option value="C11">重庆工商大学融智学院11栋</option>
						<option value="C10">重庆工商大学融智学院10栋</option>
						<option value="C09">重庆工商大学融智学院9栋</option>
						<option value="C08">重庆工商大学融智学院8栋</option>
						<option value="C07">重庆工商大学融智学院7栋</option>
						<option value="C06">重庆工商大学融智学院6栋</option>
						<option value="C05">重庆工商大学融智学院5栋</option>
						<option value="C04">重庆工商大学融智学院4栋</option>
						<option value="C03">重庆工商大学融智学院3栋</option>
						<option value="C02">重庆工商大学融智学院2栋</option>
						<option value="C01">重庆工商大学融智学院1栋</option>
						<option value="G04">重庆工商大学融智学院G4高层</option>
						<option value="G05">重庆工商大学融智学院G5高层</option>
					</select>
				</p>
				<p>取餐门牌号:<input type="text" name="saddress2" id="saddress2" placeholder="如：202"/></p>
				<p>
					<span id="btngotoorder"><input style="background-color:#eee;" value="确认下单" type="submit"/></span>
				</p>
		</div>	
		</form>
      <!--尾部开始-->
		<div class="root">
			<div class="word">
				<div class="r1 h1">
					<p><h3 style="color: #31302B;">用户帮助</h3> </p>
					<p><a href="##"> 我的客户</a></p>
				</div>
				<div class="r2 h1">
					<p><h3 style="color: #31302B;"> 商务合作</h3> </p>
					<p><a href="##">我要开店</a></p>
					<p><a href="##">加盟指南</a></p>
					<p><a href="##">市场合作</a></p>
					<p><a href="##">开放平台</a></p>
					 
				</div>
				<div class="r3 h1">
					<p><h3 style="color: #31302B;">关于我们</h3></p>
					<p><a href="##">该吃饭了介绍</a></p>
					<p><a href="##">加入我们</a></p>
					<p><a href="##">联系我们</a></p>
					<p><a href="##">规则中心</a></p>
					<p><a href="##">隐私政策</a></p>
				</div>
				<div class="r4 h1">
					<p>24小时服务热线：101010100</p>
					<p><a>关注我们：</a><a href="##"> <img src="img/logo2.png" style="width: 60px;height:60px; "/></a>  <a href="##"><img src="img/5.png"></a></p>
				</div>
				<div class="r5 h1">
					<p><img src="img/logo2.png" style="width: 60px;height:60px; "/></p>
					<p><h4 style="color: #31302B;">下载手机版</h4></p>
					<p><a>点餐更方便</a></p>
				</div>
		   </div>
		 </div>

		<!--尾部结束-->
		
		<script src="js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			//给id为 btnorder的元素绑定一个点击事件
			$("#btnorder").click(function(){
				//点击id为 btnorder的按钮，就会执行此处的代码
				$("#receiverinfo").slideDown();
			});
			
			//给立即下单的按钮绑定一个点击事件
			$("#btngotoorder").click(function(){
				//要去判断这三个文本框里面是否输入了内容  判断的标准：去获取每个文本框里面的值，看这个值的长度是否大于0，如果大于0，就表示输入了内容
				if(!$("#sname").val().length>0)//判断长度是否大于0，取反之后就数不大于0，即：没有输入内容。
				{
					alert("请输入取餐者姓名!");
					$("#sname").focus();//让一个表单元素获得焦点 
					return false;
				}
				
				if(!$("#stel").val().length>0)//判断长度是否大于0，取反之后就数不大于0，即：没有输入内容。
				{
					alert("请输入取餐者联系电话!");
					$("#stel").focus();//让一个表单元素获得焦点 
					return false;
				}
				
				if(!$("#saddress").val().length>0)//判断长度是否大于0，取反之后就数不大于0，即：没有输入内容。
				{
					alert("请输入取餐者详细地址!");
					$("#saddress").focus();//让一个表单元素获得焦点 
					return false;
				}
				
				//检查购物车里面是否又商品
				var len=$("#cartable").find("tr").length;
				if(len<2)
				{
					e.preventDefault();
					return false;
				}
				
				$.ajax({
				    url:'uiaddorder', //要请求的url地址
				    type:'POST', //请求方法 GET or POST
				    async:true, //是否使用异步请求的方式
				    timeout:5000, //请求超时的时间，以毫秒计
				    data:{
				    	tbname:$("#tbname").val(),
				        tbtel:$("#tbTel").val(),
				        tbaddress:$("#tbaddress").val()
				    },
				    dataType:'json', //预期的服务器返回参数类型
				    beforeSend:function(){
				        
				    },//再发送请求前调用的方法
				    success:function(data) {
				       location.href="result.jsp";
				    }, //请求成功时回调方法，data为服务器返回的数据
				    error:function(){
				       
				    }, //请求发生错误时调用方法
				    complete:function(){
						jisuan();
				    } 
				});
				
			});
			
			
			//给所有的加号绑定点击事件
			$(".pronumber span.right").click(function(){
				//点击加号的时候，把当前加号按钮所在的行的商品数量取出来，加上1  然后再放回去。
				var oldvalue=$(this).prev().val();
				var newvalue=parseInt(oldvalue)+1;
				var that=this;
				var proid=$(that).parent().parent().parent().attr("data-proid");
				$.ajax({
				    url:'uiupdatecarcount', //要请求的url地址
				    type:'POST', //请求方法 GET or POST
				    async:true, //是否使用异步请求的方式
				    timeout:5000, //请求超时的时间，以毫秒计
				    data:{
				        id :proid,
				        countvalue:newvalue
				    },
				    dataType:'json', //预期的服务器返回参数类型
				    beforeSend:function(){
				        
				    },//再发送请求前调用的方法
				    success:function(data) {
				        console.log(data);
				    }, //请求成功时回调方法，data为服务器返回的数据
				    error:function(){
				       
				    }, //请求发生错误时调用方法
				    complete:function(){
				    	$(that).prev().val(newvalue);
						jisuan();
				    } //回调方法 无论success或者error都会执行
				});
				
			});
			//给所有的减号绑定点击事件
			$(".pronumber span.left").click(function(){
				//点击加号的时候，把当前加号按钮所在的行的商品数量取出来，加上1  然后再放回去。
				var oldvalue=$(this).next().val();
				var newvalue=parseInt(oldvalue)-1;
				if(newvalue<1)
				{
					newvalue=1;
				}
				
				var that=this;
				var proid=$(that).parent().parent().parent().attr("data-proid");
				$.ajax({
				    url:'uiupdatecarcount', //要请求的url地址
				    type:'POST', //请求方法 GET or POST
				    async:true, //是否使用异步请求的方式
				    timeout:5000, //请求超时的时间，以毫秒计
				    data:{
				        id :proid,
				        countvalue:newvalue
				    },
				    dataType:'json', //预期的服务器返回参数类型
				    beforeSend:function(){
				        
				    },//再发送请求前调用的方法
				    success:function(data) {
				        console.log(data);
				    }, //请求成功时回调方法，data为服务器返回的数据
				    error:function(){
				       
				    }, //请求发生错误时调用方法
				    complete:function(){
				    	$(that).prev().val(newvalue);
						jisuan();
				    } //回调方法 无论success或者error都会执行
				});
				
				
				$(this).next().val(newvalue);
				jisuan();
			});
			
			
			
			$("span.del").click(function(){
				var that=this;
				var proid=$(that).parent().parent().attr("data-proid");
				$.ajax({
				    url:'uicardelete', //要请求的url地址
				    type:'POST', //请求方法 GET or POST
				    async:true, //是否使用异步请求的方式
				    timeout:5000, //请求超时的时间，以毫秒计
				    data:{
				        id :proid
				    },
				    dataType:'json', //预期的服务器返回参数类型
				    beforeSend:function(){
				        
				    },//再发送请求前调用的方法
				    success:function(data) {
				        console.log(data);
				        $(that).parent().parent().remove();
				    }, //请求成功时回调方法，data为服务器返回的数据
				    error:function(){
				       
				    }, //请求发生错误时调用方法
				    complete:function(){
						jisuan();
				    } 
				});
			});
			
			
			
			
			jisuanjiage();
			//计算价格
			function jisuanjiage()
			{
				var sumall=0;
				$(".orderitem").each(function(index,item){
					 var danjia=$(item).attr("data-price");
					 var buycount=$(item).find("input[name='bunnum']").val();
					 danjia=parseFloat(danjia);
					 buycount=parseInt(buycount);
					 var itemsum=danjia*buycount;
					 $(item).find("b.sumitem").text(itemsum);
					 sumall=sumall+itemsum;
					 
				});	
				var sendprice=$("b.sendprice").text();
				sendprice=parseFloat(sendprice);
				sumall=sumall+sendprice;
				$("#sumprice").text(sumall);
			}
			
			$("input.add").click(function(){
				var buynum=$(this).parent().find("input[name='bunnum']").val();
				buynum=parseInt(buynum);
				buynum++;
				$(this).parent().find("input[name='bunnum']").val(buynum);	
				jisuanjiage();
			});
			
			$("input.min").click(function(){
				var buynum=$(this).parent().find("input[name='bunnum']").val();
				buynum=parseInt(buynum);
				if(buynum>1)
				{
					buynum--;
				}			
				$(this).parent().find("input[name='bunnum']").val(buynum);	
				jisuanjiage();
			});
		</script>
	</body>
</html>
