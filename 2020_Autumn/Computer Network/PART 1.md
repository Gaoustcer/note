## 思考题解答

1. HTTP1.1

![image-20201113200021013](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201113200021013.png)

2. 中文-大陆 中文-台湾 中文-香港，英文

   

![image-20201113200234053](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201113200234053.png)

3. 本地IP:114.214.252.245 目的主机IP:128.119.245.12![image-20201113200458458](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201113200458458.png)

4. 200![image-20201113203137717](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201113203137717.png)

5. ![image-20201113203327432](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201113203327432.png)

6. ![image-20201113203405649](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201113203405649.png)

7. context_length
8. 没有![image-20201113204158557](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201113204158557.png)

9. yes

![image-20201113204531940](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201113204531940.png)

​	10.有![image-20201113205202951](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201113205202951.png)

是一个空行，下面是传输的数据，完整的URL

11. ![image-20201113205818198](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201113205818198.png)

304 没有修改，表示对象在给定时间之后没有修改

12. 两次

![image-20201113212409207](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201113212409207.png)

13. 三个![image-20201113233004709](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201113233004709.png)
14. 200![image-20201113233103881](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201113233103881.png)
15. 没有，观察报文内容可以发现，所有报文内容一次性全部返回，context_length较长![image-20201114204126138](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201114204126138.png)
16. 三个get，第一个Get对html获取，剩下两个get对两个图片对象进行获取

![image-20201113234539231](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201113234539231.png)

17. 可以根据时间判断![image-20201113234650070](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201113234650070.png)

可以根据时间判断，因为两个对象请求的时间不相同，存在明显的先后顺序，不可能是并行的

18. initial responce

    ![image-20201114202845877](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201114202845877.png)

这个响应的含义是告诉用户，GET已经正常收到，返回的报文告诉我们没有权限访问这个服务器

19. 观察wireshark报文，可以发现请求报文中多了一项

![image-20201114203832753](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20201114203832753.png)