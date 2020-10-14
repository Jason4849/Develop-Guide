CSS

* Div 태그가 영역을 차지하지 않는다.

* 알아두면 좋은 조건들
    -  Position 속성에 absolute 키워드를 적용하면 부모태그가 영역을 차지하지 않는다.
        - 자손의 position 속성에 absolute 키워드 있을 경우
            - 부모에 height 속성을 사용
            - 부모에 position 속성에 relative를 선정
            - 부모에 overflow 속성에 hidden/scroll 설정

        - 자손에 float속성을 적용하면 부모의 overflow 속성에 hidden 키워드를 적용.
    
**border-size**
- content-box
  ```
  박스 너비/넓이 = width속성 + 2x(margin 속성 + border 속성 + padding 속성)
  ```
  - border-box보다 크다
- border-box
  ```
  박스 너비/넓이 = width속성 + 2x(margin 속성)
  ```
  - content-box보다 작다

**동위 선택자**
- "+"
  - 선택자A + 선택자B 
    - 선택자A **바로 뒤에** 위치하는 선택자B를 선택한다.
- "~"
  - 선택자A ~ 선택자B 
    - 선택자A 뒤에 위치하는 선택자B
      - 선택자A 뒤에 위치하는 선택자B를 선택한다.

**상태 선택자**
- :checked
- :focus
- :enabled
- :disabled
  
(EX)
```
// input 태그의 type 속성값이 checkbox인 태그가 체크되었을때 바로 뒤에 위치하는 div태그의 height 속성에 0픽셀을 적용합니다.
input[type=checkbox]:checked + div{
    height: 0px;
}
```

**data속성**
data- 를 붙이면 사용자 지정속성으로 인정!

**inline 요소를 block으로 만들려면**
- 아래의 내용을 추가해야 원하는 모습이루어진다.
   ```
    width: 100px; height: 30px;
    display: block;
    ```
**inline**
- No Box
- 크기 지정 불가
- 라인이 내려가지 않음

**Block**
- Box라고 생각하면 됨
- 크기 지정 가능
- 라인 내려감

**inline-block**
- Box가 있음
- 크기 지정 가능
- 라인이 내려가지 않음

**Visibility**
- hidden ==> 엘리먼트자리는 그대로 나두고 안보이게 만듬
- collapse ==> table태그가 차지한느 영역이 아에 없어짐

**Display**
- none ==> 엘리먼트 자리를 아예 없애버림.

**background-size**
- cover ==> 높이가 100%
- contain ==> 너비가 100%

**inline-height**
- 수직 중앙을 만들기위해 사용함.
- height와 동일하게 주면 Text를 수직중앙에 맞춰줌



**글자생략할때 3총사**
```
white-space: nowrap;
overflow: hidden;
text-overflow: ellipsis;
```


## 모바일 웹

**주위사항**
- overflow 속성을 사용해 스크롤을 넣을 수 없다
- 상태 선택자 사용주의 
  - 스마트폰에 hover와 active 가 없다고 생각하자.
- 동위 선택자 제한
  - ~ 선택자는 보통 지원하지 않는다.
- 예전 안드로이드 버젼에선 CSS3 그라디언트를 적용안됨.

**Viewport**



| 속성                | 예시                           | 설명        |
| ----------------- | ---------------------------- | --------- |
| width             | width=device-width           | 화면너비      |
| height            | height=device-width          | 화면높이      |
| initial-scale     | initial-scale=2.0            | 초기확대비율    |
| user-scalable     | user-scalable=no             | 확대축소 가능여부 |
| minimum-scale     | minimum-scale=1.0            | 최소 축소 비율  |
| maximum-scale     | maximum-scale=2.0            | 최대 축소 비율  |
| target-densitydpi | target-densitydpi=medium-dpi | DPI 지정    |


```
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
```

**text-indent**
- 글자를 이동하는 element
- -9999 글자를 아예 화면을 밖으로 보내버림
  
**전체화면에 무언가를 적용하기 위한 방법**
```
<style>
    *{ margin: 0; padding: 0; }
    html,body {              //<== 이부분중요.
        height: 100%;
    }
    #background {
        height: 100%;
        background: red;
    }
</style>
```

## 3D

**transition-property**
- 만약 background-color와 width의 시간을 다르게 주고 싶을때
  ```
    transition-property: background-color,width;
    transition-duration: 1s, 5s;
  ```
**trasition**
```
//property duration funciton delay 순서로 입력
transition: background-color 1s ease, width 5s linear 1s;
```

**transition-timing-function속성**
- linear
- ease
- ease-in
- ease-in-out
- ease-out

**cubic-bezier()**
```
transition-timing-fucntion: cubic-bezier(0,1,1,1);
```



**transform**
- 순서에 따라 결과물이 달라짐
  ```
  transform: rotate(60deg) translateX(50px);
  transform: translateX(50px) rotate(60deg);
  ```

**transform-origin**
- transform을 할때 변환의 중심을 정해준다.
```
transform-origin: right bottom;  //오른쪽 아래 기준으로 변화됨(꼭지점이 된다.)
```

**backface-visibility**
- 3 차원 공간에서 평면의 후면을 보이거나 보이지 않게 만드는 스타일 속성  

**원근법**
- perspective

---
### Practical Tips
- a 는 인라인 요소- 그림을 넣을때 display와 width/height 넣어야한다. 

- ul 여러개를 넣을때 발생하는 Top의 불일치이슈 해결책:
  - ul를 inline요소로 만들고 
  - vertical-align을 이용하여 inline 요소의 수직 요소를 top에 붙인다. 
    ```
    #main_gnb > ul > li > ul{
        display:inline-block;
        vertical-align:top;
    }
    ```
    
- 배경을 먼저 자리 잡고 시작한다.
- position absolute는 바로 상위 element기준이고, padding margin을 ignore한다.
- position absolute를 하게 되면, 가로사이즈가 초기화된다.
  - width를 100%로 줘야한다.
- 가로(width)/ 세로(height) 있으면 overflow를 줄수 있다.

---

### 01 - [이미지가 이동하면서 글씨가 보이는 Animation](move_image_show_text/index.html)

**Demo**
- [Original demo](https://css-tricks.com/slide-an-image-to-reveal-text-with-css-animations/)

**Summary**
[CSS 7가지 단위](https://webclub.tistory.com/356)
- rem (root em)
  - 최상위의 em을 기준으로 세팅됨.
  - em을 이용하면, Div에 1.2em을 주게 되면 div.div는 (14px1.2x1.2)가 됨
  - rem을 이용하면, Div에 1.2em을 주게 되면 div.div는 (14px1.2)가 됨
  - **GRID** 시스템에 유용함.

- vh & vw (vertical height & vertical width)
  - 예를 들어 브라우저 높이값이 900px일때 1vh는 9px이라는 뜻이 되지요. 그와 유사하게 뷰포트의 너비값이 750px이면 1vw는 7.5px이 됩니다. 


[Filter](https://developer.mozilla.org/ko/docs/Web/CSS/filter)
- 그림자주기 drop-shadow(가로 세로 번지기크기 색)
  ```
  filter: drop-shadow(-14px 5px 15px rgba(0,0,0,0.6)
  ```
- 예제
  ```
  /* <filter-function> 값 */
  filter: blur(5px);
  filter: brightness(0.4);
  filter: contrast(200%);
  filter: drop-shadow(16px 16px 20px blue);
  filter: grayscale(50%);
  filter: hue-rotate(90deg);
  filter: invert(75%);
  filter: opacity(25%);
  filter: saturate(30%);
  filter: sepia(60%);
  
  /* 다중 값 */
  filter: contrast(175%) brightness(3%);
  
  ```

[Keyframes](https://developer.mozilla.org/ko/docs/Web/CSS/@keyframes)
- @규칙은 개발자가 애니메이션 중간중간의 특정 지점들을 거칠 수 있는 키프레임들을 설정함으로써 CSS 애니메이션 과정의 중간 절차를 제어할 수 있게 합니다. 이 룰은 브라우저가 자동으로 애니메이션을 처리하는 것 보다 더 세밀하게 중간 동작들을 제어할 수 있습니다.
  ```
  @keyframes slidein {
    from {
      margin-left: 100%;
      width: 300%;
    }
  
    to {
      margin-left: 0%;
      width: 100%;
    }
  }
  
  or

  @keyframes identifier {
    0% { top: 0; left: 0; }
    30% { top: 50px; }
    68%, 72% { left: 50px; }
    100% { top: 100px; left: 100%; }
  }
  ```

---
### [02 - 여러가지 슬라이드 방법](./slides/README.md)

**Demo**
- [Original Demo](https://css-tricks.com/can-get-pretty-far-making-slider-just-html-css/)
- [Original Copy Demo](./2-new-basic.html)
- [My Demo](./2-new-basic-test.html)


**Summary**
[Diplay(Flex)](https://heropy.blog/2018/11/24/css-flexible-box/) - 수평으로 줄간격을 줄때 사용하면 매우 유용한 display방식
  - justify-content: space-around 를 이용하면 메뉴에 사용하기 좋음

[슬라이드 아이템에 맞게 이동하는 방법(scroll-snap-type)](https://css-tricks.com/almanac/properties/s/scroll-snap-type/)
```
.slides {
    scroll-snap-type: x mandatory;
}

.slides > div {
    scroll-snap-align: start;
}
```
[아이템을 로테이트할때 기준이 되는 곳을 지정하기(transform-origin)](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-origin)
```
transform-origin: -100% 50%; //  transform-origin: center center;
transform: rotate(45deg);
```

[transition vs trasnform](https://css-tricks.com/almanac/properties/t/transition/) 
- transition은 변환/ transform은 변형
- [transition은 각 아이템별로 시간을 다르게 줄수 있다.](https://developer.mozilla.org/ko/docs/Web/CSS/CSS_Transitions/Using_CSS_transitions)
```
transition:width 2s, height 2s, background-color 2s, transform 2s;
```

[현재 보이는 div 찾아내기](https://developer.mozilla.org/en-US/docs/Web/CSS/:target)
```
.slides > div:target {
  transform: scale(0.8);
}
```

---



## Referecne
### 초기화 작업

**Extension**
- HTML CSS support
- Live Server
- open in Browser
- Bracket Pair Colorizer 2
- Highlight Matching Tag
- Live Share (코딩 쉐어)
- Auto Rename Tag
- HTML5 Boilerplate

**Chrome extension**
- full image screen capture
- [image downloader](https://www.youtube.com/watch?v=K0EvB8zk6mE&list=PL_6yF2upGJYsFBBZMhUlZZ0VyBLor5JwL&index=18&t=0s)


**initial Steps(매번하는 일)**
```
* create index.html

$ html:boil-plate

* create init.css / title.js
* add css3 init file
* add javascript(title.js) file
```


### Links
- [Book Source Download](http://download.hanbit.co.kr/exam/2161/)
- [CSS 초기화 설명](http://html5doctor.com/html-5-reset-stylesheet/)
- [CSS Flexible Box 설명](https://heropy.blog/2018/11/24/css-flexible-box/)
- [Sprites 이미지 만들기](https://www.toptal.com/developers/css/sprite-generator)
- [Emmet 사용법](https://webclub.tistory.com/161)
  - [Cheat Sheet](https://docs.emmet.io/cheat-sheet/)
- [Icon image](https://fontawesome.com/how-to-use/on-the-web/styling/sizing-icons)
- [PlaceHold Image](placehold.it)
  - 이미지 크기는 정해져있는데 실제 이미지가 아직 없다면 Placehold를 이용한다.
  - http://placehold.it/300x200
- [Video.js](https://videojs.com)
  - 비디오를 삽입할때 모든 브라우져에서 똑같은 모습으로 제공할때 유용하다
  - [자세한 옵션](https://videojs.com/advanced?video=disneys-oceans)

- [CSS3 Generator](http://css3generator.com/)
  - 복잡한 CSS3를 쉽게 만들수 있는 사이트

- [Vender prefix free](https://leaverou.github.io/prefixfree/)
  - 벤더별로 따로 지정해줘야하는 것들 쉽게 해결해주는 JS
  - 적용하는 방법(순서가 중요함)
      ```
      <!DOCTYPE html>
      <html>
      <head>
          <title>CSS3 Style Property Basic</title>
          <link rel="stylesheet" href="StyleSheet.css" />
          <script src="prefixfree.min.js"></script>
      </head>
      <html>
     ```
  
- [CSS Gradient](https://www.colorzilla.com/gradient-editor/)
  - CSS3로 그라디이언트를 만들때 사용하기 좋음.

- 뷰포트
  - [android](https://developer.android.com/guide/webapps/targeting.html)
  - [iphone](https://developer.apple.com/safari/resources/#documentation/appleapplications/reference/safarihtmlref/Articles/MetaTags.html)

- [CSS Sprites Generator](https://www.toptal.com/developers/css/sprite-generator)
- [어도비 컬러 CC](https://color.adobe.com/create)
- [베지어 곡선생성공식](https://cubic-bezier.com)

- 반응형 테스트 페이지
  - [solo](https://sizzy.co/#pricing)

- tutorial
  - [animation tutorial](https://www.smashingmagazine.com/2012/04/pure-css3-cycling-slideshow/)
  - [CSS Trick](https://css-tricks.com)



### 용어 설명
- Emmet => html을 만들때 쉽게 해는 플러그인
