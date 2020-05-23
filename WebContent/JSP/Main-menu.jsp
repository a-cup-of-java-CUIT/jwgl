<%@ page language="java" 
	import="java.util.*" 
	import="jwgl.bean.Student"
	import="jwgl.service.serve"
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jwgl.Entities.Timetable" %>
 <jsp:useBean id="login" class="jwgl.DAO.TheDAO" scope="session"></jsp:useBean>

<%
	if((session.isNew()))
	{
		response.sendRedirect("login.jsp");
	}
%>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>我的课表</title>
    
    <style>
		    body{
		    font-size: 13px;
		    font-family: Verdana, Arial, sans-serif;
		    margin: 0;
		}
		.banner{
		    background-color: #e0ecff;
		    height: 60px;
		    background-image: url(head.jpg);
		    background-repeat: repeat-x;
		}
		.logo{
		    background: #1a537d;
		}
		.box{
		    float: right;
		}
		.color-box{
		    float: right;
		    margin-top: 10px;
		}
		.color-box button{
		    width: 10px;height: 10px;
		    padding: 0;
		    margin-right: 5px;
		    border-width: 0;
		}
		.id{
		    float: right;
		     padding-right: 10px;
		    padding-top: 7px;
		 }
		.id-buttom{
		    float: right;
		    margin-top: 5px;
		    margin-right: 5px;
		}
		.page{
		    padding: 5px;
		    display: flex;
		    flex-wrap: wrap;
		}
		.left{
		
		    display: flex;
		    -webkit-justify-content: space-between;
		    justify-content: space-between;
		    flex-wrap: wrap;
		    height: 100vh;
		}
		.nav{
		    font-size: 15px;
		}
		.menu-head{
		    background-image: url(menu_folder.jpg);
		    color: #fff;
		    background-size: 100% 100%;
		    padding: 8px 0 8px 27px;
		    cursor:pointer;
		    margin-bottom: 2px;
		    width: 150px;
		}
		.menu-head-active{
		    background-image: url(menu_folder_active.jpg);
		    color: #fff;
		    background-size: 100% 100%;
		    padding: 8px 0 8px 27px;
		    cursor:pointer;
		    margin-bottom: 2px;
		    width: 150px;
		}
		.menu{
		    padding-inline-start: 0;
		    margin-block-start: 0;
		    margin-block-end: 0;
		    display:none;
		}
		.menu li{
		    color: #275f9c;
		    border-bottom: 1px solid #86b1e2;
		    border-left: 1px solid #86b1e2;
		    border-right: 1px solid #86b1e2;;
		    padding: 8px 0 8px 25px;
		    list-style: none;
		    margin: 0 2px 0 2px;
		
		}
		.menu li:hover{
		    color: #86b1e2;
		}
		.nav-li-current{
		    background-color: #e0ecff;
		    color: #275f9c;
		    border-bottom: 1px solid #86b1e2;
		    border-left: 1px solid #86b1e2;
		    border-right: 1px solid #86b1e2;;
		    padding: 8px 0 8px 25px;
		    list-style: none;
		    margin: 0 2px 0 2px;
		}
		.right{
		    display: -webkit-flex;
		    display: flex;
		    -webkit-justify-content: space-between;
		    justify-content: space-between;
		    flex-wrap: wrap;
		    padding-left: 10px;
		    width: 1290px;
		}
		.toolbar-title{
		    float: left;
		    border-bottom: 1px solid #c9c9c9;
		    width: 1290px;
		}
		.toolbar-icon{
		    background-image: url(actions.png);
		    display: inline-block;
		    vertical-align: bottom !important;
		    margin: 2px 2px 0 0;
		    border: 0;
		}
		.action-info{
		    background-position: -1378px 0;
		    width: 16px;
		    height: 16px;
		}
		.action-default{
		    background-position: -264px 0;
		    width: 16px;
		    height: 16px;
		    float: right;
		}
		.table-select{
		    background: url(semesterBarBg.png) repeat-x scroll 50% 50% #DEEDF7;
		    border: 1px solid #AED0EA;
		    color: #222222;
		    font-weight: bold;
		    height: 28px;
		    padding: 2px 0 2px 0;
		    width: 1290px;
		}
		.table-content{
		    border: 1px solid #006CB2;;
		}
		.print-bar{
		    float: right;
		}
		table{
		    border-collapse: collapse;
		    width: 1290px;
		    text-align: center;
		}
		.course-tit td{
		    font-weight: bold;
		    background-color: #DEEDF7;
		    border: 1px solid #006CB2;
		}
		.mor{
		    padding: 10px 10px 10px 10px;
		    text-align: center;
		    background-color: rgb(238, 255, 0);
		}
		.aft{
		    padding: 10px 10px 10px 10px;
		    text-align: center;
		    background-color: rgb(51, 187, 0);
		}
		.eve{
		    background-color: rgb(0, 191, 255);
		}
		.c{
		    background-color: rgb(148, 174, 243);
		    border-color: #006CB2;
		    border-style: solid;
		    overflow: hidden;
		    word-wrap: break-word;
		}
		td{
		
		
		    border-color: #006CB2;
		    border-style: solid;
		    border-width: 0 1px 1px 0;
		    overflow: hidden;
		    word-wrap: break-word;
		
		}
		.c-list tr:hover{
		    background-color: #abffb6;
		}
		.list{
		    margin-top: 40px;
		    margin-bottom: 40px;
		}
		    
    </style>
    
</head>

<body>
<header>
    <div class="banner">
        <img src="logo.png" height=60px>

        <div class="box">
            <div class="id-buttom">
                <a href=""><img src="b.png" width=250px></a>
            </div>

            <div class="id">

                <a href="" style="color: white;text-decoration: none;">XXX(XXXXXXXXXX)</a>
                <span style="padding:0 2px;color:#FFF;font-weight:bold;">学生</span>
            </div>
            <div class="color-box">
                <button style="background-color: #FFFFFF;" value="#FFFFFF;" onclick="body.style.backgroundColor='#FFFFFF';"></button>
                <button style="background-color: #FAF9DE;" value="#FAF9DE;" onclick="body.style.backgroundColor='#FAF9DE';"></button>
                <button style="background-color: #FFF2DE;" value="#FFF2DE;" onclick="body.style.backgroundColor='#FFF2DE';"></button>
                <button style="background-color: #FDE6E0;" value="#FDE6E0;" onclick="body.style.backgroundColor='#FDE6E0';"></button>
                <button style="background-color: #E3EDCD;" value="#E3EDCD;" onclick="body.style.backgroundColor='#E3EDCD';"></button>
                <button style="background-color: #DCE2F1;" value="#DCE2F1;" onclick="body.style.backgroundColor='#DCE2F1';"></button>
                <button style="background-color: #E9EBFE;" value="#E9EBFE;" onclick="body.style.backgroundColor='#E9EBFE';"></button>
                <button style="background-color: #EAEAEF;" value="#EAEAEF;" onclick="body.style.backgroundColor='#EAEAEF';"></button>

            </div>

        </div>
    </div>
</header>

<div class="page">

    <div class="left">
        <script type="text/javascript">
            function $(id){return document.getElementById(id)}
            window.onload = function(){
                $("nav").onclick = function(e){
                    var src = e?e.target:event.srcElement;
                    if(src.className === "menu-head"){
                        var next = src.nextElementSibling || src.nextSibling;
                        next.style.display = (next.style.display ==="block")?"none":"block";
                        src.className = "menu-head-active";
                    }
                    else if (src.className === "menu-head-active"){
                        var next = src.nextElementSibling || src.nextSibling;
                        next.style.display = (next.style.display ==="block")?"none":"block";
                        src.className = "menu-head";

                    }
                }

            }





        </script>


        <div id="nav">

            <div class="menu-head-active">我的</div>
            <ul class="menu" style="display: block">
                <li onclick="onCurrent(this);">学籍信息</li>
                <li onclick="onCurrent(this);">培养计划</li>
                <li onclick="onCurrent(this);">选课</li>
                <li id="first" class="nav-li-current" onclick="onCurrent(this);"><a href="NewFile.jsp">我的课表</a></li>
                <li onclick="onCurrent(this);">我的考试</li>
                <li onclick="onCurrent(this);">我的成绩</li>
                <li onclick="onCurrent(this);">计划完成情况</li>
                <li onclick="onCurrent(this);">转专业申请</li>
                <li onclick="onCurrent(this);">免修申请</li>
                <li onclick="onCurrent(this);">重修缴费查询</li>
            </ul>
            <div class="menu-head">量化评教</div>
            <ul class="menu">
                <li onclick="onCurrent(this);">学生学情调查</li>
                <li onclick="onCurrent(this);">量化评教</li>
            </ul>
            <div class="menu-head">公共服务</div>
            <ul class="menu">
                <li onclick="onCurrent(this);">公共课表查询</li>
            </ul>
            <script>
                var preObj = document.getElementById("first");
                function onCurrent(obj) {
                    if (preObj != null ) {
                        preObj.className = '';
                    }
                    obj.className = 'nav-li-current';
                    preObj = obj;
                }
            </script>
        </div>




    </div>


        </div>
</body>
</html>