# MySQL教程-数据的插入与查询，WHERE字句和更新语句

**2021-1-25 Gaoustcer**

## 数据的插入和查询

向一个数据表中插入和删除数据之前需要创建这个表所属的数据库，并选中这个数据库并创建数据表

如果你忘了你创建的数据库名称，可以使用命令show databases;

查看数据库中的表名称可以用命令show tables;

查看表结构desc table_name;

### 插入语法

```sql
INSERT INTO table_name(field1,field2,...,fieldn)
					VALUES
					(value1,value2,...,valuen)
```

* 字符型数据插入必须使用“”或‘’
* 自增的主键不用作为数据插入
* 查看某个表可以使用命令 select * from table_name

### 查询语法

```sql
SELECT COLUMN_NAME,COLUMN_NAME 
FROM TABLE_NAME 
[WHERE CLAUSE]
[LIMIT N][OFFSET M]
```

* 查询语句可以使用一个或多个表，表之间用，分隔，WHERE设定查询条件
* SELECT命令可以读取一条或者多条记录，第二行TABLE_NAME可以为多个表
* 可以用*替代其它字段，SELECT此时会返回表的所有字段数据
* WHERE设定查询条件，WHERE字句会在稍后介绍
* LIMIT设置返回的记录数
* OFFSET指定SELECT语句开始查询的数据偏移量，默认为0
* CLAUSE是一个查找语句

## WHERE&&UPDATE

### WHERE

#### 语法

```sql
[WHERE condition1 [AND [OR]] condition2...]
```

* WHERE可以运用于DELETE和UPDATE命令
* AND OR指定一个或多个条件

#### 操作符列表

值得注意的是，MySQL里用=判断相等而不是==

其余和C基本一致，<>可以判断不等于的关系

没有查找到返回empty set

[ ]表示字段是可选的

BINARY关键字可以帮我们在查找结果中区分大小写，MySQL某人是不区分大小写的

### UPDATE

```sql
UPDARE table_name SET field1=new-value1, field2=new-value2
[WHERE CLAUSE]
```

* 先查找，再更新
* WHERE语句的用法和上面相同
* 注意，主键不能通过UPDATE命令修改