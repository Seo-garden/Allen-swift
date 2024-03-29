### 각 주차별 테스트를 진행하면서 미흡했던 개념 정리 
[playground](https://github.com/Seo-garden/Allen-swift/blob/main/%EB%B3%B5%EC%8A%B5%EB%82%B4%EC%9A%A9/MyPlayground.playground/Contents.swift)
> [!NOTE] Part4. 튜플
> 원하는 연관된 데이터의 조합으로 어떤 형태든 만들 수 있는 타입(다만, 변수를 선언과 동시에 해당 멤버(데이터의 종류 및 개수)는 결정되므로 추가/삭제 불가)

> [!Tip] 튜플을 사용하는 이유
> 함수는 원칙적으로 리턴값이 하나만 존재하기 때문에, 여러개의 값을 반환할 수 없지만, 어떤 묶음 값으로 반환하는 것은 가능하다.

> [!NOTE] Part6. 반복문의 제어 전송문
> - continue : 반복문에서 다음 주기로 넘어가서 계속함(continue)을 의미(continue를 만나면 아래의 문장들을 무시하고 싸이클로 넘어감)
> - break : 반복문을 아예 중지(break를 만나면 모든 싸이클을 중지하고 반복문을 벗어난 다음 문장으로 넘어감)

> [!NOTE] Part7. 함수
> - 함수 오버로딩 : 하나의 함수의 이름이 여러개의 함수를 대응 시킨 것 
> - API : 프로그래머가 외부 시스템과 상호 작용하는 소프트웨어를 만드는데 사용할 수 있는 명령, 함수, 규약 및 객체의 집합
> - inout : 변수 그대로를 넣었다 뺀다(원본 변수를 가리킨다)
> - 스택오버플로우 : 스택 영역의 메모리 용량을 넘어선 프로그래밍으로 인해 생기는 오류

> [!NOTE] Part8. 옵셔널
> (언래핑)옵셔널 바인딩 : 바인딩(상수나 변수를 대입)이 되는 경우만 특정 작업을 하겠다는 의미 - if let or guard let 
> (접근연산자 사용)옵셔널 체이닝 : 표현식 자체가 옵셔널의 가능성이 있다는 것을 표현. 체이닝의 결과는 항상 옵셔널(언래핑 후 사용)

> [!NOTE] Part9. Collection
> - 배열 : 데이터를 순서대로 저장
> - 딕셔너리 : 데이터를 키와 값으로 하나의 쌍으로 만들어서 관리(순서X) - 검색 속도 빠름
> - 집합 : 순서가 없는 컬렉션(요소중복저장X) - 정렬순서보다 검색속도가 중요한 경우 사용

> [!NOTE] Part10. enum
> - 열거형 : 타입 자체를 한정된 case 안에서 정의할 수 있는 타입
> - 원시값과 연관값은 동시에 선언하는 것이 불가능하다
> - @unknown : switch문에서 모든 열거형의 케이스를 다루지 않았다고 경고를 알려줘서 개발자의 실수 가능성을 컴파일 시점에서 알려줌

> [!NOTE] Part11. 클래스와 구조체
> - class : 클래스를 생성하면 데이터영역에 존재한다. 인스턴스를 생성하면 힙 영역에 인스턴스의 데이터를 찍어낸다. 인스턴스는 클래스의 메모리주소를 가리킨다. 인스턴스를 생성하면 메모리주소를 변수에 담는다.
> - struct : 구조체를 생성하면 데이터영역에 존재하는데, 인스턴스를 생성하면 스택영역에 인스턴스 데이터를 찍어낸다. 인스턴스는 구조체의 메모리 주소를 가리킨다. 인스턴스를 생성하면 메모리주소를 변수에 담는다.

> [!NOTE] Part11-1. 
> - 타입(static)
> 	- 클래스, 구조체 또는 열거형의 멤버를 정의할 때 사용.
> 	- 해당 멤버 자체에 속하며, 인스턴스가 아닌 타입 자체에 연결
> - 서브스크립트(subscript)
> 	- 클래스, 구조체 또는 열거형에서 콜렉션, 시퀀스 또는 기타 값의 요소에 접근하기 위해 사용
