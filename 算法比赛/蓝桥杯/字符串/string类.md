
```c++
//string类的部分操作符的作用

#include <bits/stdc++.h> //万能头文件

#define endl '\n'        // 将endl转为'\n'避免使用endl降低速度
typedef long long ll；
using namespace std;
signed main()
{

    // 关流三板斧(提高输出流速度)

    ios::sync_with_stdio(0);

    cin.tie(0);

    cout.tie(0);

  

    string s1,s2="abc";

    cin >> s1;

    cout <<(s1==s2?"s1==s2":"s1!=s2")<<endl;

    cout <<(s1>=s2?"s1>=s2":"s1<s2")<<endl;

  

    s1="new";

    s1=s1+'_';

    s1+=s2;

    for(int i =s1.length()-1;i>=0;i--){

        cout << s1[i];

    }

    return 0;

}
```

```c++

#include <bits/stdc++.h>
#define endl '\n'
typedef long long ll;
using namespace std;

int main()
{
	string str;
	getline(cin,str);
	
	int len = str.size();
	for(int i =0;i<len;i++){
		if(str[i]>='a'&&str[i]<='z'){
			str[i]=str[i]-'a'+'A';//等价于toupper(str[i]) 
 
		}
	}
	cout <<str <<endl;
	return 0;	
} 
```

```c++

//string类的单行数据读取
    
    string line;

    getline(cin, line);

    istringstream iss(line);

    vector<string> validnames;

    string name;

    while (iss >> name) { // 正确存储多个名称

        validnames.push_back(name);

    }



//string类多行读取数据
	vector<string> validnames;
    for(int i=0;i<n;i++){

        string name;

        cin>>name;

        validnames.push_back(name);

    }
```