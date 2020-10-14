- Download go
  ~~~
  wget https://golang.org/dl/go1.15.linux-amd64.tar.gz
  ~~~

- Visual Studio 
  - Go plugins updates
    ~~~
    Ctrl + Shift + P

    # Type
    Go:Install/Update
    ~~~
  - Live commands
    ~~~
    ff   ==> fmt.Printf
    fp   ==> fmt.Println
    fm   ==> func main
    ~~~

- Config go envrionment variables in .bashrc
  ~~~
  export GOROOT=${LANG_PATH}/go
  export GOBIN=${GOROOT}/bin
  export GOPATH=/home/jooho/dev/lang/go
  ~~~


- go module을 이용하면 더이상 GOPATH를 workspace로 지정할필요가 없다
  - GOPATH는 package들을 저장하는 로컬 디렉토리가 된다.
  - `go mod vendor`는 GOPATH에 저장된 package들을 해당 workspace로 복사해오는 기능이다. 따라서 GOPATH에 package가 없어도 상관없음
    - workspace 안의 vendor폴더를 사용하려면 `go build -mod vendor ./main.go`처럼 -mod를 지정해줘야함.
  - private repo도 사용가능하나 지금 필요없음.


- Comment
  - Exported method는 반드시 달아라. 형식은 "Method returns"

- Type Assertion
  - type이 맞는 지 확인하는 것 
  - ok부분을 따로 빼내지 않으면 panic이 된다.
    [playground](https://tour.golang.org/methods/15)

- Go build
  - 만약 이름을 안주면 폴더이름으로 생성
    ```
    go build 
    
    ```
  - 만약 파일을 지정해주면 파일이름으로 생성
    ```
    go build main.go
    main
    ```
  - 만약 module path를 지정해주면 module 이름으로 생성
    ```
    go build github.com/pluralsight/webservice
    webservice
    ```

- Go run  
  ~~~
  go run .

  go run main.go

  go run github.com/pluralsight/webservice
  ~~~


- Constants vs Var 의 차이
  - 변할수 없다 vs 변할수 있다.

- iota reset every const scope
  ~~~
  const ( 
      first = iota
      second = iota
  )
  const (
      third = iota
      forth 
  )
  fmt.Println(first,second,third,forth)   // 0 1 0 1
  ~~~

- Array vs Slices
  - fixed vs not fixed
  - slice의 아래는 array로 되어 있고, 그 array는 Go가 관리해줌.
  - Slice is kind of pointer, so if original data is chagned then the slice also changed.
    ~~~
    	arr := [3]int{1,2,3}
    	slice := arr[:]
      arr[0] = 21
      slice[2]= 12
    	fmt.Println(arr, slice)   //[21,2,12] [21,2,12]
    ~~~

- Structs 타입에서 왜 마지막에 ,를 넣는 이유
  - go compiler는 자동적으로 라인의 맨 마지막에 ;을 넣어준다. 
  - ex2의 "Lee"는 마치 라인의 제일 마지막인거 처럼 보여서 `";"` 넣어주게 되지만 사실 그렇지 않기 때문에 에러
  - 따라서 여기가 마지막이 아니다 라는 의미로 ex3 처럼 "Lee" 옆에 `,`또는 `}` 을 넣어줄수 있는데, `}`는 더 헷갈리게 되므로 ,를 넣어준다.
  ~~~
    // ex1) 기본
  	u2 := user{ ID: 2,
            FirstName: "Simon",
            LastName: "Lee"}
	  fmt.Println(u2) //{2 Simon Lee}

    // ex2) error
    u2 = user{ ID: 2,
            FirstName: "Simon",
            LastName: "Lee"
            }

    // ex3) OK
    u2 = user{ ID: 2,
            FirstName: "Simon",
            LastName: "Lee",
            }
  ~~~
- `users []*User`에서 User 대신 *User 를 쓰는 이유는?
  - 포인터를 쓰는 이유는 User object 그 어떤 정보를 복사하지 않고, 공유도 하지 않기 때문에 더 안전 그리고 더 효율적이기 때문.
    ~~~
    package models

    type User struct {
      ID        int
      FirstName string
      LastName  string
    }

    var (
      users []*User  //<===
    )
    ~~~

- package level에서 var를 initialize할때는 굳이 `:=`을 쓸필요 없다. `=`만으로도 가능
  ~~~
  package models

  var (
    
    nextID = 1 //<==
  )
  ~~~

- Atoi
  - reg-expression 으로 뽑은 데이터를 go에서 사용할수 있게 해주는 lib
    ~~~
    matches := us.userIDPattern.FindStringSubmatch(r.URL.path)
    id, err != strconv.Atoi(matches[1])
    ~~~



- func parameters
  - variadic parameters
  ~~~
  func main(){
    numbers := []float64{12.4,2,14,16,22.4}
    total :=sum(numbers...)
    // total := sum(12.4,2,14,16,22.4)

    fmt.Printf("total of sum : %f\n", total)
  }

  func sum(values ...float64) float64 {
    total := 0.0
    for _,value := range values{
      total +=value
    }
    return total
  }
  ~~~
  - 

- Json Marshal 할때 structs 의 low case variable json으로 안 만들어짐.


## Refernece
- [Dependencies Management](https://velog.io/@kimmachinegun/Go-Go-Modules-%EC%82%B4%ED%8E%B4%EB%B3%B4%EA%B8%B0-7cjn4soifk)

- [Go module vendor](https://blog.naver.com/alice_k106/221618543021)

- [Directory Standards](https://github.com/golang-standards/project-layout)

- [Package Name Importance](https://byounghoonkim.github.io/posts/golang-package-names/)

- [리시버란](https://kamang-it.tistory.com/entry/Go15%EB%A9%94%EC%86%8C%EB%93%9CMethod%EC%99%80-%EB%A6%AC%EC%8B%9C%EB%B2%84Receiver)



Commands
~~~
# 소스 정렬 후 저장
gofmt -w src/main.go 
~~~


