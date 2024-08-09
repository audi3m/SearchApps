//
//  DummyData.swift
//  SearchApps
//
//  Created by J Oh on 8/9/24.
//

import Foundation

let dummyApp = Appp(screenshotUrls: [
    "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/3b/44/c1/3b44c1ea-3367-f7a4-2c27-76f5bbe8a4d3/2863754d-fcf9-44ca-b2e4-a3779fe92e4e_1_1242_2208.jpg/392x696bb.jpg",
    "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/a1/c6/8f/a1c68f28-8549-d694-ffad-a0a8110dc64f/fd677b73-64bb-415b-be6b-ce52da504705_2_1242_2208.jpg/392x696bb.jpg",
    "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/9b/d9/dc/9bd9dcc4-d04e-6c0e-805a-876d4962b761/c2a6c2f0-68ca-433b-b4fc-9e89af7476e9_3_1242_2208.jpg/392x696bb.jpg",
    "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/aa/59/8e/aa598e52-fb91-db8a-4fe5-90349bb83d45/62309ee7-489b-4b80-b79b-b4c02c5f4130_4_1242_2208.jpg/392x696bb.jpg",
    "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/6e/cd/2c/6ecd2c0b-a4b6-3d32-c981-ce26819516cd/6eb6f461-fbb4-4038-9abb-cacd32e07d5d_5_1242_2208.jpg/392x696bb.jpg",
    "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/da/f2/28/daf228b3-e42c-d2ed-b994-7e854a0adb26/6c551c33-b8b3-4b98-b79b-41c8d57dece3_6_1242_2208.jpg/392x696bb.jpg",
    "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/6d/63/e9/6d63e92d-d446-a423-7bf5-879f06ca5a1e/c19cdd27-1382-4704-9635-06cc3c9d6028_7_1242_2208.jpg/392x696bb.jpg",
    "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/93/29/2b/93292bb6-7b91-f3f0-a27e-2b2aa2dc191b/475e2e5e-9d4e-4cb9-a5bc-cd68fd09dd83_8_1242_2208.jpg/392x696bb.jpg",
    "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/78/4b/5e/784b5e0d-ab12-4134-cd40-0a23084cd272/95110afa-c1ae-453e-ba03-31e0c5f2f232_9_1242_2208.jpg/392x696bb.jpg"
],
                    artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/23/4c/69/234c69d4-779e-1505-dcd4-589f10004d7c/AppIcon-0-0-1x_U007emarketing-0-6-0-sRGB-85-220.png/60x60bb.jpg",
                    artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/23/4c/69/234c69d4-779e-1505-dcd4-589f10004d7c/AppIcon-0-0-1x_U007emarketing-0-6-0-sRGB-85-220.png/100x100bb.jpg",
                    artistName: "Kakao Mobility Corp.",
                    description: "카카오 T의 혁신을 통해 모든 이동의 고민으로부터 벗어나 더 편하고, 즐겁고, 가치 있는 일상을 만들어갑니다.\n\n테마 별로 재구성된 홈 상단탭에서 원하는 서비스를 찾아 이용해보세요.\n• 홈 탭: 메인 서비스들과 신규 서비스\n• 마이카 탭: 카오너들을 위한 차량 운행/관리 서비스\n• 여행 탭: 장거리 이동에 필요한 서비스 \n\n■ 믿고 부르는, 카카오 T 택시\n• 전국에서 이용 가능한 간편 택시 호출\n• 블루/벤티/모범/블랙 원하는 택시를 자유롭게 선택\n\n■ 가까운 곳도 바이크와 킥보드로 신나게\n• 남녀노소 누구나 쉽게 타는 일반 & 전기 자전거, 카카오 T 바이크\n• 제휴 킥보드도 같은 지도에서 탐색 및 이용 가능\n• 원하는 곳 어디서나 자유롭게 이용 후 반납\n\n■ 데이터 중심의 대리운전\n• 앱으로 간편하게 대리운전 호출\n• 세심한 배려를 더한 프리미엄 대리운전 제공\n\n■ 주차 고민 끝, 편리한 주차 경험\n• 목적지 입력하면 주차장 검색 및 결제까지\n• 주차공간 걱정 없는 만차 예측 정보 제공\n\n■ 전국 시외버스, 기차, 항공 이용 시에도 카카오 T\n• 목적지 검색만으로 예매부터 결제, 발권까지 한 번에\n• KTX(코레일)부터 SRT까지 모든 기차 예매 가능\n• 항공은 국내선에 이어 국제선 예매 기능도 출시\n\n■ 안심하고 믿을 수 있는 렌터카\n• 합리적이고 믿을 수 있는 조건으로 예약부터 결제까지\n• 원하는 곳에서 대여(딜리버리)와 반납까지 (제주 지역 제외)\n\n■ 물건을 주고받을 때, 가장 쉬운 퀵·배송\n• 번거로웠던 접수를 안심하고 간편하게 T앱에서\n• 거절없이 정해진 시간 안에, 합리적 요금으로\n\n■ 댕냥이의 외출이 편해지는, 카카오 T 펫\n• 동물보호교육을 받은 메이트님과 함께하는 반려동물과의 편안하게 이동\n• 서울/경기/인천 지역에서 서비스 가능\n\n■ 카오너들을 위한 마이카 탭\n• 대리, 주차\n• 실시간 교통 정보 기반 빠르고 정확한 길 안내, 내비\n• 원하는 장소와 시간에 맞춰 부르는 방문세차와 방문정비 \n• 현금 결제, 대기 시간 없이 스마트한 발레 서비스 (카카오내비를 통해 이용)\n• 내차 정보를 확인하고 현재 시세를 알아보는 내차팔기\n\n■ 장거리 이동을 위한 여행 탭\n• 시외버스, 기차, 항공\n• 직접 만든 노선으로 대절 및 결제 가능한 셔틀\n• 해외에서도 편리한 택시 호출 (일본, 베트남에서 이용 가능)\n\n■ 일하는 사람들을 위한 카카오 T 비즈니스\n• 택시, 대리, 통근 셔틀 등 업무용 이동은 기본\n• 간편하고 스마트한 퀵·배송 접수 \n\n■ 더 간편한 결제, 카카오 T 포인트\n• 카드 등록 한 번으로, 모든 서비스 이용 요금 결제\n• 카카오 T 앱에서 사용과 선물이 가능한 카카오 T 포인트 (일부 서비스 전용)\n• 카카오 T 포인트 타운에서 포인트 적립을 위한 다양한 기회 제공\n\n※ 사용자는 카카오 T의 원활한 이용을 위해 아래의 권한을 허용할 수 있습니다. 각 권한은 그 속성 에 따라 반드시 허용해야 하는 필수 권한과 선택적으로 허용이 가능한 선택 권한으로 나뉩니다.\n\n1. 필수 허용 권한\n1) 위치: 출발지 및 목적지 설정에 사용됩니다.\n\n2. 선택 허용 권한\n1) 알림: 카카오 T에서 제공하는 각종 알림을 수신하기 위해 필요한 권한입니다.\n2) 마이크: 음성 인식을 활용하여 출발지 및 도착지를 설정할 때 사용됩니다.\n3) 카메라: QR코드 인식 및 기타 고객 제보 시 사용됩니다.\n4) 사진: 저장된 호출 상품의 정보를 읽어오는데 사용됩니다.\n5) 블루투스: 바이크 상품 이용 시 휴대폰과 바이크를 연결하는데 사용됩니다.\n6) 연락처: 상품 이용 시 전화번호 저장에 사용됩니다.\n\n※ 선택 접근 권한은 동의하지 않아도 서비스를 이용할 수 있습니다.\n※ 휴대폰 설정 > 앱 > 카카오 T 에서 접근 권한을 변경할 수 있습니다.",
                    genres: ["여행"],
                    price: 0.00,
                    trackName: "카카오 T - 택시, 대리, 주차, 바이크, 항공, 퀵",
                    trackId: 981110422,
                    version: "6.22.0",
                    currentVersionReleaseDate: "2015-04-02T01:04:53Z",
                    releaseNotes: "[업데이트] \n1. 카카오 T에 커뮤니티가? '지금여기' 베타 오픈! \n- 내 주변 또는 목적지의 이야기가 궁금하신가요? \n- 그 곳에 있는 사람들과 실시간 이야기를 나눠보세요! \n2. 새로워진 '여행탭'에서 이동부터 놀거리까지 한 번에!\n- 카카오 T에서만 만나볼 수 있는 특별한 경험하러 가볼까요? \n3. 카카오 T 렌터카 '카셰어링' 서비스 지역 확대 \n- 이제 전국 곳곳에서 카셰어링을 이용할 수 있어요. \n- 선택할 수 있는 차가 더 다양해졌어요. 어떤 차를 타볼까요?\n4. 더 편리해진 카카오 T 퀵.배송 화면 개선\n- 차량과 물품 크기 선택이 더 쉬워졌어요.\n- 매번 동일한 내용을 입력하지 않고 원터치로 접수 해보세요.")
