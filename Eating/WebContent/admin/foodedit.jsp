<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.regex.*" %>
<%
Map<String, Object> objbyid = (Map<String, Object>)request.getAttribute("objbyid");

String s="";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="admin/css/comm.css"/>
	</head>
<body>
		<p class="path">外卖后台/菜品中心/发布菜品</p>
		<form action="FoodEdit" method="post" enctype="multipart/form-data"> 
			<input type="hidden" name="id" value="<%=objbyid.get("id") %>"/>
			<a href="FoodListWithOutPager">返回列表</a>
			<table border="0" cellspacing="0" cellpadding="0" class="tb">
				<tr>
					<td class="lable">菜系</td><td>
					    <select name="kind">
					    	<option value="川菜" <%=objbyid.get("kind").equals("川菜")?"selected='selected'":""%>>川菜</option>
					    	<option value="粤菜" <%=objbyid.get("kind").equals("粤菜")?"selected='selected'":""%>>粤菜</option>
					    	<option value="苏菜" <%=objbyid.get("kind").equals("苏菜")?"selected='selected'":""%>>苏菜</option>
					    	<option value="浙菜" <%=objbyid.get("kind").equals("浙菜")?"selected='selected'":""%>>浙菜</option>
					    	<option value="徽菜" <%=objbyid.get("kind").equals("徽菜")?"selected='selected'":""%>>徽菜</option>
					    	<option value="闽菜" <%=objbyid.get("kind").equals("闽菜")?"selected='selected'":""%>>闽菜</option>
					    	<option value="鲁菜" <%=objbyid.get("kind").equals("鲁菜")?"selected='selected'":""%>>鲁菜</option>
					    	<option value="湘菜" <%=objbyid.get("kind").equals("湘菜")?"selected='selected'":""%>>湘菜</option>
					    </select>
				    </td>
				</tr>
				<tr><td class="lable">菜名</td><td><input type="text" name="cainame" value="<%=objbyid.get("cainame")%>"/></td></tr>
				<tr><td class="lable">价格</td><td><input type="text" name="price" value="<%=objbyid.get("price")%>"/></td></tr>
				<tr><td class="lable">特色</td><td><input type="text" name="brief" value="<%=objbyid.get("brief")%>"/></td></tr>
				<tr><td class="lable">图片</td><td><input type="file" name="file1"/> <img src="/Eating/upload/<%=objbyid.get("imgurl")%>"/></td></tr>
				<!-- <tr><td><input type="hidden" name="descriptions" id="descriptions"/></td></tr> -->
				<tr><td class="lable">&nbsp;</td><td><input type="submit" name="btnsave" value="保存" id="btnsave"/></td></tr>
			</table>
		</form>
		
		
	</body>
</html>