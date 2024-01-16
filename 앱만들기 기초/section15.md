# 앱만들기 기초

🌕 #colorLiteral() 굳이 rgb 를 입력하지 않고 색상을 지정할 수 있다.
🌕 #imageLiteral()

    프레임워크 : 개발자가 이미 짜여진 룰을 따라 작업을 하는 것
    라이브러리 : 미리 만들어놓는 필요부분을 사용하는 것
    
🌕 공통점 : 프로그램을 효율적으로(빨리) 만들기 위해, 다른 사람이 만들어 놓은 코드를 사용하는 것

4 Layer

    Cocoa Touch Framework 앱개발 기초 / 필수적인 기능 등
    Media Framework 다양한 미디어 기능 필요 기능 등
    Core Services Framework 시스템 서비스 제공 데이터 접근 등
    Core OS Framework 보안 / 하드웨어 연동 등

🌕 아이폰 혹은 아이패드 마다 기기별 크기가 각각 다르다. 그래서 어떤 기종에선 짤리고, 어떤 기종에선 너무 떨어져 보일 수 있는데, 이를 방지하기 위해 constraint 를 잘 설정해줘야 한다.

🌕 여러개의 오브젝트를 넣고 하나로 합쳐서 사용하고 싶을 때 Stack View를 사용하면 하나의 오브젝트로 합쳐진다.

🌕 하나의 함수로 여러개의 버튼동작을 수행할 수 있다.

🌕 readLine() 으로 입력을 받게 되면 String? 타입으로 받는다.

🌕 Button 에 있는 값 sender 를 가져 올땐 .currentTitle 을 사용해야 한다.
