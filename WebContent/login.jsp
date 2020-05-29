<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jwgl.service.Authentic"
		import="jwgl.bean.Student"
		import="java.sql.*"
%>
<!DOCTYPE html>
<html>
  <head>
  	<meta charset="UTF-8">
	<title>登录</title>
	<style>
		*{
		font-family:"微软雅黑"; 
		margin:0; 
		padding:0; 
		border:0;
		}
		input{
		margin:0; 
		padding:0; 
		border:none; 
		outline:none; }
		div{ 
		display:block;
		}
		.clearfix{
		clear:both;
		}
		.left{ 
		float:left;
		}
		.right{ 
		float:right;
		}
		:-moz-placeholder { 
		/* Mozilla Firefox 4 to 18 */
		    color: #999; 
		    opacity:1; 
		    }
		::-moz-placeholder { /* Mozilla Firefox 19+ */
		    color: #999;
		    opacity:1;
		    }
		input:-ms-input-placeholder{ 
		color: #999;
		opacity:1;
		}
		input::-webkit-input-placeholder{ 
		color: #999;
		opacity:1;
		}
		/* 登录界面*/
		/*---------------------header----------------------*/
		.header{ 
		width: 97%; 
		height:135px;
		position:relative;
		z-index: 100; 
		margin:0 auto; 
		background: no-repeat top left; 
		overflow: hidden; 
		margin-left: 3%;
		}
		.header .logo{ 
		margin-top:30px; 
		margin-left: 90px;
		}
		/*---------------------banner---------------------*/
		.banner{ 
		width:100%;  
		position:relative; 
		height:565px; 
		overflow:hidden;
		background: url(images/background.jpg) rgba(0, 0, 0, 0) center 0 no-repeat; background-size: cover; right:0; left:0; overflow: hidden;}
		/*---------------login--------------*/
		.login-aside{
		position:absolute; 
		width:343px; 
		height:367px; 
		z-index:9999999; 
		left:58%; 
		top:20%;
		 background:rgba(0,0,0,0.1); 
		 }
		#o-box-down{
		width:317px; 
		height:341px;
		background: #fff; 
		margin: 12px auto; 
		box-shadow: 2px 2px 5px rgba(0,0,0,0.2);
		}
		.login-name{ 
		width:90%; 
		margin: 0 auto; 
		font-size: 16px; 
		font-weight: bold; 
		color: #393939; 
		padding: 18px 0 10px 0; 
		margin-bottom: 18px; 
		border-bottom:solid 2px #EBEBEB; 
		}
		.fm-item{
		width:90%; 
		margin: 0 auto; 
		margin-bottom: 18px;
		}
		#o-box-up { 
		background-color:#fff; 
		filter:alpha(opacity 50); 
		opacity: 0.5;
		}
		.fm-item input{
		width:90%; 
		margin-left: 5%; 
		line-height:34px;  
		border:1px solid #e9e6da;  
		background:#f4f4f4;  
		color:#999; 
		font-size:14px; 
		text-indent:1em;
		}
		#stuID{ 
		background:url(images/user_icon.png) no-repeat left #fff; 
		text-indent:2em;
		}
		#password{ background:url(images/password_icon.png) no-repeat left #fff; 
		text-indent:2em;
		}
		.yzm{ 
		width: 90%; 
		overflow: hidden;
		}
		.yzm input{ 
		width:50%!important; 
		float: left; 
		margin-right: 10px;
		}
		.remember{
		width:90%; 
		color: #0ea6fc;
		}
		.remember input{ 
		width:18px; 
		height:18px; 
		line-height:18px;
		}
		.remember p{
		margin-left:5px; 
		font-size:14px; 
		line-height:16px;
		}
		.login-btn{ 
		width:80%; 
		margin: 18px auto;
		background:#1a83c9; 
		text-align: center;
		font-size: 16px; 
		color: #fff; 
		padding: 10px 0; 
		cursor: pointer;
		}
		.login-btn-1{
		    width: 100%;
		    height: 100%;
		    background-color: #1a83c9;
		    cursor: pointer;
		}
		/*---------------------footer--------------------*/
		.footer{
		width: 100%; 
		padding:18px 0; 
		text-align:center; 
		font-size: 14px; 
		color:#666; 
		display:block; 
		position:absolute; 
		right:0; 
		left:0;
		}
		 
	</style>
  </head> 
<body>
<!-----header---->
    <div class="header">
        <h1 class="headerLogo"><img src="images/logocuitv2.jpg" class="logo" /></h1>
    </div>
<!-----banner---->
    <div class="banner">
        <div class="login-aside">
            <div id="o-box-down">
                <div class="login-name">用户登录</div>
                <form class="registerform" name="form1" action="property.jsp" method="post">
                    <div class="fm-item">
	                      <input type="text" placeholder="请输入网存账号/学号" maxlength="100" name="stuID" id="stuID" >    
                    </div>  
  
                    <div class="fm-item">
	                      <input type="password" placeholder="请输入登录密码"  maxlength="100" name="password" id="password">    
                    </div>
  
                    <div class="fm-item yzm">
	                      <input type="text" placeholder="输入验证码"  id="yzm" >    
                        <div class="yzm-img left"><img src="images/yzm.jpg" /></div>
                    </div>
  	                <div class="clearfix"></div>
                    <div class="fm-item remember">
                        <input class="left" type="checkbox">
                        <p class="left">记住密码</p>
                    </div>
	                  <div class="clearfix"></div>
                    <div class="login-btn"><input type="submit" value="登 录" 
                        class="login-btn-1">
                    </div>
                  </form>
            </div>
                
        </div>
    </div>
    <div class="footer"><p>航空港校区 | 四川省成都市西南航空港经济开发区学府路一段24号 | 邮编：610225 | 电话：028-85966502 <br/>
        龙泉校区 | 成都市龙泉驿区阳光城幸福路10号 | 邮编：610103 | 电话：028-84833333</p></div>
</body>
</html>

