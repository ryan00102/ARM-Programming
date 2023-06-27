#include <stdio.h>

#define CSD_SW_ADDR 0x41210000

int csd_main(){
	volatile int *sw_ptr = (int *)CSD_SW_ADDR;
	int sw_value = 0;
	sw_value = *sw_ptr;
	sw_value = sw_value & 0xFF;

	if(sw_value & 0x80){
		return 0x03333333;
	}
	else if(sw_value & 0x40){
		return 0x06666666;
	}
	else if(sw_value & 0x20){
		return 0x09999999;
	}
	else if(sw_value & 0x10){
		return 0x0ccccccc;
	}
	else if(sw_value & 0x08){
		return 0x0fffffff;
	}
	else if(sw_value & 0x04){
		return 0x13333332;
	}
	else if(sw_value & 0x02){
		return 0x16666665;
	}
	else if(sw_value & 0x01){
		return 0x19999998;
	}
	else{
		return 0x1fffffff;
	}
}
