#include <stdio.h>
#pragma GCC target("thumb")


int main()
{

    int indata[32] = { 2, 0, -7, -1, 3, 8, -4, 10,
                           -9, -16, 15, 13, 1, 4, -3, 14,
                           -8, -10, -15, 6, -13, -5, 9, 12,
                           -11, -14, -6, 11, 5, 7, -2, -12 };//outdata에 정렬하여 넣을 값을 가진 배열 선언
    int outdata[32];//결과를 받을 배열 선언
    int temp;//버블 정렬에서 활용할 temp 선언
    for (int i=0;i<31;i++){
    	for(int j=0;j<31-i;j++){
    		if(indata[j]>indata[j+1]){//작은 인덱스의 값이 더 크다면 swap
    			temp = indata[j];
    			indata[j] = indata[j+1];
    			indata[j+1] = temp;
    		}
    	}
    }
    for(int i =0;i<32;i++){//outdata에 정렬된 indata 값을 옮겨줌
    	outdata[i] = indata[i];
    	printf("%d ", outdata[i]);
    }

}
