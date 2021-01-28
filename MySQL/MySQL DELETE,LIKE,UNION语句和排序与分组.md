# MySQL DELETE,LIKE,UNION语句和排序与分组

## DELETE，LIKE，UNION

### DELETE

```sql
DELETE FROM table_name [WHERE clause]
```

* 不指定WHERE,会删除表中所有记录
* 在WHERE语句中指定条件

### LIKE

* 某个字段含有某个字符串作为其子串，LIKE语句用于模糊匹配

#### 语法

```sql
select field1,field2,...,fieldn
from table_name
where table_name
where field1 LIKE condition1 [AND [OR]] field2='somevalue'
```

* 在WHERE语句中使用LIKE
* LIKE可以代替=
* LIKE与%一起使用，类似于一个元字符的搜索
* AND/OR指定一个或多个条件

#### 用法

* %xxx%：查询某个字段中包含xxx的记录
* %xxx：查询某个字段中以xxx结尾的的记录
* xxx%：查询某个字段中以xxx开头的记录

#### 是否使用索引？

* 我们之前提到过索引，创建索引的目的就是为了提高查找的效率
* 某些时候like查找会使用索引，有时不会

### Union操作符

* 用于连接两个以上的SELECT语句的结果组合到一个结果集合中，多个SELECT语句会删除

```sql
SELECT expression1, expression2, ... expression_n
FROM tables
[WHERE conditions]
UNION [ALL | DISTINCT]
SELECT expression1, expression2, ... expression_n
FROM tables
[WHERE conditions];
```

* expression1 expression2 ... expression是要检索的列
* table要检索的表
* WHERE conditions检索条件
* DISTINCT:删除结果集中重复的数据
* ALL:返回所有结果集，包含重复数据