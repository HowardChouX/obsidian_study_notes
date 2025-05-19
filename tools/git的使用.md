## 常用命令行简介
- 先在githup网页创建一个仓库，切换到ssh
- 本地终端导航到要初始化为仓库的文件的根目录
```bash
# 本地初始化仓库
git init

# 生成 .gitignore文件，vim编辑
touch .gitignore

# add
git add <file>

# commit
git commit -m"<message>"

# 关联githup
git remote add origin <ssh>

# 查看当前关联的远程仓库地址
git remote -v

# 强制指定分支
git branch -M master #似乎默认就是master

# 推送
git push -u origin master


```

## 命令行详细使用指南
### ssh密钥创建
- 本地终端生成SSH
```bash
#生成 SSH 密钥
ssh-keygen -t ed25519 -C "p204654297@outlook.com"

#查看 保存到本地的 SSH密钥
cat ~/.ssh/id_ed25519.pub

#验证 GitHub ssh连接状态
ssh -T git@github.com

```

- GitHub 网页 New SSH key
	- seeting-> SSH and GPG key -> New SSH key
		- title 随便
		- key type 保持不变
		- 粘贴保存到本地的 SSH密钥到 key


### git status
导航到目标文件所在`上级目录`
要推送您的代码，我们将使用以下三个命令：`add` 、`commit`和`push` 。
- 打开终端窗口并导航到包含 `sp21-s***` 存储库的文件夹， **而不是** `snaps-sp21-s***` 存储库。如果键入 “ls” 命令，您应该会看到 lab1 文件夹位于该位置
- 输入以下命令以确认您位于正确的目录中。


    ```shell
     $ git status
    ```
    - 如果一切正常，您应该会看到类似如下内容：
    ```shell
     On branch master
     Changes not staged for commit:
       (use "git add <file>..." to update what will be committed)
       (use "git restore <file>..." to discard changes in working directory)
         modified:   lab1/Collatz.java
    ```

    - Git 告诉你的是，你更改了 lab1/Collatz.java 文件夹的某些内容，而 GitHub 尚未记录。 **确保它显示 lab1/Collatz.java，而不仅仅是 Collatz.java**。如果它显示 just Collatz.java，你应该使用 `cd..` 来向上移动一个目录。
    
---
### ` git add`
```shell
$ git add lab1/*
```
- 输入以下命令以确认 add 工作正常
```shell
 $ git status
 ```


-  如果一切正常，您应该会看到类似如下内容：
```shell
On branch master
     Changes to be committed:
       (use "git restore --staged <file>..." to unstage)
             modified:   lab1/Collatz.java
```

### `git commit -m" "`
- 现在 Git 告诉你，它正在确认你想要记录你对 Collatz.java 所做的更改。
```shell
 $ git commit -m "done with Collatz"
    ```

>执行此作时，Git 将记录您对 Collatz.java 所做的更改。它还将记录消息 “done with Collatz” 以及录音。如果您想查找过去某个时间点的特定更改，这些消息可能会有所帮助。我们将在后面的实验中进一步讨论。它还将打印一些终端输出，您将看到如下所示的内容，尽管插入和删除的数量可能不同。

```bash
[master e2c138b] done with Collatz
     1 file changed, 15 insertions(+), 1 deletion(-)
```

- 和以前一样，输入 git status 命令。
```bash
$ git status
```

- If commit worked correctly, you should see something like:  
    如果 commit 工作正常，你应该看到类似这样的内容：
```bash
 On branch master
     nothing to commit, working tree clean
```

-   “working tree” is “clean””这一事实意味着您的所有工作都已备份。

### push origin master
- 在 GitHub.com 上刷新存储库的 URL。您将看到您的更改仍然没有显示。这是因为我们还有最后一步。
```bash
$ git push origin master
```
- 现在在 GitHub.com 上刷新存储库的 URL。您应该会看到您对 Collatz.java 的更改以及您输入的消息现在可见。


```bash
git add lab1/* //添加lab文件中所有文件
git commit -m "提示信息"
git push origin master
```


### git log

>查看所有的版本
```shell
git log
```

![[Pasted image 20250515153216.png]]
- 当前有两个版本 最后的版本`version2`为`master`.

- commit 后面是版本id


### git checkout \<version\>

```shell
git checkout 0993c92f631ddb183fbf0e670b10a01adf124f46#version1

git checkout master # 当前版本
```

### traced back
>版本恢复

```shell
# 1. 查看提交历史获取目标commit hash
git log

# 示例输出：
# abc1234 (HEAD -> main) 最新提交
# def5678 旧版本提交
# ghi9012 初始提交

# 2. 将工作区恢复至目标版本（保留后续提交历史）
git checkout def5678 -- .  # 注意最后的点表示所有文件

# 3. 提交恢复操作（生成新版本记录）
git commit -m "恢复至def5678版本"
```



