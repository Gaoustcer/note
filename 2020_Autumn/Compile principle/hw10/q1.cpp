#include<iostream>
#include<string>
using namespace std;
class A{
private:
    int data;
public:
    A(int a):data(a){}
    void print(){
        cout<<data<<endl;
    }
    void add(){
        data++;
    }
};
class B: public A{
private:
    double data;
public:
    B(int a,double b):A(a),data(b){}
    void print(){
        cout<<data<<endl;
        A::print();
    }
};
class C: public A
{
private:
    float data;
public:
    C(int a,float b):A(a),data(b){}
    void print(){
        cout<<data<<endl;
        A::print();
    }
    void add(){
        data++;
        A::add();
    }
};
class D: public C,public B
{
private:
    string data;
public:
    D(int a1,int a2,double d,float f,string str):
        B(a1,d),
        C(a2,f),
        data(str)
    {}
    void print(){
        cout<<data<<endl;
        B::print();
        C::print();
    }
    void add(){
        C::add();
    }
};
int main(){
    class D D1(4,4,4.3,4.3,"A+");
    D1.print();
    D1.add();
}


