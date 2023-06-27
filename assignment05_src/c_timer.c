int time = 0;
int arr[5];

int* c_timer()
{
	int hour, min, sec;

	time++;

	min = time / 60;
	hour = min / 60;
	min = min % 60;
	sec = time % 60;


	arr[0] = hour / 10;
	arr[1] = hour % 10;
	arr[2] = min / 10;
	arr[3] = min % 10;
	arr[4] = sec / 10;
	arr[5] = sec % 10;	// 시간 정보 arr각 인덱스에 담음

	return arr;
}
