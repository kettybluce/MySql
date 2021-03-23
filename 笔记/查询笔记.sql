#进阶1：基础查询
/*
语法：
select 查询列表 from 表名;

类似于：System.out.println(打印东西);

特点：

1、查询列表可以是：表中的字段、常量值、表达式、函数
2、查询的结果是一个虚拟的表格
*/

USE myemployees;

#1.查询表中的单个字段

SELECT last_name FROM employees;

#2.查询表中的多个字段
SELECT last_name,salary,email FROM employees;

#3.查询表中的所有字段

#方式一：
SELECT 
    `employee_id`,
    `first_name`,
    `last_name`,
    `phone_number`,
    `last_name`,
    `job_id`,
    `phone_number`,
    `job_id`,
    `salary`,
    `commission_pct`,
    `manager_id`,
    `department_id`,
    `hiredate` 
FROM
    employees ;
#方式二：  
 SELECT * FROM employees;
 
 
 # 4.查询常量值
 
 SELECT 100;
 
 SELECT 'join';
 
 # 5.查询表达式
 
SELECT
  100 % 2;

# 6.查询函数

SELECT VERSION();


# 7.起别名
/*
① 便于理解
② 如果查询的字段存在重名的情况，使用别名进行区分开来
*/
 

 SELECT last_name AS 姓,first_name 名 FROM employees;
 
 
 # 8.去重
 
 SELECT DISTINCT department_id	FROM employees;
 
 
 # 案例：查询员工表中涉及的所有部分编号
 
 SELECT DISTINCT department_id FROM employees;
 
 # 案例：查询员工名和姓链接成一个字段，并显示为姓名
 
 SELECT CONCAT(last_name,'_',first_name) AS 姓名 FROM employees;
 

#  进阶二
/*
语法：
    select 
	查询列表
    from
	表名
    where
	筛选条件;
	
	
 分类：
 
 一，按条件表达式筛选
 
 简单条件运算符：> < = != <> >= <=
 
 二，按逻辑表达式筛选
 
 逻辑运算符：
 作用：用于连接条件的表达式
 &&     ||    ！
 
 and   or    not
 
 
 && 和 and ：两个条件都为true，结果为true，反之为false
 || 和 or  ：只要有一个条件为true，结果为true，反之为false
 ！ 和 not ：如果链接的条件本身为false，结果为true，反之为fasle
 
 三，模糊查询
 
 like
 between  and
 in
 is  null
 
*/


# 一, 按条件查询表达式筛选

# 案例1：查询工资> 12000的员工信息

SELECT * FROM employees WHERE salary > 12000;


# 案例2：查询部门编号不等于90号的员工名和部门编号

SELECT last_name,department_id FROM employees WHERE department_id <>90;


# 二，按照表达式筛选

# 案例1:查询工资在10000到20000之间的员工名，工资以及奖金

SELECT last_name,salary,commission_pct FROM employees WHERE salary>=10000 AND salary<=20000;

# 案例2：查询部门编号不是90~110之间或者工资高于15000的员工信息


SELECT * FROM employees WHERE NOT(department_id>=90 
AND department_id <=100) OR salary>15000;



# 三,模糊查询
/*
关键字：like

between and
in
is null / is not  null
*/

/*
特点：
一般搭配和通配符使用
通配符：
	%：任意多个字符，包含0个字符
	_：任意单个字符
*/

# 案例一：查询员工名中包含字符a的员工信息

SELECT * FROM employees WHERE last_name LIKE '%a%';


# 案列二:查询员工名中第三个字符为e，第五个字符为a的员工名和工资

SELECT * FROM employees WHERE last_name LIKE '__n_l%';


# 案例三：查询员工名中第二个字符为'_'的员工名


SELECT * FROM employees WHERE last_name LIKE '_$_%' ESCAPE '$'


# betweend and
/*
① 使用between and 可以提高语句的简洁度
② 包含两个临界值
③ 两个临界值不能调换顺序
*/

# 案例：查询员工编号在100到120之间的员工信息


SELECT * FROM employees WHERE employee_id >=100 AND employee_id<=120;



#----------------------------------------------------


SELECT * FROM employees WHERE employee_id BETWEEN 100 AND 120;


# 3.in

/*
含义：判断某字段的值是否属于in列表中的某一项
特点：
    ① 使用in提高语句简洁度
    ② in列表的值类型必须一致或兼容
    ③ in列表中不支持通配符
*/

# 案例：查询员工的工种编号 IT_PROG,AD_PRES中的一个员工名和工种编号


SELECT last_name,job_id FROM employees
WHERE job_id='IT_PROG' OR job_id='AD_VP' OR JOB_ID='AD_PRES';


#---------------------------------------


SELECT last_name,job_id FROM employees
WHERE job_id IN('IT_PROG','AD_VP','AD_PRES')


# is null

/*

=或<>不能用于判断null值
is null 或 is not null可以判断null值

*/

# 案例1：查询没有奖金的员工名和奖金率


SELECT 
	last_name,
	commission_pct
FROM
	employees
WHERE 
	commission_pct IS NOT NULL;
	
	
	
	
#----------------------

SELECT last_name,commission_pct
FROM employees 
WHERE commission_pct IS NULL;


#---------------------------




