//netchk-v1.2-xmcp;
#include <windows.h>
#include <iostream>
using namespace std;
#define cmd "ping /n 1 /w 200 114.114.114.114>nul"
inline int ping()
{
	bool die=(system(cmd)&&system(cmd)&&system(cmd));
	cout<<time(NULL)<<" : connection="<<!die<<endl;
	return die;
}
inline void msg(bool die)
{MessageBox(NULL,die?"Connection Lost":"Connection Established.","NetChk",0);}
int main()
{
	system("title NetChk");
	bool die=ping();
	while(1)
	{
		while(die!=ping())
		{
			die=!die;
			msg(die);
		}
		Sleep(die?2000:5000);
	}
}
