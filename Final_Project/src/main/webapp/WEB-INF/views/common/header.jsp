<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7b8a61ae85e27a17fc90cd2fcea0205&libraries=services"></script>
<!-- alertifyS alert창 활성화 -->
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css"/>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/bootstrap.min.css"/>
<!-- Font Awesome 라이브러리 추가 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.6.2/js/bootstrap.min.js"></script>

<style>
	body {
	    margin-top: 160px;  /* 헤더의 높이만큼 상단 여백을 추가 */
	}	
	
	.outer{
		margin: auto;
		width: 1000px;
	}
	
	.header-area{
		margin: auto;
		width: 100%;
		height: 150px;
		display: flex;
		position: fixed;  /* 고정 위치 설정 */
	    top: 0;           /* 상단에 고정 */
	    left: 0;          /* 왼쪽에 고정 */
	    right: 0;         /* 오른쪽까지 확장 */
	    z-index: 1000;    /* 다른 요소보다 위에 보이게 설정 */
	    background-color: #fff;
	    border-bottom: 3px solid #ffdd00;
	}
	
	.left{
		width: 15%;
		height: 100%;
	}
	
	.mid{
		width: 70%;
		height: 100%;
	}
	
	.right{
		width: 15%;
		height: 100%;
	}
	
	.mid-top{
		width: 100%;
		height: 60%;
		display: flex;
	}
	
	.mid-bottom{
		width: 100%;
		height: 40%;
	}
	
	.title-area{
		height: 100%;
		width: 20%;
		position: relative;
	}
	
	#title{
		width: 100%;
		height: 60%;
       	position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    text-align: center;  
	    display: flex;       
	    justify-content: center;  
	    align-items: center;
	}
	
	.searchBar-area {
        width: 55%;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    .search-input {
    	margin-left: 20px;
        width: 80%; /* 검색창을 가득 채우도록 설정 */
        height: 40px;
        padding: 5px 10px;
        border: 2px solid #ccc;
        border-radius: 20px;
        font-size: 16px;
        transition: border-color 0.3s ease;
        padding-right: 40px; /* 버튼 공간을 만들기 위한 여백 */
    }
    
    .search-input:focus {
        border-color: #007BFF;
        outline: none;
    }
    
    .search-button {
        position: absolute;
        right: 40px; /* 검색 버튼을 오른쪽에 배치 */
        top: 50%;
        transform: translateY(-50%); /* 세로 중앙 정렬 */
        padding: 8px; /* 버튼 여백을 아이콘만 보이게 설정 */
        background-color: white; /* 버튼 배경을 하얀색으로 변경 */
        color: black; /* 아이콘 색을 검은색으로 설정 */
        border: 2px solid #ccc; /* 버튼 테두리 설정 */
        border-radius: 50%; /* 둥근 버튼 형태 */
        cursor: pointer;
        font-size: 18px; /* 아이콘 크기 */
        display: flex;
        align-items: center;
        justify-content: center;
        transition: background-color 0.3s ease;
    }
    
    .search-button i {
        font-size: 18px;
    }
    
    .search-button:hover {
        background-color: #f7f7f7; /* 호버 시 버튼 배경색 변경 */
    }

	.loginbtn-area{
		height: 100%;
		width: 35%;
		position: relative;
	}
	
	#btnSet{
		width: 100%;
		height: 60%;
       	position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    text-align: center;  
	    display: flex;       
	    justify-content: center;  
	    align-items: center;
	}
	
	#btnSet a{
		text-decoration: none;
        color: black;
   		margin-right: 5px;
	}
	
	#title a{
		text-decoration: none;
        color: black;
        font-size: 24px;
   		margin-right: 10px;
	}
	
	#btnSet a:hover{
		cursor: pointer;
	}
	
	#btnSet a:last-child {
	    margin-right: 0;
	}
	
	.navbar-nav li{
		margin-right: 10px;
	}
	
	.navbar-nav li:last-child{
		margin-right: 0px;
	}
	
	#category-area{
		margin: 0px;
        padding: 0px;
        height: 100%;
	}
	
	#category-area1{
		margin: 0px;
        padding: 0px;
        height: 100%;
	}
	
	#category-area li:hover{
		cursor: pointer;
	}
	
	#category-area1 li:hover{
		cursor: pointer;
	}
	
	/* 카카오 스타일 버튼 */
	.btn-kakao {
	    background-color: #ffdd00; /* 카카오톡의 노란색 배경 */
	    color: #3e3e3e; /* 텍스트 색상 */
	    font-size: 15px; /* 폰트 크기 줄임 */
	    font-weight: bold; /* 폰트 두껍게 */
	    border: none; /* 기본 버튼 테두리 없앰 */
	    border-radius: 10px; /* 둥근 모서리 */
	    padding: 7px 12px; /* 버튼 내 여백 */
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    position: relative; /* ::after 가상 요소를 버튼 아래에 위치시키기 위해 relative 설정 */
	}
	
	/* 버튼 텍스트 */
	.btn-kakao .btn-text {
	    text-align: center;
	}
	
	/* hover 효과 */
	.btn-kakao:hover {
	    background-color: #f7c600; /* hover 시 색상 변화 */
	    cursor: pointer;
	}
	
	/* 드롭다운 버튼 크기 */
	.btn-kakao.dropdown-toggle::after {
	    display: none;
	}

	/* 타이틀 영역 */
	#title a {
	    text-decoration: none; /* 밑줄 제거 */
	    font-size: 25px; /* 폰트 크기 */
	    font-weight: bold; /* 폰트 두껍게 */
	    color: #000000; /* 검은색 */
	    font-family: 'Arial', sans-serif; /* 깔끔한 글꼴 */
	    display: flex; /* 중앙 정렬 */
	    justify-content: center; /* 가로 중앙 정렬 */
	    align-items: center; /* 세로 중앙 정렬 */
	    padding: 10px; /* 여백 추가 */
	    border-radius: 10px; /* 둥근 모서리 */
	    transition: transform 0.3s ease; /* 호버 시 애니메이션 */
	}
	
	/* hover 시 애니메이션 */
	#title a:hover {
	    transform: scale(1.05); /* 약간 확대되는 효과 */
	}
	
	/* 링크 텍스트의 효과 */
	#title a:hover {
	    color: #333333; /* 마우스 호버 시 글자색 변경 */
	}

	/* 버튼 세트 정렬 */
	#btnSet {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    gap: 3px; /* 버튼 간 간격을 더 좁힘 */
	}
	
	/* 버튼 크기 조정 */
	#btnSet a {
	    font-size: 12px; /* 버튼 글자 크기 더 줄임 */
	    padding: 10px 15px; /* 버튼 내 여백을 작게 조정 */
	}
	
	/* 중앙 영역 레이아웃 */
	.mid-top {
	    width: 100%;
	    height: 60%;
	    display: flex;
	    justify-content: space-between; /* 좌우 여백 */
	    align-items: center;
	}

	/* 메뉴 항목 기본 스타일 */
	.nav-item {
	    margin-right: 15px; /* 메뉴 항목 간격 */
	}

	/* 링크 기본 스타일 */
	.nav-link {
	    color: #3e3e3e; /* 기본 텍스트 색상 */
	    font-size: 14px; /* 기본 폰트 크기 */
	    font-weight: bold; /* 텍스트 두껍게 */
	    text-decoration: none; /* 밑줄 제거 */
	    padding: 10px 15px; /* 메뉴 항목 여백 */
	    border-radius: 10px; /* 둥근 모서리 */
	    position: relative; /* 언더라인을 위한 position 설정 */
	    transition: color 0.3s ease; /* 색상 변화에 부드러운 애니메이션 추가 */
	}
	
	/* 언더라인 초기 설정 */
	.nav-link::after {
	    content: ''; /* 가상 요소 생성 */
	    position: absolute;
	    bottom: 0;
	    left: 0;
	    width: 100%;
	    height: 3px; /* 언더라인의 두께 */
	    background-color: transparent; /* 기본 상태에서는 투명하게 설정 */
	    transition: background-color 0.3s ease, transform 0.3s ease; /* 색상과 애니메이션 추가 */
	    transform: scaleX(0); /* 초기 상태에서 언더라인 크기를 0으로 설정 */
	}
	
	/* hover 효과 */
	.nav-link:hover {
	    color: white; /* 텍스트 색상 흰색으로 변경 */
	}
	
	/* hover 시 언더라인 효과 */
	.nav-link:hover::after {
	    background-color: #f7c600; /* 카카오톡 노란색 배경 */
	    transform: scaleX(1); /* X축으로 크기 변화 */
	    transition-delay: 0.2s; /* 한박자 늦게 따라오게 설정 */
	}
	
	/* 전체 메뉴 배경 스타일 */
	.dropdown-menu {
	    background-color: #ffffff; /* 밝은 배경 */
	    border-radius: 8px; /* 둥근 모서리 */
	    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
	    padding: 10px;
	}
	
	/* 기본적으로 서브 메뉴는 숨기기 */
	.sub-menu {
	    display: none;
	    position: absolute; /* 절대 위치로 설정 */
	    left: 100%; /* 부모 항목의 오른쪽에 위치 */
	    top: 0; /* 서브 메뉴가 부모 항목의 맨 위에 위치하도록 설정 */
	    list-style-type: none;
	    padding: 0;
	    margin-top: 0;
	    background-color: #f8f8f8; /* 밝은 회색 배경 */
	    border-radius: 8px; /* 둥근 모서리 */
	    width: 200px; /* 서브 메뉴의 너비를 200px로 고정 */
	    height: auto; /* 서브 메뉴 항목의 수에 맞게 자동으로 높이 조정 */
	    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	    transform: translateX(-20px); /* 서브 메뉴가 처음에는 왼쪽으로 살짝 위치 */
	    opacity: 0; /* 서브 메뉴 초기 상태는 투명 */
	    transition: transform 0.3s ease, opacity 0.3s ease; /* 애니메이션 효과 */
	}
	
	/* <li> 항목에 hover 시 서브 메뉴 표시 */
	.dropdown-item:hover > .sub-menu {
	    display: block;
	    transform: translateX(0); /* 서브 메뉴가 원래 위치로 이동 */
	    opacity: 1; /* 서브 메뉴가 완전히 보이게 함 */
	}
	
	/* <li> 항목 스타일 */
	.dropdown-item {
	    position: relative; /* 서브 메뉴가 이 항목에 상대적으로 배치되도록 설정 */
	    padding: 12px 20px;
	    height: 30px; /* 부모 항목의 높이를 설정 */
	    font-size: 12px;
	    font-weight: bold;
	    color: #333; /* 어두운 글씨 */
	    cursor: pointer;
	    border-radius: 8px; /* 둥근 모서리 */
	    transition: background-color 0.3s ease, color 0.3s ease; /* 부드러운 호버 효과 */
	}
	
	/* 기본 hover 효과 */
	.dropdown-item:hover {
	    background-color: #ffe600; /* 카카오 색상 - 노란색 */
	    color: #000; /* 글자 색을 검정색으로 변경 */
	}
	
	/* 서브 메뉴 항목 스타일 */
	.sub-menu li {
	    padding: 10px 20px; /* 서브 메뉴 항목의 패딩을 동일하게 설정 */
	    font-size: 10px; /* 글자 크기 12px로 고정 */
	    font-weight: normal;
	    color: #666; /* 부드러운 회색 */
	    transition: background-color 0.3s ease;
	    border-bottom: 1px solid #ddd; /* 항목 구분선 */
	    box-sizing: border-box; /* padding과 border를 포함하여 크기를 고정 */
	}

	/* 서브 메뉴 마지막 항목의 구분선 제거 */
	.sub-menu li:last-child {
	    border-bottom: none; /* 마지막 항목의 구분선 제거 */
	}
	
	/* 배경색 영역이 hover할 때 전체 항목에 적용되도록 */
	.sub-menu li:hover {
		border-radius: 8px;
	    color: #000; /* 글자 색 */
	    padding: 10px 20px; /* 패딩 적용 */
	}
	
	.dropdown-item a{
		color: black;
		text-decoration: none;
	}
	
	/* 슬라이드 창 스타일 */
	.slide-sidebar {
	    position: fixed;
	    top: auto;
	    bottom: 50px;              /* 하단 기준으로 위치 */
	    right: -300px;             /* 초기 위치는 오른쪽 밖 */
	    width: 300px;
	    height: 70%;               /* 세로 길이를 화면의 70%로 설정 */
	    background-color: #4f4f4f; /* 어두운 회색 배경 (카카오톡 스타일) */
	    color: white;
	    padding: 20px;
	    transition: right 0.3s ease-in-out; /* 슬라이드 애니메이션 */
	    box-shadow: -2px 0 5px rgba(0, 0, 0, 0.3); /* 그림자 추가 */
	    display: flex;
	    flex-direction: column;
	    border-radius: 20px;
	    justify-content: flex-end; /* 하단에 위치하게 설정 */
	    z-index: 1000;
	}
	
	/* 슬라이드 창이 열리면 오른쪽으로 위치 이동 */
	.slide-sidebar.open {
	    right: 0; /* 화면 안으로 들어옴 */
	}
	
	/* 닫기 버튼 스타일 */
	#closeSidebar, #backChatList {
	    position: absolute;
	    bottom: 10px;               /* 상단에서 20px */
	    right: 135px;             /* 오른쪽에서 20px */
	    background-color: #FFDD00;
	    color: white;
	    font-size: 18px;         /* 아이콘 크기 */
	    border: none;
	    border-radius: 50%;      /* 둥글게 만들기 */
	    width: 30px;
	    height: 30px;
	    text-align: center;
	    line-height: 30px;
	    cursor: pointer;
	    transition: background-color 0.3s ease, transform 0.2s ease;
	}
	
	#backChatList{
		right: 70px;
	}
	
	/* X 아이콘 스타일 */
	#closeSidebar i {
	    font-size: 18px; /* X 아이콘 크기 */
	}
	
	/* 채팅 입력창 및 버튼 스타일 */
	.chat-input-container {
	    display: flex;
	    justify-content: space-between; /* 입력창과 버튼을 가로로 배치 */
	    align-items: center;
	    width: 100%;
	    background-color: #2c2c2c; /* 어두운 회색 */
	    padding: 10px;
	    border-radius: 20px;
	    box-sizing: border-box;
	    margin-bottom: 30px;
	}
	
	/* 입력창 스타일 */
	.chat-input-container input {
	    width: 85%; /* 입력창의 너비 설정 */
	    padding: 10px;
	    border: none;
	    border-radius: 20px;
	    background-color: #fff;
	    color: #333;
	    font-size: 16px;
	    outline: none;
	    box-sizing: border-box;
	}
	
	.chat-input-container input::placeholder {
	    color: #999; /* placeholder 색상 */
	}
	
	/* 보내기 버튼 스타일 */
	.chat-input-container button {
	    background-color: #ffcc00;  /* 버튼 배경 색상 */
	    color: white;
	    border: none;
	    border-radius: 50%;         /* 둥글게 만들기 */
	    width: 40px;
	    height: 40px;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    cursor: pointer;
	    font-size: 20px;
	    transition: background-color 0.3s ease;
	}
	
	/* 버튼 호버 시 색상 변화 */
	.chat-input-container button:hover {
	    background-color: #ff9900;
	}
	
	/* 채팅 영역 스타일 */
	#chatArea {
	    overflow-y: scroll;       /* 세로 스크롤 가능 */
	    height: 80%;              /* 채팅 영역 높이 */
	    padding: 10px;
	    display: flex;
	    flex-direction: column; /* 채팅 메시지가 아래에서 위로 올라오도록 설정 */
	}
	
	/* 스크롤바 스타일 (전체 스크롤바) */
	#chatArea::-webkit-scrollbar {
	    width: 8px;                  /* 스크롤바의 너비 */
	    height: 8px;                 /* 가로 스크롤바의 높이 */
	}
	
	/* 스크롤바 트랙(배경) 스타일 */
	#chatArea::-webkit-scrollbar-track {
	    background: #f1f1f1;         /* 스크롤 트랙 배경 색상 */
	    border-radius: 10px;         /* 둥근 모서리 */
	}
	
	/* 스크롤바 슬라이더(드래그 부분) 스타일 */
	#chatArea::-webkit-scrollbar-thumb {
	    background: #888;            /* 스크롤바 슬라이더 색상 */
	    border-radius: 10px;         /* 둥근 모서리 */
	    border: 2px solid #f1f1f1;   /* 트랙 배경과 구분을 위한 경계선 */
	}
	
	/* 스크롤바 슬라이더(드래그 부분) 호버 스타일 */
	#chatArea::-webkit-scrollbar-thumb:hover {
	    background: #555;            /* 마우스 오버 시 색상 변화 */
	}
	
	/* 가로 스크롤바 스타일 (필요할 경우만 표시됨) */
	#chatArea::-webkit-scrollbar-horizontal {
	    height: 8px;                 /* 가로 스크롤바 높이 */
	}
	
	/* 스크롤바 트랙(배경) - 가로 스크롤 */
	#chatArea::-webkit-scrollbar-track-horizontal {
	    background: #f1f1f1;
	    border-radius: 10px;
	}
	
	/* 스크롤바 슬라이더(드래그 부분) - 가로 스크롤 */
	#chatArea::-webkit-scrollbar-thumb-horizontal {
	    background: #888;
	    border-radius: 10px;
	    border: 2px solid #f1f1f1;
	}
	
	/* 가로 스크롤바 슬라이더(드래그 부분) 호버 - 가로 스크롤 */
	#chatArea::-webkit-scrollbar-thumb-horizontal:hover {
	    background: #555;
	}

	/* 사용자가 보낸 메시지 스타일 */
	.chat-message.user {
	    background-color: #FFEB3B; /* 사용자 메시지 색상 */
	    margin-left: auto;         /* 오른쪽 정렬 */
	    border-top-left-radius: 0; /* 왼쪽 위 모서리 반경 없애기 */
	}
	
	/* 관리자 메시지 스타일 */
	.chat-message.admin {
	    background-color: #F0F0F0; /* 관리자 메시지 색상 */
	    margin-right: auto;         /* 왼쪽 정렬 */
	    border-top-right-radius: 0; /* 오른쪽 위 모서리 반경 없애기 */
	}
	
	/* 메시지 타임스탬프 */
	.chat-message h6 {
	    font-size: 10px;
	    color: #999;
	    margin: 5px 0 0;
	}
	
	/* 원형 버튼 스타일 */
    .floating-btn {
      position: fixed; /* 화면 고정 */
      bottom: 20px; /* 화면 하단에서 20px 위로 */
      right: 20px; /* 화면 우측에서 20px 안으로 */
      width: 60px; /* 버튼의 너비 */
      height: 60px; /* 버튼의 높이 */
      background-color: #FFDD00; /* 카카오톡 노란색 */
      color: white; /* 텍스트 색 */
      border: none; /* 테두리 제거 */
      border-radius: 50%; /* 원형 모양 */
      font-size: 24px; /* 글자 크기 */
      display: flex; /* 내용 중앙 정렬 */
      justify-content: center; /* 수평 중앙 정렬 */
      align-items: center; /* 수직 중앙 정렬 */
      cursor: pointer; /* 마우스 커서 변경 */
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
      transition: transform 1s ease, opacity 1s ease; /* 애니메이션 효과 */
    }

    /* 버튼에 마우스를 올렸을 때 효과 */
    .floating-btn:hover {
      background-color: #FFB800; /* 어두운 노란색 */
    }
    
    /* 사라지기 애니메이션 */
    .hidden {
      transform: translateX(20vw); /* 화면 왼쪽으로 이동 */
      opacity: 0; /* 불투명도 0으로 설정 */
    }
    
    /* 다시 나타나기 애니메이션 */
    .show {
      transform: translateX(0); /* 원래 위치로 돌아옴 */
      opacity: 1; /* 불투명도 1로 설정 */
    }
    
    #chatArea, .chat-input-container{
    	display: none;
    }

    .bottom-btn {
      width: 50px;
      height: 50px;
      background-color: #FFDD00; /* 카카오톡 노란색 */
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 24px;
      color: white;
      border: none;
      cursor: pointer;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
    }

    /* 버튼 클릭시 효과 */
    .bottom-btn:hover {
      background-color: #FFB800;
    }
    
    #userChatList{
    	width: 100%;
    	height: 90%;
    	margin-bottom: 40px;
    }
    
    #liststyle{
    	background-color: white;
    	border-radius: 20px;
    	color: black;
    	text-align: center;
    	padding: 5px;
    	margin-bottom: 3px;
    	
    }
    
    #liststyle:hover{
    	background-color: #FFDD00;
    	cursor: pointer;
    }
    
</style>

</head>
<body>
	
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	
	<c:if test="${not empty alertMsg}">
		<script>
			alertify.alert("알림 메시지", "${alertMsg}");
		</script>
	</c:if>
	<c:remove var="alertMsg"/>
	
	<div class="header-area">
		<div class="left"></div>
		<div class="mid">
			<div class="mid-top">
				<div class="title-area">
					<div id="title">
						<a href="${contextPath}">KH 중고마켓</a>
					</div>
				</div>
				<div class="searchBar-area">
					<form action="#" method="get" style="width: 100%; position: relative;">
				        <input type="text" class="search-input" placeholder="검색어를 입력하세요" name="keyword">
				        <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
				    </form>
				</div>
				<div class="loginbtn-area">
					<div id="btnSet">
						<c:choose>
							<c:when test="${not empty loginUser}">
								<a href="#" class="btn-kakao"><i class="fas fa-comment"></i>&nbsp;채팅</a> 
								<a href="#" class="btn-kakao"><i class="fas fa-store"></i>&nbsp;판매</a> 
								<a href="${contextPath}/user/mypage" class="btn-kakao"><i class="fas fa-user"></i>&nbsp;MyPage</a>
								<a href="${contextPath}/user/logout" class="btn-kakao" style="height: 39px;"><i class="fas fa-sign-in-alt"></i></a> 
							</c:when>
							<c:otherwise>
								<a href="#" class="btn-kakao"><i class="fas fa-comment"></i>&nbsp;관리자문의</a>
								<a href="${contextPath}/user/login" class="btn-kakao"><i class="fas fa-sign-in-alt"></i>&nbsp;로그인</a> 
								<a href="${contextPath}/user/sginin" class="btn-kakao"><i class="fas fa-user-plus"></i>&nbsp;회원가입</a> 
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="mid-bottom">
				<nav class="navbar navbar-expand-sm bg-light navbar-light" style="border-radius: 20px;">
				    <ul class="navbar-nav d-flex w-100"> <!-- d-flex로 flexbox 레이아웃을 적용 -->
				        <li class="nav-item">
				            <div class="container">
				                <div class="dropdown">
				                    <button type="button" class="btn btn-kakao dropdown-toggle" data-toggle="dropdown">
				                        <span class="btn-text">카테고리<i class="fas fa-bars"></i></span>
				                    </button>
									<div class="dropdown-menu">
										<h5 class="dropdown-header">상품 카테고리</h5>
										<ul id="category-area">
											
										</ul>
										<br>
										<h5 class="dropdown-header">고객센터</h5>
										<ul id="category-area1">
											<li class="dropdown-item"><a href="${contextPath}/board/toRequest">문의하기</a></li>
										</ul>
									</div>

								</div>
				            </div>
				        </li>
				        <li class="nav-item"><a class="nav-link" href="${contextPath}/board/toNotice">공지사항</a></li>
				        <li class="nav-item"><a class="nav-link" href="#">지역모임</a></li>
				        <li class="nav-item"><a class="nav-link" href="#">요청하기</a></li>
				        <li class="nav-item"><a class="nav-link" href="${contextPath}/board/myPickPage">찜한목록</a></li>
				        <li class="nav-item"><a class="nav-link" href="${contextPath}/user/toPurchaseKH">KAKAO구매</a></li>
				
				        <!-- '위치변경'을 오른쪽 끝으로 밀기 위해 ml-auto를 추가 -->
				        <li class="nav-item ml-auto"><a class="nav-link" data-toggle="modal" 
				        	data-target="#gpsLocationModal" style="cursor:pointer;">
				        		<i class="fas fa-map-marker-alt"></i></a></li>
				    </ul>
				</nav>
			</div>
		</div>
		<div class="right"></div>
	</div>
	
	<div id="slideSidebar" class="slide-sidebar">
		<div id="userChatList">
			<c:if test="${loginUser.userId != 'admin'}">
				<div id="liststyle">채팅문의</div>
			</c:if>
		</div>
		<div id="chatArea"></div>
    	<div class="chat-input-container">
	        <input type="text" name="sendMessage" id="sendMessage" style="color: white; border: none; background-color: black;"/>
	        <button onclick="send();"><i class="w3-icon w3-large fa fa-paper-plane"></i></button>
	    </div>
		<div id="bottomButtons">
			<button class="bottom-btn" id="closeSidebar">
				<i class="fas fa-home w3-large" style="color: rgb(106, 78, 35);"></i>
			</button>
			<button class="bottom-btn" id="backChatList">
				<i class="fas fa-arrow-left" style="color: rgb(106, 78, 35);"></i>
			</button>
		</div>
	</div>
	
	<c:if test="${not empty loginUser}">
		<!-- 우측 하단 채팅 버튼 -->
  		<button class="floating-btn" id="openSlideBtn"><i class="fas fa-comment" style="color: rgb(106, 78, 35);"></i></button>
	</c:if>
  
	<script>
		// 채팅에서 해당 닉네임 또는 채팅문의 클릭시 session에 해당 닉네임 저장(채팅용)
		$("#userChatList").on("click", "div", function(){
			var otherUser = $(this).text();
			
			if(otherUser == '채팅문의'){
				otherUser = '관리자';
			}
			
			$.ajax({
				url : "${contextPath}/chatting/saveChatUser",
				data : {
					otherUser : otherUser
				},
				success : function(result){
					console.log(result);
				},
				error : function(e){
					console.log(e);
					console.log("등록 실패");
				}
			});
			
			$("#userChatList").css("display","none");
			$("#chatArea").css("display","block");
			$(".chat-input-container").css("display","flex");
			
		});
		
		// 이전 버튼 클릭시 해당 세션에 담긴 상대 닉네임을 제거
		$("#backChatList").click(function(){
			var displayStatus = $("#userChatList").css("display");
			
			if(displayStatus == "none"){
				
				$.ajax({
					url : "${contextPath}/chatting/deleteChatUser",
					success : function(result){
						console.log(result);
					},
					error : function(e){
						console.log(e);
						console.log("삭제 실패");
					}
				});
				$("#userChatList").css("display","block");
				$("#chatArea").css("display","none");
				$(".chat-input-container").css("display","none");
			}
		})
	
		// 로그인 정보가 있는 경우(로그인한 경우) 웹소켓 연결
		$(function(){
			if("${loginUser.nickname}" != null){
				connection();
			}
			else{
				disconnection();
			}
		});
	
		$("#openSlideBtn").click(function(){
			$("#openSlideBtn").addClass("hidden").removeClass("show");
			$("#slideSidebar").addClass("open").removeClass("close");
		});
		
		$("#closeSidebar").click(function(){
			$("#openSlideBtn").addClass("show").removeClass("hidden");
			$("#slideSidebar").addClass("close").removeClass("open");
		});
		
		var socket;
		
		// 관리자 채팅 접속
		function connection(){
			var url ="ws://localhost:8888/finalProject/chatting"
			
			// 소켓이 없을 경우 생성
			if(!socket){
				socket = new WebSocket(url);
			}
			
			// 연결되었을 떄 동작
			socket.onopen = function(){
				console.log("연결 성공!!");
				
			}
			
			// 연결 종료시 동작
			socket.onclose = function(){
				console.log("연결 종료!!");
			}
			
			// 메시지 받아옴
			socket.onmessage = function(message){
				var originDiv = $("#chatArea");
				
				// 전달받은 json 형태의 문자열을 json객체로 파싱하기
				var data = JSON.parse(message.data);
				
				var listDiv = $("<div id='liststyle'>").html(data.nickname);
				
				var newDiv = $("<div>").html(data.nickname + " : " + data.messageContent 
						+ "<br> <h6 style='font-size: 12px; color:gray;'>[" + data.createData + "]</h6>");
				
				// 기존 채팅 리스트에 있는 유저들을 요소로 뽑아온다.
				var children = $("#userChatList").children();
				
				// 존재 유무 판별용
				var existNick = false;
				
				// 뽑아온 요소들의 text중에서 수신받은 메시지의 닉네임과 동일한 닉네임이 있는 경우 존재(true)로 변경
				// 없다면 false 그대로 진행한다.
				for(var i = 0; i < children.length; i++){
					if($(children[i]).text() === data.nickname){
						existNick = true;
						break;
					}
				}
				
				// 자신의 닉네임은 올라오지 않는다.
				if("${loginUser.nickname}" != data.nickname){
					// 존재유무가 false(없다)라면 채팅 목록에 닉네임을 띄워준다.
					if(!existNick){
						$("#userChatList").append(listDiv);
					}
				}
				
				originDiv.append(newDiv);
				originDiv.scrollTop(originDiv[0].scrollHeight);
			}
		}
		
		// 메시지 전송 함수
		function send(){
			var msg = $("#sendMessage").val();
			
			socket.onerror = function(e){
				console.log(e);
				console.log("에러 발생!!");
			}
			
			if(msg != ""){

				var obj = {
					nickname : "${loginUser.nickname}",
					otherUser : "${otherUser}",
					msg : msg
				};

				socket.send(JSON.stringify(obj));
				$("#sendMessage").val("");
			}
		}
		
		// 접속 종료 함수
		function disconnection(){
			socket.close();
		}
	
		$(function(){
			$.ajax({
				url : "${contextPath}/user/getCate",
				success : function(result){
					
					$("#category-area li").remove();
					
					for(var i of result){
						var li = $("<li class='dropdown-item'>").text(i.categoryName);
						
						if(i.categoryDetailName){
							var ul = $("<ul class='sub-menu'>");
							ul.append($("<li onclick='goThere();'>").text(i.categoryDetailName));
							ul.appendTo(li);
						}
						
						
						$("#category-area").append(li);
					}
					
				},
				error : function(error){
					console.log(error);
					console.log("통신오류");
				}
			})
		});
		
		function goThere(){
			
			location.href="#";
		}
	</script>

	<!-- 카카오톡 스타일 현재 위치 모달창 -->
	<div class="modal" id="gpsLocationModal">
	    <div class="modal-dialog">
	        <div class="modal-content" style="border: none; border-radius: 10px;">
	
	            <!-- Modal Header -->
	            <div class="modal-header" style="background-color: #f7c600; color: white; border-radius: 10px; border: none;">
	                <h4 class="modal-title">현재 위치 확인</h4>
	                <button type="button" class="close" data-dismiss="modal" style="color: white; border: none;">&times;</button>
	            </div>
	
	            <!-- Modal Body -->
	            <div class="modal-body" style="padding: 20px; font-size: 16px; color: #333; border: none;">
	                <p>현재 위치를 확인하고 변경할 수 있습니다.</p>
	                <div id="map" style="width: 100%;height:350px;"></div>   
					<br>
					<div class="form-group">
					    <label for="outputLocation">현재 위치 : </label>
						<input type="text" name="changeLocation" id="outputLocation" style="width: 80%; cursor:pointer; border: none;" readonly>
					</div>
	                <button type="button" class="btn btn-warning" style="width: 100%; border-radius: 25px; font-size: 16px;">위치 확인</button>
	            </div>
	
	            <!-- Modal Footer -->
	            <div class="modal-footer" style="border-top: none; padding: 0;">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal" style="width: 100%; border-radius: 25px; background-color: #e6e6e6; color: #333;">닫기</button>
	            </div>
	
	        </div>
	    </div>
	</div>
	
	<script>
	
		let addressName;
		
		function getLocationName(latitude, longitude){
			$.ajax({
				url : "${contextPath}/user/searchLocation",
				async : false,
				data : {
					latitude : latitude,
					longitude : longitude
				},
				success : function(result){
					addressName = result.addressName;
					$("#outputLocation").val(result.addressName);
					
				},
				error : function(error){
					console.log(error);
					console.log("통신 오류");
				}
			});
		};
	
		$(function(){
			navigator.geolocation.getCurrentPosition((position) => {
				
				var latitude = position.coords.latitude;
				var longitude = position.coords.longitude;
				
				//var locationName = getLocationName(latitude, longitude);
				getLocationName(latitude, longitude);
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
		
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);
				
				// 지도를 클릭한 위치에 표출할 마커입니다
				var marker = new kakao.maps.Marker({ 
				    // 지도 중심좌표에 마커를 생성합니다 
				    position: map.getCenter() 
				}); 
				// 지도에 마커를 표시합니다
				marker.setMap(map);
				
				var iwContent = '<div style="padding:5px; font-size:9px;">' + addressName + '</div>',
				    iwPosition = new kakao.maps.LatLng(latitude, longitude); //인포윈도우 표시 위치입니다
	
				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent,
				    zindex:1
				});
				  
				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				infowindow.open(map, marker); 
				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
		
				// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
				kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
					
					marker.setMap(null);
					
				    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
				        if (status === kakao.maps.services.Status.OK) {
				            var detailAddr = !!result[0].road_address ? '<div style="font-size:9px">&nbsp;' + result[0].road_address.address_name + '</div>' : '';
				            detailAddr += '<div style="font-size:9px">&nbsp;[지번]' + result[0].address.address_name + '</div>';
				            
				            var content = '<div class="bAddr" style="font-size:12px; display: inline-block; width: auto; height: auto;">' +
				                            detailAddr + 
				                        '</div>';
	
				            // 마커를 클릭한 위치에 표시합니다 
				            marker.setPosition(mouseEvent.latLng);
				            marker.setMap(map);
		
				            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
				            infowindow.setContent(content);
				            infowindow.open(map, marker);
				            
				            $("#outputLocation").val(result[0].address.address_name);
				        }   
				    });
				});
				
				function searchAddrFromCoords(coords, callback) {
				    // 좌표로 행정동 주소 정보를 요청합니다
				    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
				}
		
				function searchDetailAddrFromCoords(coords, callback) {
				    // 좌표로 법정동 상세 주소 정보를 요청합니다
				    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
				}
			});
		})
	</script>

</body>
</html>