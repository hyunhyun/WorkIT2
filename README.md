# WORK IT!
-------

### 소개
***
<pre>
team들이 주제별로 업무 관련 글을 작성하고 담당자를 지정하여
업무 진행상황 및 업무 분할을 효율적으로 할 수 있게 도와주는 웹사이트입니다.
</pre>

***

데모페이지 : [demo](http://10.106.150.32:8080/ProjectManager2/auth/login)

<pre>
  ID : test
  PW : pw
</pre>
***
1.개발 내용 : [feature list](https://oss.navercorp.com/2018-nbp-internship-team1/jeonghyun.yi/wiki/featurelist&milestone)  

2.프로토타입 : [prototype](https://www.fluidui.com/editor/live/project/p_5gU7gCtkbfdNQPd5rsu1fqei5xvrXP1e)  

3.api 설계: [api 설계](https://oss.navercorp.com/2018-nbp-internship-team1/jeonghyun.yi/wiki/API-%EC%84%A4%EA%B3%84)

4.db 스키마 설계 : [db 스키마](https://oss.navercorp.com/2018-nbp-internship-team1/jeonghyun.yi/wiki/DB)



### 개발환경  
***

* 서버 : CentOS 7.4, apache-tomcat-8.5.23, jdk 8

* Back-End : Spring

* Front-End : HTML, CSS, Jquery, javascript, BootStrap 4

* DB : Mysql 5.1.50

* IDE : STS


***

### 기본기능
***
1. 로그인 / 로그아웃 / 회원가입 / 회원탈퇴
  - 비밀번호 해시
2. 글 CRUD
  - 내용으로 검색
3. 글에 대한 댓글
  - 댓글 작성자만 수정/ 삭제 가능


### 추가기능
***
1. team CRUD
2. team별로 teamMember 추가
3. team별로 topic CRUD
4. 글 별로 업무지정자 지정 가능
5. 글에 파일첨부
6. 글 내용검색 및 멤버 검색 시 자동완성


라이브러리
* MyBatis
* log4j
* jackson
* jstl
* Jquery Autocomplete
