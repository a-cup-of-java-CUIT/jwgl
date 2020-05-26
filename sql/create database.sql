create database jwgl;
use jwgl;

create table stuInfo        #学生信息
(
stuID char(10),                 #学号
password varchar(20),      #密码
stuName varchar(6),         #学生姓名
classID varchar(25)           #班级
);

create table Timetable      #班级课程表
(
term int,                           #学期1-8
code char(6),                     #课程代码 length=6
name varchar(25),             #课程名
credit float,                       #学分
lessonID varchar(16),         #课程序号 length=13/16
classID varchar(25) ,          #班级
teacher varchar(6)             #教师
);

create table LessonTime     #课程信息 
(
lessonID varchar(16),            #课程序号 length=13/16
place varchar(5),                   #地点
weekday int,                        #星期几 1~7
startTime int,                      #开始节 1~11
endTime int,                       #结束节 1~11
startWeek int,                      #开始周
endWeek int                      #结束周
);

create table Score        #成绩表
(
stuID char(10),              #学生学号
code char(6),                #课程代码
lessonID varchar(16),    #课程序号 length=13/16
name varchar(6),          #课程名
type varchar(25),          #课程类别
credit float,                   #学分
regular int,                   #平时成绩
finalExam int,               #期末成绩
total int,                        #总评成绩
GP float                        #绩点
);