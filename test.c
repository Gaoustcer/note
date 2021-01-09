#include<stdio.h>
int main(){
    int a[10]={10,2,3,4,51,35,31,3};
    int temp;
    for(int i=0;i<10;i++){
        for(int j=i+1;j<10;j++){
            if(a[i]<a[j]){
                temp=a[i];
                a[i]=a[j];
                a[j]=temp;
            }
        }
    }
    for(int i=0;i<10;i++){
        printf("%d ",a[i]);
    }
    return 0;
}