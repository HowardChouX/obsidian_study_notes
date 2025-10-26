### **一、基本文件操作**

| 命令      | 作用                | 示例                       |
| ------- | ----------------- | ------------------------ |
| `ls`    | 列出当前目录内容          | `ls -l`（详细列表）            |
| `cd`    | 切换目录              | `cd ~/Documents`（进入文档目录） |
| `pwd`   | 显示当前所在目录的绝对路径     | `pwd`                    |
| `cp`    | 复制文件或目录           | `cp file.txt backup/`    |
| `mv`    | 移动/重命名文件或目录       | `mv old.txt new.txt`     |
| `rm`    | 删除文件              | `rm file.txt`            |
| `rm -r` | ​**递归删除目录**​（慎用！） | `rm -r folder/`          |
| `mkdir` | 创建新目录             | `mkdir project`          |
| `touch` | 创建空文件或更新文件时间戳     | `touch newfile.txt`      |
|         |                   |                          |

---

### ​**二、文件权限管理**

| 命令      | 作用              | 示例                          |
| ------- | --------------- | --------------------------- |
| `chmod` | 修改文件权限          | `chmod 755 script.sh`       |
| `chown` | 修改文件所有者         | `chown user:group file.txt` |
| `sudo`  | 以管理员权限执行命令（需谨慎） | `sudo apt update`           |

---

### ​**三、文件内容查看与编辑**

| 命令              | 作用                | 示例                      |
| --------------- | ----------------- | ----------------------- |
| `cat`           | 显示文件全部内容          | `cat log.txt`           |
| `more` / `less` | 分页查看文件内容（支持翻页）    | `less large_file.log`   |
| `head`          | 显示文件前N行           | `head -n 10 file.txt`   |
| `tail`          | 显示文件末尾N行（常用于日志监控） | `tail -f app.log`（实时追踪） |
| `nano` / `vim`  | 文本编辑器             | `vim config.conf`       |

---

### ​**四、文件搜索与查找**

| 命令       | 作用              | 示例                     |
| -------- | --------------- | ---------------------- |
| `find`   | 按条件搜索文件         | `find / -name "*.cpp"` |
| `grep`   | 在文件中搜索文本        | `grep "error" log.txt` |
| `locate` | 快速搜索文件（需先更新数据库） | `locate filename`      |

---

### ​**五、压缩与解压**

|命令|作用|示例|
|---|---|---|
|`tar`|打包/解压 `.tar` 文件|`tar -xvf archive.tar`|
|`gzip` / `gunzip`|压缩/解压 `.gz` 文件|`gzip file.txt`|
|`zip` / `unzip`|处理 `.zip` 文件|`unzip archive.zip -d dest/`|

---

### ​**六、磁盘与空间管理**

|命令|作用|示例|
|---|---|---|
|`df`|查看磁盘剩余空间|`df -h`（易读格式）|
|`du`|查看目录/文件占用空间|`du -sh ~/Downloads`|

---

### ​**七、符号链接**

|命令|作用|示例|
|---|---|---|
|`ln -s`|创建软链接（快捷方式）|`ln -s /path/to/file link`|

---

### ​**常用场景示例**

1. ​**批量删除`.log`文件**
    
    bash
    
    ```bash
    find . -name "*.log" -exec rm {} \;
    ```
    
2. ​**统计代码行数**
    
    bash
    
    ```bash
    find src/ -name "*.cpp" | xargs wc -l
    ```
    
3. ​**实时监控日志**
    
    bash
    
    ```bash
    tail -f /var/log/syslog
    ```


- oh my zsh /home/zsh/.zshrc.

- zsh   /usr/bin/zsh

