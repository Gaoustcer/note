# HTML学习

## HTML基础

### HTML标题<h1>---<h6>

```html
<h1>Title</h1>
<h2>Title</h2>
```

### HTML段落<p>

### HTML链接<a>

```html
<a href="http://www.runoob.com"> This is a link </a>
```

href指定链接的地址

### HTML图像<img>

```html
<img load="lazy" src="image path" width="width" height="height" />
```

## HTML元素

### HTML元素语法

* 以开始标签起始
* 以结束标签终止
* 元素的内容是开始标签和结束标签之间的内容
* 某些HTML元素具有空内容
* 空内容在开始标签中进行关闭
* 绝大多数HTML元素具有属性
* HTML元素可以互相嵌套
* HTML标签对大小写不敏感

## HTML属性

### 属性实例

eg：链接

```html
<a href="https://www.baidu.com"> This is a Link </a>
```

### 常用HTML元素的属性

* class 为html元素定义多个类型
* id 定义元素唯一的id
* style 规定元素的行内样式
* title 元素的额外信息

## HTML标题 段落 文本 链接 头部

### 标题

<h1> </h1> <h2></h2>

水平线 <hr>

<p></p><hr>

注释

<! -- xxx --->

### 段落

<p> </p> <!--段落开头和结尾自动添加空行>

拆行：在不产生新段落的情况下进行换行

### 文本

<b>粗体 <i>斜体

<strong> <em>突出显示字体

## HTML 脚本

<script>
    
</script>

<noscript>提供了脚本无法显示时，显示noscript中的内容
    
</noscript>

## CSS(Cascading Style Sheets)简介

### function:渲染HTML元素标签的样式

### CSS通过以下方式添加到HTML中

* 内联样式-在HTML元素中使用“style”属性
* 内联样式表-在HTML文档头部<head>区域使用<style>元素包含CSS
* 外部引用-使用外部CSS文件