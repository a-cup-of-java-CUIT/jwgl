use jwgl;

insert into Timetable values
(1,'CS004A','计算机组成原理',4.5,'CS004A.192001','计科181','刘双虎'),
(1,'CS103A','专业教育',0.5,'CS103A.192001','计科181','邹茂扬'),
(1,'CS104A','软件工程',3,'CS104A.192001','计科181','邹书蓉'),
(1,'CS107A','web前端编程',1.5,'CS107A.192001','计科181','韩永红'),
(1,'CS112A','计算机图形学',3,'CS112A.192001','计科181','文武'),
(1,'CS114A','J2EE',3.5,'CS114A.192001','计科181','汤蓉'),
(1,'FL004A','大学英语4A',2,'FL004A.192058','计科182','方古'),
(1,'MA003A','马克思主义基本原理',3,'MA003A.192077','计科181','侯莲梅'),
(1,'MA008A','形势与政策3',0.5,'MA008A.192138','计科182','岳旭媛'),
(1,'MS004C','概率论与数理统计C',3,'MS004C.192026','计科181','袁勇'),
(1,'SP004A','体育',1,'SP004A-03.191016','计科182','任超');


use jwgl;
insert into LessonTime values
('CS114A.192001','H1108',1,3,4,1,8),
('MA003A.192077','H2303',1,5,6,1,17),
('CS107A.192001','H1101',1,7,8,1,8),
('CS112A.192001','H1207',1,7,8,9,18),
('FL004A.192058','H4406',2,1,2,1,16),
('CS104A.192003','H2102',2,3,4,1,10),
('MS004C.192026','H1208',2,5,6,1,12),
('CS004A.192001','H1504',2,7,8,1,14),
('CS114A.192001','H1108',3,1,2,1,8),
('SP004A-03.191016','排球场1',3,7,8,1,12),
('CS104A.192003','H1102',4,3,4,1,8),
('MA003A.192077','H1308',4,5,6,13,17),
('MS004C.192026','H1208',4,5,6,1,12),
('CS104A.192003','H1207',4,7,8,9,10),
('CS004A.192001','H1504',5,3,4,1,14),
('MA008A.192138','H1208',5,7,8,5,8),
('CS112A.192001','H1507',5,7,8,7,18);

use jwgl;
insert into stuInfo values
('2018122020','12345','王苏宁','计科181'),
('2018032077','12345','屈睿','计科182'),
('2018051046','12345','杜洁','计科182'),
('2018051075','12345','张祥意','计科182');