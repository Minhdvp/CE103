#include <REGX51.H>
void delay(int time)
{
while(time--);}
void blink(){
P0 = P1 = P2 = P3 = 0xff;
delay(10000);
}
void main(){
while(1){
blink();}
}