# MySQL教程-MySQL基本功能语句入门

## 数据库创建、删除与选择

### MySQL创建数据库

登录MySQL之后，用create命令创建一个数据库

```mysql
CREATE DATABASE data_base_name;
```

使用mysqladmin创建数据库——对于root用户

```sql
mysqladmin -u root -p create data_base_name
```

### MySQL删除数据库

drop命令

```sql
drop database data_base_name;
```

mysqladmin在终端删除数据库

```sql
mysqladmin -u root -p drop data_base_name
```

![image-20210124172507479](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20210124172507479.png)

![image-20210124172607556](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20210124172607556.png)

下一行指的是对于数据库不存在的情况会报错

### Mysql选择数据库

```sql
use data_base_name ;
```

## MySQL数据类型

请看这篇文章[MySQL数据类型](https://www.runoob.com/mysql/mysql-data-types.html)

## MySQL数据表创建、删除

### MySQL创建数据表

创建一个数据表，需要提供一下信息

* 表名
* 表字段名
* 定义每个表字段

#### 语法

```sql
CREATE TABLE table_name (column_name column_type);
```

可以有多组column_name和column_type

命令实例

```sql
CREATE TABLE IF NOT EXISTS `runoob_tbl`(
   `runoob_id` INT UNSIGNED AUTO_INCREMENT,
   `runoob_title` VARCHAR(100) NOT NULL,
   `runoob_author` VARCHAR(40) NOT NULL,
   `submission_date` DATE,
   PRIMARY KEY ( `runoob_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

* 表项的字段不能为NULL，则设置NOT NULL属性
* QUTO_INCREMENT用于主键，设置自增属性
* PRIMARY KEY定义主键是那一列
* ENGINE设置存储引擎，MySQL实际上只是一个接口，需要调用底层的存储引擎实现功能，CHARSET设置编码方式

![image-20210124175933772](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20210124175933772.png)

#### 创建表出现的常见错误

##### 创建了一个不含任何列的表是不允许的

![image-20210124180238124](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20210124180238124.png)

##### 必须指定表的主键，即使表只有一列

![image-20210124180403505](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20210124180403505.png)

### 删除数据表

#### 语法

```sql
DROP TABLE table_name;
```

