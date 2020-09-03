<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.regex.*" %>
<!-- 上面的三行代码是引入对应的java包 -->
<%
List<Map<String, Object>> lists = (List<Map<String, Object>>)request.getAttribute("lists");
%>
<!-- 上面的一行代码是从request对象中取出查询出来的数据列表，取出数据之后强制转换为List<Map<String, Object>>这种类型 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>
			<p class="path">外卖后台/管理员中心</p>
			<table border="0" cellspacing="0" cellpadding="0" class="tb tblis">
				<tr>
	       	 		<td style="width:50px;">ID</td><td style="width:150px;">管理员登录名</td><td style="width:150px;">管理员登录密码</td><td style="width:150px;">姓名</td><td style="width:150px;">操作</td>   
       			</tr>
       			<%for (Map<String, Object> m : lists) { %>
	        <tr>
	       		<td><%=m.get("id")%></td>
	       		<td><%=m.get("username")%></td>
	       		<td><%=m.get("mima")%></td>
	       		<td><%=m.get("truename")%></td>
	       		<td><a href="AdminEdit?id=<%=m.get("id")%>">修改</a> <a href="AdminDelete?id=<%=m.get("id")%>">删除</a></td>
	       </tr>
	    	<% } %>
			</table>
	</body>
</html>