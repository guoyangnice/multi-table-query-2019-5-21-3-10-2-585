# 1.查询同时存在1课程和2课程的情况
select t1.studentid 
from 
(select * from student_course t where t.courseId = 1 or t.courseId = 2) t1 
GROUP BY t1.studentid 
having count(t1.studentid) > 1;
# 2.查询同时存在1课程和2课程的情况
select t1.studentid 
from 
(select * from student_course t where t.courseId = 1 or t.courseId = 2) t1 
GROUP BY t1.studentid 
having count(t1.studentid) > 1;
# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select id,name,AVG(score)
from student s,student_course sc
where s.id = sc.studentId
GROUP BY s.id 
HAVING AVG(score)>=60
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select * from student t 
where t.id 
not in (select DISTINCT studentId from student_course);
# 5.查询所有有成绩的SQL
select * from student t 
where t.id 
in (select DISTINCT studentId from student_course);
# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select t1.studentid,s.*
from 
(select * from student_course t where t.courseId = 1 or t.courseId = 2) t1,student s 
GROUP BY t1.studentid 
having 
count(t1.studentid) > 1 and s.id = t1.studentid;
# 7.检索1课程分数小于60，按分数降序排列的学生信息
select 
id as '学生号',sc.score as '分数'
from student s,student_course sc
where s.id=sc.studentId
HAVING sc.score < 60
ORDER BY sc.score desc

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select id,name,AVG(score)
from student s,student_course sc
where s.id = sc.studentId
GROUP BY s.id 
HAVING AVG(score)>=60
ORDER BY AVG(score) desc

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select 
s.name,sc.score
from student s,student_course sc
where s.id = sc.studentId
and courseId = '2'
and sc.score<60