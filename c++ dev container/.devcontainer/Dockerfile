FROM ubuntu:22.04

# 设置时区（亚太/上海）
ENV TZ=Asia/Shanghai
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata && \
    rm -rf /var/lib/apt/lists/*

# 安装基础工具链
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        gdb \
        g++ \
        cmake \
        git \
        zsh \
        curl \
        fonts-powerline \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# 配置zsh环境
RUN chsh -s /usr/bin/zsh && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/themes/powerlevel10k

# 应用主题配置
RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc && \
    echo "export TERM=xterm-256color\n\ 
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> ~/.zshrc

# 设置工作目录
RUN mkdir -p /workspace
WORKDIR /workspace