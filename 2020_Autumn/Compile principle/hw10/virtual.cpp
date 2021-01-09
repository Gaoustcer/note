#include<iostream>
using namespace std;


typedef class A{
public:
    int a;
    A():a(4){}
    virtual void print(){
        cout<<"This is A\n";
    }
}A;
typedef class B: virtual public A{
public:
    int b;
    B():A(),b(4){}
    virtual void print(){
        cout<<"Thus is B\n";
    }
}B;
typedef class C: virtual public A{
public:
    int c;
    C():A(),c(4){}
    virtual void print(){
        cout<<"This is C\n";
    }
}C;
typedef class D: public B,public C{
public:
    int d;
    D():B(),C(){}
    void print(){
        cout<<"This is D\n";
    }
}D;
int main(){
    D *p=new D;
    A *pa=p;
    cout<<p<<endl;
    cout<<pa<<endl;
    return 0;
}