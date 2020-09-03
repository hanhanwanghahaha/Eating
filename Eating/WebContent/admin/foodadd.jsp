<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="css/comm.css" />
	</head>
	<body>
		<form action="../FoodAdd" method="post" enctype="multipart/form-data">
			<p class="path">外卖后台/菜品中心/发布菜品</p>
			<table border="0" cellspacing="0" cellpadding="0" class="tb">
				<tr>
					<td class="lable">菜系</td><td>
					    <select name="kind">
					    	<option value="川菜">川菜</option>
					    	<option value="粤菜">粤菜</option>
					    	<option value="苏菜">苏菜</option>
					    	<option value="浙菜">浙菜</option>
					    	<option value="徽菜">徽菜</option>
					    	<option value="闽菜">闽菜</option>
					    	<option value="鲁菜">鲁菜</option>
					    	<option value="湘菜">湘菜</option>
					    </select>
				    </td>
				</tr>
				<tr><td class="lable">菜名</td><td><input type="text" name="cainame"/></td></tr>
				<tr><td class="lable">价格</td><td><input type="text" name="price"/></td></tr>
				<tr><td class="lable">特色</td><td><input type="text" name="brief"/></td></tr>
				<tr><td class="lable">图片</td><td><input type="file" name="file1"/></td></tr>
				<!-- <tr><td><input type="hidden" name="descriptions" id="descriptions"/></td></tr> -->
				<tr><td class="lable">&nbsp;</td><td><input type="submit" name="btnsave" value="保存" id="btnsave"/></td></tr>
			</table>
		</form>
	</body>
</html>
