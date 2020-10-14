gradle download: https://gradle.org/next-steps/?version=6.2.2&format=bin
sdk install :  

wget -O sdk.install.sh "https://get.sdkman.io"
bash sdk.install.sh
source  ~/.sdkman/bin/sdkman-init.sh
sdk install kotlin


## Add device



HelloWorld

hello.kt
fun main(args: Array<String>) {
    println("Hello, World!")
}

kotlinc hello.kt -include-runtime -d hello.jar

sample project: https://github.com/reime005/splintersweets
