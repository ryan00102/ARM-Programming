#include <stdio.h>
#pragma GCC target("thumb")


int main()
{

    int indata[32] = { 2, 0, -7, -1, 3, 8, -4, 10,
                           -9, -16, 15, 13, 1, 4, -3, 14,
                           -8, -10, -15, 6, -13, -5, 9, 12,
                           -11, -14, -6, 11, 5, 7, -2, -12 };//outdata�� �����Ͽ� ���� ���� ���� �迭 ����
    int outdata[32];//����� ���� �迭 ����
    int temp;//���� ���Ŀ��� Ȱ���� temp ����
    for (int i=0;i<31;i++){
    	for(int j=0;j<31-i;j++){
    		if(indata[j]>indata[j+1]){//���� �ε����� ���� �� ũ�ٸ� swap
    			temp = indata[j];
    			indata[j] = indata[j+1];
    			indata[j+1] = temp;
    		}
    	}
    }
    for(int i =0;i<32;i++){//outdata�� ���ĵ� indata ���� �Ű���
    	outdata[i] = indata[i];
    	printf("%d ", outdata[i]);
    }

}