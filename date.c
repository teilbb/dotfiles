#include <stdio.h>
#include <time.h>
int main()
{
time_t timer;
char buffer[11];
struct tm* tm_info;
time(&timer);
tm_info = localtime(&timer);
strftime(buffer, 11, "%Y-%m-%d", tm_info);
puts(buffer);
return 0;
}
