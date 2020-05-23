<%@ page language="java" 
	import="java.util.*" 
	import="bean.Student"
	import="service.serve"
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Entities.Timetable" %>

<jsp:useBean id="student" class=bean.Student scope="session"></jsp:useBean>

<!DOCTYPE html>
<html lang="en" >
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
        <img src="../Images/1.png" height=60px />

        <div class="box">
            <div class="id-buttom">
                <a href=""><img src="../Images/b.png" width=250px /></a>
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
                <li id="first" class="nav-li-current" onclick="onCurrent(this);">我的课表</li>
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
     
 <div class="right-top">
            <div class="toolbar-title">
                <span class="toolbar-icon action-info"></span>
                <strong>我的课表</strong>
            </div>
 </div>        
 
  <div class="course-table">
            <div class="table-select">
                <strong>课表类型：</strong>
                <select name="type">
                    <option value="stu">学生课表</option>
                    <option value="tea">教师课表</option>
                </select>
                <strong>| </strong>
                <strong>选择教学周：</strong>
                <select name="week">
                    <option value="0">全部</option>
                    <option value="1">第一周</option>
                    <option value="2">第二周</option>
                </select>
                <strong>| </strong>
                <strong>学年学期：</strong>
                <select name="semester">
                    <option value="2019-2020-1">2019-2020学年第1学期</option>
                </select>
                <strong>| </strong>
                <input type="button" style="color: red" value="点击切换学期">
            </div>
        </div>
        <div class="table-content">
            <div style="color: red;width: 1290px">点击上方"课表类型"可切换查看不同类型课表</div>
            <div class="print-bar">
                <div >
                    <span class="toolbar-icon action-default"></span>
                    <div style="float: right">我的课表</div>
                </div>
            </div>
            <div class="table">
                <table id="course">
                    <tr class="course-tit">
                        <td style="width: 90px">节次/周次</td>
                        <td>星期一</td>
                        <td>星期二</td>
                        <td>星期三</td>
                        <td>星期四</td>
                        <td>星期五</td>
                        <td>星期六</td>
                        <td>星期日</td>
                    </tr>
                    <tr >
                        <td class="mor">第一节</td>
                        <td class="c" rowspan="2">
                            xxxxx<br>
                            教师：xx<br>
                            周次： x-x周<br>
                            教室：xxxx
                        </td>
                        <td></td>
                        <td class="c" rowspan="2">
                            xxxxx<br>
                            教师：xx<br>
                            周次： x-x周<br>
                            教室：xxxx
                        </td>
                        <td class="c" rowspan="2">
                            xxxxx<br>
                            教师：xx<br>
                            周次： x-x周<br>
                            教室：xxxx
                        </td>
                        <td class="c" rowspan="2">
                            xxxxx<br>
                            教师：xx<br>
                            周次： x-x周<br>
                            教室：xxxx
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr >
                        <td class="mor">第二节</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="mor">第三节</td>
                        <td class="c" rowspan="2">
                            xxxxx<br>
                            教师：xx<br>
                            周次： x-x周<br>
                            教室：xxxx
                        </td>
                        <td class="c" rowspan="2">
                            xxxxx<br>
                            教师：xx<br>
                            周次： x-x周<br>
                            教室：xxxx
                        </td>
                        <td class="c" rowspan="2">
                            xxxxx<br>
                            教师：xx<br>
                            周次： x-x周<br>
                            教室：xxxx
                        </td>
                        <td class="c" rowspan="2">
                            xxxxx<br>
                            教师：xx<br>
                            周次： x-x周<br>
                            教室：xxxx
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="mor">第四节</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr >
                        <td class="aft">第五节</td>
                        <td class="c" rowspan="2">
                            xxxxx<br>
                            教师：xx<br>
                            周次： x-x周<br>
                            教室：xxxx
                        </td>
                        <td class="c" rowspan="2">
                            xxxxx<br>
                            教师：xx<br>
                            周次： x-x周<br>
                            教室：xxxx
                        </td>
                        <td class="c" rowspan="2">
                            xxxxx<br>
                            教师：xx<br>
                            周次： x-x周<br>
                            教室：xxxx
                        </td>
                        <td></td>
                        <td class="c" rowspan="2">
                            xxxxx<br>
                            教师：xx<br>
                            周次： x-x周<br>
                            教室：xxxx
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="aft">第六节</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr >
                        <td class="aft">第七节</td>
                        <td></td>
                        <td class="c" rowspan="2">
                            xxxxx<br>
                            教师：xx<br>
                            周次： x-x周<br>
                            教室：xxxx
                        </td>
                        <td></td>
                        <td class="c" rowspan="2">
                            xxxxx<br>
                            教师：xx<br>
                            周次： x-x周<br>
                            教室：xxxx
                        </td>
                        <td class="c" rowspan="2">
                            xxxxx<br>
                            教师：xx<br>
                            周次： x-x周<br>
                            教室：xxxx
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr >
                        <td class="aft">第八节</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="eve">第九节</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr >
                        <td class="eve">第十节</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="eve">第十一节</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>
        
<%
	serve ser=new serve();
	ArrayList<Timetable> tList=new ArrayList<Timetable>();

	
	//Timetable t1 = new Timetable();
	//Timetable t2 = new Timetable();
	//t1.setClassID("全校");
    //t1.setCode("AM050A");
    //t1.setCredit(2);
    //t1.setLessonID("AM050A.191001");
    //t1.setName("工程伦理");
    //t1.setTeacher("沈艳");
    //tList.add(t1);
    //t2.setClassID("计算机181");
    //t2.setCode("CS003A");
    //t2.setCredit(3.5f);
    //t2.setLessonID("CS003A.191002");
    //t2.setName("数据库原理及应用A");
    //t2.setTeacher("杨昊");
	
    //Timetable t = new Timetable();
    //t=ser.getTimetable(tableType, week, term, student)
	
	//tList.add(t);
%>        


            <div class="list">
                <strong style="padding-left: 610px">课程列表:</strong>
                <table class="c-list">
                    <tr class="course-tit">
                        <td>序号</td>
                        <td>课程代码</td>
                        <td>课程名称</td>
                        <td>学分</td>
                        <td>课程序号</td>
                        <td>教学班</td>
                        <td>教师</td>
                        <td>操作</td>
                    </tr>
<%

for (Timetable timetable : tList) {

%>              
                    <tr>
                    	<td></td>
                        <td><%= timetable.getCode() %></td>
					    <td><%= timetable.getName() %></td>
					    <td><%= timetable.getCredit() %></td>
					    <td><%= timetable.getLessonID() %></td>
					    <td><%= timetable.getClassID() %></td>
					    <td><%= timetable.getTeacher() %></td>
                    </tr>
<%
}
%>                    
                </table>
            </div>


    </div>
</div>
</div>
</body>
</html>