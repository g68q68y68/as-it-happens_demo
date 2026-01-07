#!/bin/bash
# AsItHappens 启动脚本

# 获取脚本所在目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 切换到项目根目录
cd "$SCRIPT_DIR"

# 检查 JAR 文件是否存在
if [ ! -f "target/asithappens-1.0.jar" ]; then
    echo "错误: 找不到 target/asithappens-1.0.jar"
    echo "请先运行: mvn package"
    exit 1
fi

# 检查依赖库目录是否存在
if [ ! -d "target/lib" ]; then
    echo "错误: 找不到 target/lib 目录"
    echo "请先运行: mvn package"
    exit 1
fi

# 运行应用程序
# 需要在 target 目录下运行，因为 classpath 配置为 lib/，config 目录也在 target 下
cd target
java -jar asithappens-1.0.jar

