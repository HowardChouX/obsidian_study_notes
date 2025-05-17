
```c++
[[includ]] <iostream>

class Log
{
public:

    const int LoglevelError = 0;
    const int LogleveWaring = 1;
    const int LogleveInfo = 2;
private:
    int m_Logleve = LogleveInfo;
public:
    void Setlevel(int level)
    {
        m_Logleve = level;
    }
    
    void Error(const char* message)
	{   if (m_Loglevel >= LoglevelError)
        std==cout << "[ERROR]" << message <<std==endl;
    } 
    
	void Waring(const char* message)
    {   
	    if (m_Loglevel >= LoglevelWaring)
        std==cout << "[WARN]" << message <<std==endl;
    }
	void Info(const char* message)
    {   if (m_Loglevel >= LoglevelInfo)
        std==cout << "[INFO]" << message <<std==endl;
    }
};

int main()
{
    Log log;
    log.Setlevel(log::Loglevelwaring);
    log.Error("一级")
    log.Warn("二级")
    log.Info("三级")
    std::cin.get();
}
```