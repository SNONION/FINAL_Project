# FINAL_PROJECT

<pre>

  중고 제품 매매 플랫폼

레퍼런스 사이트 : 당근마켓, 번개장터, 중고나라

기획의도
1. 지속 가능한 소비 촉진
2. 편리하고 안전한 거래 환경
3. 중고 시장의 활성화

베이스 컬러
배경색상 - 흰색
기타 UI - 노란색 및 갈색 +-흰색


1. 사용자 계정 및 인증 - 마이페이지 - 후순위 (하) - 나
	(완) 회원가입/로그인: 
		위치(GPS), 휴대폰 번호(인증 - 미정) 지원.
		기본 회원 정보 받을 예정 (ERD 참고)
		(kakao 로그인 - 미정)
	프로필 관리: 닉네임, 프로필 사진, 소개글 수정 기능.
	(완)위치 인증: 
		사용자 지역 설정 및 GPS 기반 인증. - 카카오맵API / Geolocation API 사용
	신뢰도 시스템: 
		거래 후기, 평점 기능. - 구매후 가능
		상품 게시판 댓글 - 누구나 이용가능
2. 상품 게시 및 검색 - 상품게시판 (최상) - 재홍이형님
	상품 등록:
		사진 업로드(최대 10장 - 미정).
		제목, 설명, 가격, 카테고리 선택.
		상태(새 상품/중고) 및 거래 방법(직거래/택배) 선택.
		(택배 선택시 구매자에게 보내기 전에 본사에서 사기 방지를 위해 
		상품 검수 후 구매자에게 보내는 방식을 사용함)
	상품 검색:
		키워드 검색 및 필터(카테고리, 가격 범위, 지역 등) 제공.
		정렬(최신순, 가격순).
		상품 상세 페이지:
			상품 정보, 판매자 정보, 문의하기 버튼
		댓글:
			판매자와 작성자만 볼 수 있는 비밀 댓글
3. 지역 기반 시스템 - 지역게시판 (하) - 우준이형님
	근처 지역 추천: 
		현재 위치를 기반으로 가까운 거래 가능 지역 표시.
	지역 커뮤니티: 
		동네 기반 게시판 제공(중고거래 외에도 동네 소식, 소모임 등).
	위치 변경 옵션: 
		사용자 위치를 수동으로 설정 가능.
4. 거래 관련 기능 - 채팅 시스템 (상) - 준호형님
	채팅 시스템:
		판매자와 구매자가 실시간으로 대화 가능.
		거래 상태 업데이트(예약 중, 거래 완료 등) 버튼. 
		(구매자, 판매자 모두 눌러야 판매 완료 처리가 되며, 
		판매자가 먼저 누른 후 구매자의 구매완료 버튼이 활성화됨)
		가격 제안: 
			구매자가 가격 협상 가능하도록 기능 제공. 
			(간단한 경매 시스템 <예약시스템과 연결)
	찜하기: 
		관심 상품 즐겨찾기. (찜하기 테이블)
	거래 완료 처리:
		거래 완료 후 후기 작성 요청.
		구매자/판매자 평가 시스템. (평점 시스템)
5. 안전 거래 기능 - 게시판, 댓글 ,이용자 모두 신고 가능
	신고 시스템:
		부적절한 상품, 사기 의심 사용자 신고 기능. (게시판 및 댓글 신고기능)
		거래 관련 기능 - 거래 상태 버튼에서 구매자 및 판매자 신고가능
		(신고 받은 상태에서는 판매 및 구매가 불가능 - 문의 및 관리자 채팅으로 해결)
	리뷰 및 평판 관리:
		불성실 사용자에 대한 경고 표시. (유저 신고 및 경고 기능)
	안전 수칙 알림:
		거래 시 주의할 점 팝업 또는 알림. (CONFIRM 창으로 구현)
6. 관리자 도구(어드민) - 후순위
	상품 및 사용자 관리:
		문제 있는 게시물 삭제.
		사용 제재 및 경고 기능.
	데이터 분석:
		인기 상품, 지역별 거래량 등 분석.
	공지사항 관리:
		사용자들에게 공지 사항 알림 시스템.
7. 기타 부가 기능 - 후순위
	알림 시스템:
		거래 관련 알림(문의, 채팅, 거래 완료).
	결제 시스템(옵션):
		택배 거래를 위한 안전 결제 서비스 추가.	
	택배 추적 API (옵션)
8. 기술적 고려 사항 - 만들면서 진행
	반응형 디자인: <@MEDIA (해상도)> - 이용 예정
		모바일, 태블릿, PC 모두에서 원활히 작동.



현재 위치 정보를 가져오기 위한 Geolocation API 사용
https://developer.mozilla.org/ko/docs/Web/API/Geolocation_API/Using_the_Geolocation_API







    
</pre>
