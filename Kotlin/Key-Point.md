# Kotlin Key Points

- REPL(Read-eval-print loop)
  - 코드를 한줄씩 실행할수 있는 기능
    ~~~
    Tools → Kotlin → Kotlin REPL
    ~~~
- Scratch file (간단하게 테스트 하기 좋은 파일)
  - Project view를 할때 파일이 보임
    ~~~
    Ctrl + Alt + Shift + insert
    Ctrl + Shift + w  ⇒ 실행하기
    ~~~

- 변수
  - var 가변
  - val final
  - Unit ⇒ void
  - fun ⇒ function
    - fun 함수명(인수1: 자료형1) : 반환 자료형
  - 큰 따옴표 3개(""") ⇒ 여러줄에 걸쳐 문자열을 표현할때 사용

  - 배열
  ~~~
  val numbers: Array<Int> = arrayOf(1,2,3,4,5)
  val numbers2 = arrayOf(1,2,3,4,5)
  ~~~

  - when ⇒ switch 문
  ~~~
  val x = 8
  
  when(x) {
     1 -> println("x==1")
     2,3 -> println("x==2 or x==3")
     in 4..7 -> println("4~7")
     !in 8..10 -> println("No 8~10")
     else -> {
         println("나머지")
     }
  }
  ~~~
    - return도 가능
    ~~~
    val numStr = when(x%1){
    0 -> "짝수"
    else -> "홀수"
    }
   
    println(numStr)
  
    -------------------------------------------------
   
    fun numStr(num: Int) = when(num % 2){
       0 -> "짝수"
       else -> "홀수"
    }
    
    println(numStr(x))
    ~~~

  - For 문
  ~~~
  for( i in 1..2)
  for( i in 0..10 step 2)
  for(i in 10 downTo 0 step 2)
  ~~~


  - 생성자
  ~~~
  class Person(var name: String){}
  class Person{
  	constructor(name: String){}
  }
    
  init
  class Person(var name: String){
  init {
     println(name)
  }
  }
  ~~~

  - 인터페이스에 구현된 메서드 포함가능

  - lateinit 늦은 초기화 
    - var변수
    - null값으로 초기화 불가능
    - 초기화 전에는 변수 사용 불가
    - Int,Long,Double,Float에 사용불가

  - lazy 늦은 초기화
    - val 변

  - null 값이 아님을 보증(!!)

  - mutableListOf ⇒ list 종류중 하나 
  - listOf ⇒ 변경불가능 immutable




- 벡터 드로어블 사용환경만들기(sdk 19)
  안드로이드 5.0부터 사용가능한 기능임.
  ~~~
  defaultConfig{
        vectorDraqables.useSupportLibrary = true
  }
  ~~~


- 파일저장방법
  - [Asset](https://codechacha.com/ko/how-to-use-assets-in-android/)
  - internal
  - [external](https://yeolco.tistory.com/32)


- Google Map
  - [Doc](https://developers.google.com/maps/documentation/android-sdk/start)
  - [Google Cloud Platform Console](https://console.cloud.google.com/getting-started)
  - Project 만들기
  - [Credential 만들기](https://console.cloud.google.com/apis/credentials?folder=&organizationId=&project=android1-272101)
  - [Map API enable시키기](https://developers.google.com/maps/gmp-get-started#enable-api-sdk)


## Log
- Logback 사용하기
  - [왜?](https://www.bubblecat.co.kr/2019/05/logback.html)
  - 중요한 건 slf4j다 왜냐하면 이것이 같으면 어느 플랫폼에서도 사용하는 방식이 같아지기 때문이다.
  - 안드로이드에서 logback을 사용하기 위한 라이브러리

  - 설정
    - Gradle
     ~~~
     implementation ("ch.qos.logback:logback-core:1.2.3")
     implementation ("org.slf4j:slf4j-api:1.7.30")
     ~~~
  
    - logback.xml(app/src/main/assets/logback.xml)
     ~~~ 
     <configuration>
       <appender name="logcat" class="ch.qos.logback.classic.android.LogcatAppender">
         <tagEncoder>
           <pattern>%logger{12}</pattern>
         </tagEncoder>
         <encoder>
           <pattern>[%-20thread] %msg</pattern>
         </encoder>
       </appender>
     
       <root level="DEBUG">
         <appender-ref ref="logcat" />
       </root>
     </configuration>
     ~~~




## DB
- [Android 에서 sqllite 사용하기](https://medium.com/@eevee300/android-sqlite-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0-94d17f06123d)
- [2개 테이블 join방법](https://medium.com/harrythegreat/%EB%B2%88%EC%97%AD-%EC%95%88%EB%93%9C%EB%A1%9C%EC%9D%B4%EB%93%9C-room-7%EA%B0%80%EC%A7%80-%EC%9C%A0%EC%9A%A9%ED%95%9C-%ED%8C%81-18252a941e27)
- main thread에서 DB관련되서 돌리면 안됨
  - [이제는 코루틴을 이용하면 됨.](https://tourspace.tistory.com/272)
  - [코루틴을 호출하는 방식](https://kotlinlang.org/docs/reference/coroutines-overview.html)
  - [코루틴 설명](https://medium.com/til-kotlin-ko/kotlin%EC%9D%98-coroutine%EC%9D%80-%EC%96%B4%EB%96%BB%EA%B2%8C-%EB%8F%99%EC%9E%91%ED%95%98%EB%8A%94%EA%B0%80-789291da6a50)

- emulator 포트 리다이렉션 db 내용 확인하기
  - https://developer.android.com/studio/run/emulator-networking.html
  - https://developer.android.com/studio/run/emulator-console
  ~~~
  cat ~/.emulator_console_auth_token
  localhost 5554

  auth 1OZXCwqoWNJe8Jq+

  redir add tcp:8080:8080
  ~~~

- Auto increasement사용할 경우
  - Reset 방법(sqlExecutor.resetPointer())
  ~~~
  var id = AtomicInteger()
  id.getAndIncrement()
  @PrimaryKey(autoGenerate = true) var id: Int,
  ~~~

- @Relation은 pojo class에만 쓸수 있다.
  - Entity class에는 사용할수 없다.
  - Entity class를 구분짓는것은 @Entity가 아니라, DB에 등록되어 있는 Entity리스트이다.




## Refernece

- [UI 공부](https://material.io/design/layout/spacing-methods.html#touch-targets)
- [Singleton pattern](https://stackoverflow.com/questions/40398072/singleton-with-parameter-in-kotlin)
- [Factory pattern](https://medium.com/@dbottillo/patterns-in-kotlin-abstract-factory-a0ff99a0d177)
- Android 공부
  - https://unikys.tistory.com/276
  - https://recipes4dev.tistory.com/67?category=660156


## Troubleshoot
- 1. AndroidManifest.xml 파일의 <application> 부분에 android:usesCleartextTraffic="true" 로 설정
  ~~~
  cleartext HTTP와 같은 cleartext 네트워크 트래픽을 사용할지 여부를 나타내는 flag로 이 플래그가 flase 로 되어 있으면, 플랫폼 구성 요소 (예 : HTTP 및 FTP 스택, DownloadManager, MediaPlayer)는 일반 텍스트 트래픽 사용에 대한 앱의 요청을 거부하게 됩니다.
  이 flag를 설정하게 되면 모든 cleartext 트래픽은 허용처리가 됩니다.
  ~~~

