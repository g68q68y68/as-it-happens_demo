@echo off
REM AsItHappens 启动脚本 (Windows)

REM 切换到脚本所在目录
cd /d "%~dp0"

REM 检查 JAR 文件是否存在
if not exist "target\asithappens-1.0.jar" (
    echo 错误: 找不到 target\asithappens-1.0.jar
    echo 请先运行: mvn package
    pause
    exit /b 1
)

REM 检查依赖库目录是否存在
if not exist "target\lib" (
    echo 错误: 找不到 target\lib 目录
    echo 请先运行: mvn package
    pause
    exit /b 1
)

REM 运行应用程序
REM 需要在 target 目录下运行，因为 classpath 配置为 lib/
cd target
java -jar asithappens-1.0.jar

