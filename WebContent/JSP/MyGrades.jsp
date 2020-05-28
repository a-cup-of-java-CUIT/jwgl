<%@ page language="java" 
	import="java.util.*" 
	import="jwgl.bean.Student"
	import="jwgl.service.*"
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jwgl.Entities.*" %>

<jsp:useBean id="login" class="jwgl.bean.Student" scope="session"></jsp:useBean>

<%
	if(login.getClassID() == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>我的课表</title>

    <style>
        body {
            font-size: 13px;
            font-family: Verdana, Arial, sans-serif;
            margin: 0;
        }

        .banner {
            background-color: #e0ecff;
            height: 60px;
            background-image: url(../images/head.jpg);
            background-repeat: repeat-x;
        }

        .logo {
            background: #1a537d;
        }

        .box {
            float: right;
        }

        .color-box {
            float: right;
            margin-top: 10px;
        }

        .color-box button {
            width: 10px;
            height: 10px;
            padding: 0;
            margin-right: 5px;
            border-width: 0;
        }

        .id {
            float: right;
            padding-right: 10px;
            padding-top: 7px;
        }

        .id-buttom {
            float: right;
            margin-top: 5px;
            margin-right: 5px;
        }

        .page {
            padding: 5px;
            display: flex;
            flex-wrap: wrap;
        }

        .left {
            width: 100%;
            display: flex;
            -webkit-justify-content: space-between;
            justify-content: space-between;
            flex-wrap: wrap;
            height: 100vh;
        }

        .nav {
            font-size: 15px;
            width: 10%;
        }

        .right-top {
            width: 90%;
        }

        .menu-head {
            background-image: url(menu_folder.jpg);
            color: #fff;
            background-size: 100% 100%;
            padding: 8px 0 8px 27px;
            cursor: pointer;
            margin-bottom: 2px;
            width: 150px;
        }

        .menu-head-active {
            background-image: url(menu_folder_active.jpg);
            color: #fff;
            background-size: 100% 100%;
            padding: 8px 0 8px 27px;
            cursor: pointer;
            margin-bottom: 2px;
            width: 150px;
        }

        .menu {
            padding-inline-start: 0;
            margin-block-start: 0;
            margin-block-end: 0;
            display: none;
        }

        .menu li {
            color: #275f9c;
            border-bottom: 1px solid #86b1e2;
            border-left: 1px solid #86b1e2;
            border-right: 1px solid #86b1e2;
        ;
            padding: 8px 0 8px 25px;
            list-style: none;
            margin: 0 2px 0 2px;

        }

        .menu li:hover {
            color: #86b1e2;
        }

        .nav-li-current {
            background-color: #e0ecff;
            color: #275f9c;
            border-bottom: 1px solid #86b1e2;
            border-left: 1px solid #86b1e2;
            border-right: 1px solid #86b1e2;
        ;
            padding: 8px 0 8px 25px;
            list-style: none;
            margin: 0 2px 0 2px;
        }

        .toolbar-title {
            border-bottom: 1px solid #c9c9c9;
            width: 1290px;
        }

        .toolbar-icon {
            background-image: url(../images/actions.png);
            display: inline-block;
            vertical-align: bottom !important;
            margin: 2px 2px 0 0;
            border: 0;
        }

        .action-info {
            background-position: -1378px 0;
            width: 16px;
            height: 16px;
        }

        .action-default {
            background-position: -264px 0;
            width: 16px;
            height: 16px;
            float: right;
        }

        .table-select {
            background: url(semesterBarBg.png) repeat-x scroll 50% 50% #DEEDF7;
            border: 1px solid #AED0EA;
            color: #222222;
            font-weight: bold;
            height: 28px;
            padding: 2px 0 2px 0;
        }

        .table-content {
            border: 1px solid #006CB2;
        ;
        }

        .print-bar {
            float: right;
        }

        table {
            border-collapse: collapse;
            text-align: center;
            width: 100%;
        }

        .course-tit td {
            font-weight: bold;
            background-color: #DEEDF7;
            border: 1px solid #006CB2;
        }

        .mor {
            padding: 10px 10px 10px 10px;
            text-align: center;
            background-color: rgb(238, 255, 0);
        }

        .aft {
            padding: 10px 10px 10px 10px;
            text-align: center;
            background-color: rgb(51, 187, 0);
        }

        .eve {
            background-color: rgb(0, 191, 255);
        }

        .c {
            background-color: rgb(148, 174, 243);
            border-color: #006CB2;
            border-style: solid;
            overflow: hidden;
            word-wrap: break-word;
        }

        td {


            border-color: #006CB2;
            border-style: solid;
            border-width: 0 1px 1px 0;
            overflow: hidden;
            word-wrap: break-word;

        }

        .c-list tr:hover {
            background-color: #abffb6;
        }

        .list {
            margin-top: 40px;
            margin-bottom: 40px;
        }
        .pictr{
            background:url(Images/b.png);
            background-repeat:no-repeat;
            height:35px;
            width:300px;
        }
        .gridhead{
            color: #000000;
            text-decoration: none;
            text-align: center;
            letter-spacing: 0;
        }
    </style>

</head>

<body>
<header>
    <div class="banner">
        <img src="../images/logo.png" height="60px">
        <div class="box">
            <div class="id-buttom">
                <img src="../images/b.png" width="250px">
            </div>

            <div class="id">
                <a href="" style="color: white;text-decoration: none;"></a>
                <span style="padding:0 2px;color:#FFF;font-weight:bold;">学生</span>
            </div>

            <div class="color-box">
                <button style="background-color: #FFFFFF;" value="#FFFFFF;"
                        onclick="body.style.backgroundColor='#FFFFFF';"></button>
                <button style="background-color: #FAF9DE;" value="#FAF9DE;"
                        onclick="body.style.backgroundColor='#FAF9DE';"></button>
                <button style="background-color: #FFF2DE;" value="#FFF2DE;"
                        onclick="body.style.backgroundColor='#FFF2DE';"></button>
                <button style="background-color: #FDE6E0;" value="#FDE6E0;"
                        onclick="body.style.backgroundColor='#FDE6E0';"></button>
                <button style="background-color: #E3EDCD;" value="#E3EDCD;"
                        onclick="body.style.backgroundColor='#E3EDCD';"></button>
                <button style="background-color: #DCE2F1;" value="#DCE2F1;"
                        onclick="body.style.backgroundColor='#DCE2F1';"></button>
                <button style="background-color: #E9EBFE;" value="#E9EBFE;"
                        onclick="body.style.backgroundColor='#E9EBFE';"></button>
                <button style="background-color: #EAEAEF;" value="#EAEAEF;"
                        onclick="body.style.backgroundColor='#EAEAEF';"></button>
            </div>
        </div>
    </div>
</header>

<div class="page">
    <div class="left">
        <script type="text/javascript">
            function $(id) { return document.getElementById(id) }
            window.onload = function () {
                $("nav").onclick = function (e) {
                    var src = e ? e.target : event.srcElement;
                    if (src.className === "menu-head") {
                        var next = src.nextElementSibling || src.nextSibling;
                        next.style.display = (next.style.display === "block") ? "none" : "block";
                        src.className = "menu-head-active";
                    }
                    else if (src.className === "menu-head-active") {
                        var next = src.nextElementSibling || src.nextSibling;
                        next.style.display = (next.style.display === "block") ? "none" : "block";
                        src.className = "menu-head";
                    }
                }
            }
        </script>

        <div class="nav" id="nav">
            <ul class="menu" style="display: block">
                <li id="first" class="nav-li-current" onclick="onCurrent(this);">我的课表</li>
                <li onclick="onCurrent(this);">我的成绩</li>
            </ul>
            <script>
                var preObj = document.getElementById("first");
                function onCurrent(obj) {
                    if (preObj != null) {
                        preObj.className = '';
                    }
                    obj.className = 'nav-li-current';
                    preObj = obj;
                }
            </script>
        </div>

        <div class="right-top">
            <div>
                <div class="toolbar-title">
                    <span class="toolbar-icon action-info"></span>
                    <strong>我的成绩</strong>
                </div>

                <div style="float: right">
                    <div class="toolbar-item" title="成绩详情"></div>
                    <span class="toolbar-icon action-default"></span>
                    成绩详情
                </div>
                <div style="padding-left: 0px;width: 1px;float: left;"></div>
                <div style="float: right">
                    <div class="toolbar-item" title="打印全部成绩成绩单"></div>
                    <span class="toolbar-icon action-default"></span>
                    打印全部成绩成绩单
                </div>
                <div style="float: right">
                    <div class="toolbar-item" title="打印已修课程成绩单"></div>
                    <span class="toolbar-icon action-default"></span>
                    打印已修课程成绩单
                </div>
            </div>
            <div class="toolbar-title">
                <span class="toolbar-icon action-info"></span>
            </div>
            <div class="course-table">
                <div class="table-select">
                    <strong>学年学期：</strong>
                    <select name="semester">
                        <option value="2019-2020-1">2019-2020学年第1学期</option>
                    </select>
                    <strong>| </strong>
                    <input type="button" style="color: red" value="点击切换学期">
                </div>
                <div class="table-content" >

                    <div class="list" style="margin-top: 0;">
                    <% ArrayList<Score> sList=serve.getScore(login,1); %>
                        <table class="c-list" >
                            <thead class="gridhead">


                            <tr>
                                <td  >学年学期</td >
                                <td  >课程代码</td>
                                <td >课程序号</td>
                                <td  >课程名称</td>
                                <td  >课程类别</td>
                                <td  >学分</td>
                                <td  >平时成绩</td>
                                <td  >期末成绩</td>
                                <td  >总评成绩</td>
                                <td   >最终</td>
                                <td  >绩点</td>
                            </tr>
							<%
								for(Score score : sList) {	
							%>
                            <tr>

                                <td><%= 1 %></td>
                                <td><%= score.getCode() %></td>
                                <td><%= score.getLessonID() %></td>
                                <td><%= score.getName() %></td>
                                <td><%= score.getType() %></td>
                                <td><%= score.getCredit() %></td>
                                <td><%= score.getRegular() %></td>
                                <td><%= score.getFinalExam() %></td>
                                <td><%= score.getTotal() %></td>
                                <td><%= score.getTotal() %></td>
                                <td><%= score.getGP() %></td>
                            </tr>
							<%
                                    }
                            %>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</body>

</html>