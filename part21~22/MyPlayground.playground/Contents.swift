import UIKit
import Foundation
//MARK: - 183강
var num1 = 10
var num2 = 20
//두 숫자를 스왑하는 함수
func swapInt(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}
swapInt(&num1, &num2)
print(num1)
print(num2)
//만악 이런식으로 스왑하는 함수(혹은 내부 구현만 동일하고 타입만 다를 때)를 만들 때 타입별로 모든 경우를 정의해줘야 한다 매우 불편하다 할일이 많아진다
func swapDouble(_ a: inout Double, _ b: inout Double) {
    let tempA = a
    a = b
    b = tempA
}
//제네릭을 사용하게 되면 함수를 하나만 구현을 하면 내부에 있는 타입은 언제든지 바꿔서 사용할 수 있다. (클래스, 열거형, 구조체에서도 사용할 수 있다. 뒤에서 다룬다.)
func swapGeneric<T>(_ a: inout T, _ b: inout T) {       //관습적으로 T 를 많이 사용한다(Type을 의미) 아무렇게나 사용해도 오류가 생기지 않는다. <> 를 타입파라미터라고 부르는데 꼭 선언해줘야 한다.
    let tempA = a
    a = b
    b = tempA
}
swapGeneric(&num1, &num2) //  위에 선언된 T 는 실제 함수 호출 시 실제 타입으로 치환된다






//MARK: - 184강
//클래스, 구조체, 열거형 뒤에 타입파라미터<T> 를 선언해주면 , 제네릭 타입으로 선언됨
//속성의 자료형, 메서드의 파라미터형식, 리턴형을 타입 파라미터로 대체 가능하다.
struct Member {
    var members : [String] = []
}
struct MemberGeneric<T> {       //클래스와 구조체 동일하게 선언이 가능하다
    var members : [T] = []
//    func doSomething(a: T) -> T {       //이런식으로 리턴형을 타입 파라미터로 대체 가능하다
//        return a
//    }
    
}
//아래와 같이 여러가지 타입을 담을 수 있다.
let genenricInt = MemberGeneric(members: [1,2,3,4,5])
let genericDouble = MemberGeneric(members: [1.0,2.0,3.0])
let genericString = MemberGeneric(members: ["asdas", "asd1dsa"])

enum Pet<T> {       //열거형의 경우 연관값에만 제네릭을 사용할 수 있다.
    case dog
    case cat
    case etc(T)
}
let animal = Pet.etc("고슴도치")
let animalAge = Pet.etc(2)
//제네릭 구조체의 확장
struct Coordinates<T> {
    var x: T
    var y: T
}
extension Coordinates {     // 확장에선 <T> 타입파라미터를 쓸 경우 컴파일러가 에러라고 띄워준다. 구조체의 본체에서만 플레이스홀더 정의가 가능하다
    func getPlace() -> (T, T){
        return (x, y)
    }
}
let place = Coordinates(x: 5, y: 5)
print(place.getPlace())
//where 절을 추가할 수 있는데, 아래 확장의 경우 타입이 정수형일때만, 실행이 된다.
extension Coordinates where T == Int {
    func getIntArray() -> [T]{
        return [x,y]
    }
}
let place1 = Coordinates(x: 3, y: 5)        //만약 x or y 가 다른 타입으로 하게 될 경우 확장이 적용되지 않아 getIntArray()를 사용할 수 없다.
place1.getIntArray()

//제네릭에서 타입을 제약할 수 있음
//타입 매개 변수 뒤에 콜론으로 프로토콜 제약 조건 또는 단일 클래스 제약 가능, Equatable 프로토콜이 뭔지는 중요하지 않다.
func findIndex<T: Equatable>(item: T, array: [T]) -> Int? { //프로토콜을 채택한 타입만 이 함수에서 타입으로 작동할 수 있다 라는 의미이다.
    for (index, value) in array.enumerated() {
        if item == value {
            return index
        }
    }
    return nil
}
findIndex(item: 5, array: [1,5,6,2])        //index를 리턴해주는 함수인데, 1번째에 5가 있으니까 1을 리턴한다. 없으면 nil 을 리턴한다.

let aNumber = 5
let someArray = [1,2,5]

if let index = findIndex(item: aNumber, array: someArray) {
    print("밸류값과 같은 인덱스 \(index)")
}
//클래스의 제약 예시
class Person {}
class Student : Person {}
class Adult {}

let person = Person()
let student = Student()
let adult = Adult()

func personClassOnly<T: Person>(array: [T]) {
    
}
//아래의 경우 student 는 person 을 상속받기 때문에, person 타입만 사용할 수 있는 제약을 걸어놓았지만, 사용할 수 있다.
personClassOnly(array: [person, student])
personClassOnly(array: [person, person])
personClassOnly(array: [student, student])
personClassOnly(array: [Person(), Student()])
//personClassOnly(array: [person, adult])

//항상 제네릭을 적용시킨 함수를 실행하게만 하면, 또 다른 불편함이 생기지 않나? -> 구체/특정화 함수 구현도 가능하다.
//동일한 이름의 제네릭 함수가 존재하더라도, 구체적인 타입을 명시하면 해당 구체적인 타입의 함수를 실행할 수 있다

func findIndex(item: String, array: [String]) -> Int? { //문자열의 경우, 대소문자를 무시하고 비교하고 싶어서 아래와 같이 구현가능하다
    for (index, value) in array.enumerated() {
        if item.caseInsensitiveCompare(value) == .orderedSame {
            return index
        }
    }
    return nil
}
let aString = "jobs"
let someStringArray = ["Jobs", "Musk"]
if let index2 = findIndex(item: aString, array: someStringArray) {
    print("문자열의 비교 :", index2)
}
//그래서 항상 굳이 Generic이 적용되게 할 필요는 없다.





//MARK: - 185강
protocol RemoteControl {    //프로토콜의 경우 선언할 때 타입파라미터를 사용하지 않고 아래처럼
    associatedtype T       //associatedtype(연관타입) 이라고 선언해야 된다. (연관형식은 대문자로 시작해야한다.) 관습적으로 Element로 사용하고 있다.
    //associatedtype Element : Equatable <Element : Equatable>// 제약 조건을 추가해서 Equatable 프로토콜을 채택한 타입만 정의할 수 있다.
    func changeChannel(to: T)
    func alert() -> T?
}
struct TV : RemoteControl {
    //프로토콜에서 선언한 연관타입을 채택한 구조체는 어떤타입을 쓸껀지 언급을 해줘야 하는데,
    typealias T = Int       //선언을 할지 말지는 자유이지만, 선언하지 않았을 경우
    func changeChannel(to: T) {
        print("TV 채널 바꿈 : \(to)")
    }
    func alert() -> T? {      //반환할때의 타입을 제대로 명시해줘야 한다.
        return 1              //지금같은 경우엔 1을 리턴하기 때문에 T를 명시하지 않았을 경우 Int? 타입으로 바꿔야한다.
    }
}
//MARK: - 186강
//기존의 에러처리 방법
enum HeightError : Error {
    case maxHeight
    case minHeight
}

func checkingHeight(height: Int) throws -> Bool {
    if height > 190 {
        throw HeightError.maxHeight
    }
    if height < 130 {
        throw HeightError.minHeight
    } else {
        if height >= 160 {
            return true
        } else {
            return false
        }
    }
}

do {
    let _ = try checkingHeight(height: 200)
    print("놀이기구 탑승 가능")
} catch {
    print("놀이기구 탑승 불가능")
}
//Result Type 에는 성공/실패 했을 경우에 대한 정보가 들어있다
//Result Type 도입한 에러문
func resultTypeCheckingHeight(height: Int) -> Result<Bool, HeightError> {       //참일때의 리턴타입과 거짓일때의 리턴타입 throws 가 없다.
    if height > 190 {
        return Result.failure(HeightError.maxHeight)
    } else if height < 130 {
        return Result.failure(HeightError.minHeight)
    } else {
        if height >= 160 {
            return Result.success(true)
        } else {
            return Result.success(false)
        }
    }
}
let result = resultTypeCheckingHeight(height: 200)      //기존과 다르게 throws 가 없기 때문에 try 를 쓸 필요가 없다.
//결과를 처리하는 것이 간결해진다.
switch result {
case .success(let data):
    print("결과값은 \(data) 입니다.")
case .failure(let error):
    print(error)
}
