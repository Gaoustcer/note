#include<stdio.h>
#include<stdlib.h>
struct Node{
    int value;
    struct Node *next;
};
typedef struct Node Node;
void print(int a,int b,int c){
    printf("ROW A:");
    for(int i=1;i<=a;i++){
        printf("o");
    }
    printf("\n");
    printf("ROW B:");
    for(int i=1;i<=b;i++){
        printf("o");
    }
    printf("\n");
    printf("ROW C:");
    for(int i=1;i<=c;i++){
        printf("o");
    }
    printf("\n");
}
int lab4(){
    int A=2,B=5,C=8;
    int turn=1;
    print(A,B,C);
    int choose;
    char c;
    getchar();
    while(A+B+C!=1){
        printf("The player %d should input:",turn);
        scanf("%c %d",&c,&choose);
        getchar();
        if(c=='A'){
            if(choose<=A){
                A-=choose;
                turn=(turn+1)%3+1;
            }
            else{
                printf("Error\n");
            }
        }
        else if(c=='B'){
            if(choose<=B){
                B-=choose;
                turn=(turn+1)%3+1;
            }
            else{
                printf("Error\n");
            }
        }
        else if(c=='C'){
            if(choose<=C){
                C-=choose;
                turn=(turn+1)%3+1;
            }
            else{
                printf("Error\n");
            }
        }
        else{
            printf("Error\n");
        }
        print(A,B,C);
    }
    printf("The player %d win\n",turn);
}
int lab2(int x,int y){
    if(x==0||y==0){
        return 0;
    }
    if(x==y){
        return x;
    }
    else if(x>y){
        return lab2(x-y,y);
    }
    else{
        return lab2(y,x);
    }
}
void lab3(Node *header){
    Node *p1;
    Node *p2;
    int temp;
    p1=header;
    p2=header->next;
    while(p1!=NULL){
        while(p2!=NULL){
            if(p1->value<p2->value){
                temp=p1->value;
                p1->value=p2->value;
                p2->value=temp;
            }
            p2=p2->next;
        }
        p1=p1->next;
        if(p1!=NULL)
            p2=p1->next;
        else
            break;
    }
}
short cycle(short origin){
    short new_origin=origin<<1;
    if(origin<0){
        return new_origin+1;
    }
    else{
        return new_origin;
    }
}
int lab1(short origin,unsigned short times){
    for(int i=1;i<=times;i++){
        origin=cycle(origin);
    }
    return origin;
}
int lab5(){
    while(1){
        printf("ICS2020 ICS2020");
        char c=getchar();
        if(c>='0'&&c<='9'){
            printf("%c is a decimal digit");
        }
        else{
            printf("%c is not a decimal digit");
        }
    }
}
int main(){
    int x,y;
    scanf("%d%d",&x,&y);
    int result;
    result=lab1(x,y);
    printf("%d\n",result);
    result=lab2(x,y);
    printf("%d\n",result);
    Node *header;
    header=(Node *)malloc(sizeof(Node));
    Node *tempNode;
    tempNode=header;
    tempNode->next=(Node*)malloc(sizeof(Node));
    tempNode->next->next=(Node*)malloc(sizeof(Node));
    tempNode->next->next->next=NULL;
    tempNode->value=3;
    tempNode->next->value=5;
    tempNode->next->next->value=2;
    lab3(tempNode);
    while(tempNode){
        printf("tempNode is %d\n",tempNode->value);
        tempNode=tempNode->next;
    }
    lab4();
    lab5();
}