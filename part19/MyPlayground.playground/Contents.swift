import UIKit
//MARK: - 156강
class Point {
//  var refCount : Int 컴파일이 되면 실제로 레퍼런스 카운드를 생성한다. RC를 세기 위해
    var x : Double
    var y : Double
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    func draw(){
        
    }
}
let p1 = Point(x: 0, y: 0)      //여기서 refCount 가 1 올라간다.
let p2 = p1                     //여기서 메모리 주소를 복사해서 닮을 때 2 로 올라간다.
//retain(p2)                    p2가 가리키는 RC 를 올리는 코드가 retain    자동으로 들어가는데 이걸 직접적으로 입력하는 방식이 MRC 모델이다.
p2.x = 5
//release(p1)                   RC 가 1
//release(p2)                   RC 가 0 으로 되고 Heap 메모리 구조에서 사라진다.
//class Dog {
//    var name : String
//    var weight : Double
//    init(name: String, weight: Double) {
//        self.name = name
//        self.weight = weight
//    }
//    deinit {
//        print("\(name) 메모리 관리 해제")
//    }
//}
//var choco : Dog? = Dog(name: "초코", weight: 10.0)        //retain(choco) = RC : 1
//var bori : Dog? = Dog(name: "보리", weight: 9.0)          //retain(bori)  = RC : 1
//choco = nil //RC(0)
////release(choco)        이론적으로 이런게 있다 컴파일러가
//bori = nil  //RC(0)
//release(bori)
//MARK: - 157강
class Dog {
    var name : String
    var owner : Person?     //weak 키워드를 붙이면 약한 참조(옵셔널필수)
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) 메모리 해제")
    }
}
class Person {
    var name : String
    var pet : Dog?          //weak 키워드를 붙이면 약한 참조(옵셔널필수)
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) 메모리 해제")
    }
}
var bori : Dog? = Dog(name: "보리")
var gildong : Person? = Person(name: "길동")
bori?.owner = gildong
gildong?.pet = bori
//강한 참조가 일어남 (Strong Reference Cycle) 일어남
bori = nil
gildong = nil
//아래와 같이 선언하면 메모리 해제가 가능해진다.
//bori?.owner = nil
//gildong?.pet = nil
//bori = nil
//owner 를 weak 약한 참조로 선언 후 bori = nil 로 할당 할 경우에 보리만 nil 로 되는 것이 아니라 gildong?.pet?.owner 초기화가 된다
//owner 를 unowned 비소유 참조로 선언 후 bori?.owner = nil 로 할당 할 경우에 gildong = nil 로 초기화가 되지 않아서 gildong = nil 로 재설정을 해줘야 한다.

class Dog1 {
    var name : String
    unowned var owner : Person?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) 메모리 해제")
    }
}
class Person1 {
    var name : String
    unowned var pet : Dog?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) 메모리 해제")
    }
}
var bori1 : Dog1? = Dog1(name: "보리")
var gildong1 : Person1? = Person1(name: "길동")
// nil로 설정하고 접근하면 ===> 에러 발생

// 1) 에러발생하는 케이스
//gildong1 = nil
//bori1?.owner   // nil로 초기화 되지 않음 에러 발생

// 2) 에러가 발생하지 않게 하려면
//gildong1 = nil
//bori1?.owner = nil      // 에러 발생하지 않게 하려면, nil로 재설정 필요 ⭐️
//bori1?.owner
//MARK: - 158강
var num = 1
let valueCaptureClosure = {
    print("밸류값 출력(캡처): \(num)")
}

num = 7
valueCaptureClosure()   // 몇을 출력할까요?

// 밸류타입의 참조(메모리주소)를 캡처함
// (즉, 값 자체를 복사해서 가지고 있는 것이 아니고, num의 주소를 캡처해서 계속 사용)

num = 2
valueCaptureClosure()

num = 3
let valueCaptureListClosure = { [num] in      // 캡처리스트에서 밸류(value) 타입 캡처 제일 최근에 선언된 외부변수의 영향을 받음
    print("밸류값 출력(캡처리스트): \(num)")
}

num = 7
num = 4
num = 2
valueCaptureListClosure()

// (즉, 값 자체를 복사해서 가지고 계속 사용)
// 즉, 값 타입에서는 참조하는 값의 변경을 방지(외부적인 요인에 의한)하고 사용하고자 할때, 사용
//MARK: - 159강
class SomeClass {
    var num = 0
}

var x = SomeClass()
var y = SomeClass()

print("참조 초기값(시작값):", x.num, y.num)

let refTypeCapture = { [x] in
    print("참조 출력값(캡처리스트):", x.num, y.num)
}
/**============================================
  x - (참조타입) 주소값 캡처, x를 직접참조로 가르킴
  y - 변수를 캡처해서, y변수를 가르킴(간접적으로 y도 동일)
==============================================**/

x.num = 1
y.num = 1

//x = SomeClass()
//y = SomeClass()

print("참조 초기값(숫자변경후):", x.num, y.num)      // 1, 1

refTypeCapture()                                // 1, 1     (Not) 0, 1

print("참조 초기값(클로저실행후):", x.num, y.num)     // 1, 1

