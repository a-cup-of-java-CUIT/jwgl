<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jwgl.service.Authentic"
		import="jwgl.bean.Student"
		import="java.sql.*"
%>
<jsp:useBean id="login" class="jwgl.bean.Student" scope="session" ></jsp:useBean>
<!DOCTYPE html>
<html>
  <head>
  	<meta charset="UTF-8">
    <title>登录</title>
  </head> 
  <body>
  <%--登录页表单 --%>
   	<form name="form1" action="property.jsp" method="post">
 	<p>学号:<input type="text" name ="stuID" 
	placeholder="请输入网存账户/学号" >      </p>

	 <p>密码：<input type="password" name ="password" 
	    placeholder="请输入登录密码" >     </p>   
  	 <p>
	<input type = "submit" value = "登录">
	</p>
	</form>

	
   </body>
 </html>
