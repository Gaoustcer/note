#include<iostream>
using namespace std;


typedef class A{
public:
    int a;
    A():a(4){}
    void print(){
        cout<<"This is A\n";
    }
}A;
typedef class B: public A{
public:
    int b;
    B():A(),b(4){}
    void print(){
        cout<<"Thus is B\n";
    }
}B;
typedef class C: public A{
public:
    int c;
    C():A(),c(4){}
    void print(){
        cout<<"This is C\n";
    }
}C;
typedef class D: public B,public C{
public:
    int d;
    D():B(),C(){}
    int print(){
        cout<<"This is D\n";
    }
}D;
void func(){
    return;
}
int main(){
    D*p=new D;
    /*B*pb=p;
    A*pc=pb;
    cout<<p<<endl;
    cout<<pc<<endl;*/
    /*D*p=new D;
    A*pc=p;
    cout<<p<<endl;
    cout<<pc<<endl;*/
    /*D*p=new D;
    C*pc=p;
    cout<<p<<endl;
    cout<<pc<<endl;*/
    int (*f)(void);
    //f=p->print();
    //f=func();
    cout<<f<<endl;
}