<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.regex.*" %>

<%
List<Map<String, Object>> lists = (List<Map<String, Object>>)request.getAttribute("lists");
String pagestr= (String)request.getAttribute("pagestr");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
<body>
<p class="path">外卖后台/订单中心/订单列表</p>

		<table border="0" cellspacing="0" cellpadding="0" class="tb tblis">
	       <tr>
	       	  <td style="width:200px;">订单号</td><td style="width:150px;">姓名</td><td style="width:150px;">电话</td><td>地址</td><td style="width:150px;">总金额</td><td style="width:200px;">时间</td><td style="width:200px;">操作</td>   
	       </tr>
			<%for (Map<String, Object> m : lists) { %>
	        <tr>
	       		<td><%=m.get("id")%></td>
	       		<td><%=m.get("orderid")%></td>
	       		<td><%=m.get("sname")%></td>
	       		<td><%=m.get("stel")%></td>
	       		<td><%=m.get("saddress")%></td>
	       		<td><%=m.get("sumprice")%></td>
	       		<td><%=m.get("ctime")%></td>
	       		<td><a href="OrderView?id=<%=m.get("id")%>">详情</a> <a href="OrderDelete?id=<%=m.get("id")%>">删除</a></td>
	       </tr>
	    	<% } %>
			</table>
			
	</body>
</html>