import Foundation
import UIKit
//MARK: - Part3. switch
var number = Int.random(in: 1...10)
switch number {
case 0...3:
    print("0~3")
case 4...7:
    print("4~7")
default:
    break       //원래 한번만 돌아가는 switch문이지만 default블록에 뭐라도 써줘야 하기 때문에 break를 썼다
}
//MARK: - Part4. 튜플
let iOS = ("Swift", 5.0)        //타입을 굳이 선언하지 않아도 되고 다양한 타입을 동시에 선언이 가능하다
let (name, age, address) = ("홍길동", 20, "대구")

var coordinate = (0,5)
switch coordinate {
case (let distance, 0):   // x축이나 y축에 있으면 출력하라는 코드
    print("X축 위에 위치하며, \(distance)만큼의 거리가 떨어져 있음")
case (0, let distance):
    print("Y축 위에 위치하며, \(distance)만큼의 거리가 떨어져 있음")
default:
    print("축 위에 있지 않음")
}
//MARK: - Part6. 반복문
for num in 1...10 {
    print(num)
    if num >= 8 {
        break       //num이 8이상이면 반복문을 탈출한다.
    }
}
for num in 1...10 {
    if num % 2 == 0 {
        continue      //num을 2로 나누었을 때 나머지가 0이 나오면 건너뛰고 다음반복문 실행
    }
    print(num)
}
// MARK: - Part7. 오버로딩
func add() {}
func add(a: Int, b: Int){}
func add(d: Double, e: Double){}        //함수의 이름은 같지만, 파라미터를 바꾸기만 해도 새로 사용할 수 있다.
// MARK: - Part7. inout
func swapNumbers(a:inout Int, b: inout Int){ //변수의 위치를 바꿔야 할 때, 사용하고 파라미터의 복사본이 전달되는 것이 아니라 원본이 전달
    var temp = a
    a = b
    b = temp
}
// MARK: - Part8. Optional
var str: String? = "hello"
func doSomeTHing(){
    guard let s = str else {return}     //guard let 바인딩을 가장 많이 쓴다.
    print(s)
}
class Dog {
    var name: String?
    var weight: Int
    
    init(name: String, weight: Int) {
        self.name = name
        self.weight = weight
    }
    
    func sit() {
        print("\(self.name)가 앉았습니다.")
    }
    
    func layDown() {
        print("누웠습니다.")
    }
}
var bori: Dog? = Dog(name: "보리", weight: 20)
bori?.layDown()          // ⭐️ 앞의 타입이 옵셔널이라고 해서 메서드가 실행이 안되는 것은 아님
bori?.sit()              // Optional("보리")가 앉았습니다.
// MARK: - Part9. Collection
let array = [1,2,3,4,5] // 동일한 데이터 타입만 넣을 수 있다. 선언 시 값을 바로 넣을꺼면 타입을 따로 선언하지 않아도 되지만
let array1 : [Int] = [] // 값을 넣지않고 선언할 경우 Array<Int> 라고 알려줘야 함. Array<Int> 와 [Int]는 동일하다.
let dictionary : [String: String] = ["A" : "Apple"]
let set : Set<Int> = [1,2,3]    //얘는 값을 넣지 않고 선언을 할 때도, 타입을 꼭 선언해줘야 한다.
// MARK: - Part10. 열거형(enum)
enum Week : Int {        // 열거형에 타입을 넣으면 원시값을 가진 열거형
    case monday             // monday 부터 0을 넣고 차례대로 값이 들어간다. rawValue 값으로 확인할 수 있다.
    case tuesday            // 1
    case wednesday
    case thursday
    case friday
}
var week = Week.friday   // var week : Week = .friday 동일하다.
week.rawValue            // week 변수의 원시값에 접근할 수 있다.
enum SomeEnum {
    case left
    case right
}
var someEnum : SomeEnum? = .left
switch someEnum {
case .left:
    print("좌회전")
case .right:
    print("우회전")
case nil:
    print("직진")     //옵셔널 타입이기 때문에 값이 있을수도 있고 없을수도 있어서 nil을 넣어주거나, .none 을 선언해줘야 한다.
}

enum Fruits {
    case apple(price: Int, weight : Double) // 열거형에 연관값을 넣은 열거형
}
var apple : Fruits = .apple(price: 1000, weight: 0.3)
// MARK: - Part11. 클래스와 구조체
class Animal {      //현재 클래스는 데이터 영역에 존재한다.
    var name = "강아지"
    var weight = 0
    func sit(){
        print("앉았습니다.")
    }
    func layDown(){
        print("누웠습니다.")
    }
}
var mari = Animal()     //Animal 클래스의 주소를 가리킨다.이 메모리 주소를 mari 에 담는다. mari 는 스택영역에 생기고, Animal 이 실제 데이터는 힙의 영역에 만든다. 힙의 영역에 메모리 주소를 mari라는 변수에 담는다. mari는 Animal 데이터의 메모리 주소를 담고 있다
struct Bird {
    var name = "새"
    var weight = 0
    func fly(){
        print("날았습니다.")
    }
}
var abird = Bird()
abird.name = "비둘기"
var bbird = abird
bbird.name = "비둘기 2호"
abird.name      //구조체의 경우 값을 복사하기 때문에 비둘기, 비둘기 2호가 출력되지만
bbird.name      //클래스로 바꾸고 실행할 경우 메모리주소를 복사하기 때문에 둘디 비둘기 2호가 출력된다.
// MARK: - Part11-1. 속성
class MyClass {
    static var staticProperty: Int = 0
    static func staticMethod() {
        print("이것은 스태틱 메서드이다.")
    }
}
// 정적 프로퍼티 및 메서드는 클래스 자체에 속하므로 인스턴스를 생성하지 않고 바로 접근 가능합니다.
print(MyClass.staticProperty) // 0
MyClass.staticMethod() // 클래스 자체의 타입
// MARK: - Part11.1 서브스크립트
class SomeData {
    var datas = ["A", "B", "C"]
    subscript(index: Int) -> String {
        get {
            return datas[index]
        }
    }
}
// MARK: - Part11.1 싱글톤패턴
class DataManager {
    static let shared = DataManager()       //유일하게 한개만
    private init(){}                        //외부에서 또 다른 객체의 생성을 막고 싶을 때 선언
}
// MARK: - Part12 클래스의 상속과 초기화
class Cat {
    var name : String
    var weight : Double
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
}

struct CAT {
    var name : String = "야옹1"       //지정생성자로 초기화하지 않고 값을 할당할 경우
    var weight : Double = 1.0        //
}
var cat = CAT(weight: 2.2)          //구조체에선 멤버와이즈 이니셜라이저를 사용할 수 있다. (단, 지정생성자로 초기화 할 경우 사용X)
