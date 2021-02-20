# introduction


* 목표: 자전거 대여 웹페이지 구현
* 개발기간 : 2021.02.10 ~ 2021.02.18



# Demo

![프로젝트화면](https://user-images.githubusercontent.com/54271574/108473099-f0951c00-72d0-11eb-8bc0-b0d2c8d1b4f9.jpg)

# Model

![데이터모델](https://user-images.githubusercontent.com/54271574/108472286-e58dbc00-72cf-11eb-88ad-dbac36d798e7.JPG)


# Technologies

* Java
* HTML
* JavaScript
* Oracle
* Git, Github

# Features

* member
   - 유저정보저장
   - 회원가입 / 로그인
     - 회원가입시 유효성 검사(아이디)
     - 로그인시 아이디,비밀번호 불일치시 로그인 불가 

* bike
   - 자전거 정보 저장 
   - 자전거 전체 목록,지역별 자전거 목록 구현
   
  
* bikere
   - 예약 구현
      - 예약시 당일 기준으로 이전 날짜는 선택할 수 없음
      - 예약일,예약기간 선택에 따른 가격설정
      - 옵션가를 선택하여 예약 가능
   - 예약 확인
      - 회원별 예약현황 확인,반납 기능 구현 
      - 비로그인시 접근 불가 

* board,coment
   - 자유게시판 구현
      - 로그인 사용자만 글 작성 가능
      - 해당게시글 작성자만 수정,삭제 기능 구현
   - 댓글
     - 로그인 사용자만 글 작성 가능
     - 해당댓글 작성자만 수정,삭제 기능 구현

* notice
    - 공지사항게시판 구현
      - 관리자계정으로만 게시글 작성,수정,삭제 가능
      - 제목으로 검색기능 구현
    
