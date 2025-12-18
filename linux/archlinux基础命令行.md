

### 系统更新
```zsh
sudo pacman -Syu
```

### 连接网络

```zsh
ip likh
ip link
ip link set ens33 up
dhcpcd
```

## 文件管理器
[[ranger]]



### 任务管理
## **快捷键操作总结**

| 快捷键/命令    | 作用         | 示例        |
| --------- | ---------- | --------- |
| `Ctrl+Z`  | 暂停当前前台作业   | 在运行任何命令时按 |
| `fg %n`   | 打开第n个作业    | `fg %2`   |
| `fg %str` | 打开包含str的作业 | `fg %vim` |
| `fg`      | 打开最近停止的作业  |           |
| `fg -`    | 打开倒数第二个作业  |           |
| `jobs -l` | 显示作业详情和PID |           |
| `kill %n` | 终止第n个作业    | `kill %3` |
