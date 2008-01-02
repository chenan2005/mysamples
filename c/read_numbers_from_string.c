#include <stdlib.h>
#include <stdio.h>

inline bool is_digit(char c) { return c>='0' && c<='9'; }
inline bool is_dot(char c) { return c=='.'; }

int read_numbers(const char* input, double* numbers)
{
	int idx=0;
	int current_section_start=-1;
	bool current_section_has_dot=false;
	int count=0;
	while(input[idx]!=0)
	{
		if(is_digit(input[idx]) ||
				(!current_section_has_dot) && is_dot(input[idx])){
			if(current_section_start<0){
				current_section_start=idx;
			}
			if(is_dot(input[idx])){
				current_section_has_dot=true;
			}
		}
		else {
			if (current_section_start>=0){
				numbers[count]=atof(input+current_section_start);
				count++;
			}
			current_section_start=-1;
			current_section_has_dot=false;
		}
		idx++;	
	}	
	if(current_section_start>=0){
		numbers[count]=atof(input+current_section_start);
		count++;
	}
	return count;
}

int main() 
{
	const char* input="....12,34,56 78&90asr07 1.45 2.9xx4";
	double numbers[128]={0};
	int count=read_numbers(input, numbers);
	printf("input string: %s, read %d numbers\n", input, count);
	int i=0;
	for (i=0; i<count; i++){
		printf("number %d: %f\n", i, numbers[i]);
	}
	return 0;
}
