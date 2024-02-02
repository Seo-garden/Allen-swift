import Foundation
protocol CanFly {       //구체적인 표현을 하지 않는다.
    func canfly()       //이런 메서드를 구현해야 한다라는 뜻의 요구사항이다. 헤드부분(함수 선언 후 리턴타입까지가 헤드부분이다.)
}
class canfly{
    func canfly() {
        
    }
}
class canfly2 : canfly, CanFly {        //프로토콜과 상위클래스를 채택하고, 상속받을 때 클래스를 먼저 상속하고, 프로토콜을 채택한다.
    override func canfly() {            //채택을 했으면, 무조건 구현해야 한다.
        print("asd")
    }
}
protocol doSomething{
    func doSomething() -> Int
}
//126강
class Familyclass{}

class Myclass : Familyclass, doSomething {
    func doSomething() -> Int {
        return 0
    }
}

protocol RemoteMouse {
    var id : String{get}
    var name : String {get set}
    static var type : String {get set}
}
struct TV : RemoteMouse {
    var id: String {        //let 으로 선언하게 될 경우
        get {
            return "안녕하세요"
        }
        set {
            
        }
    }
    var name: String = "삼성티비"
    static var type: String = "리모콘"
}
class SmartPhone : RemoteMouse {
    var id: String {
        return "777"
    }
    
    var name: String {
        get {return "삼성티비"}
        set {}
    }
    static var type: String = "리모콘" // 타입 저장 속성(static) 은 상속 시 재정의가 불가
}
class Ipad : RemoteMouse {
    var id : String = "777"
    var name : String = "아이패드"
    class var type : String {       // 타입 계산 저장 속성은 재정의 가능(class)
        get {return "아이패드"}
        set {}
    }
}
//127강
protocol RandomNumber {
    static func reset()
    func random() -> Int
//    mutating func doSomething()
}
struct Number : RandomNumber {
    var num = 0
    static func reset() {
        print("리셋")
    }
    func random() -> Int {
        return Int.random(in: 1...10)
    }
//    mutating func doSomething() {        //클래스기 때문에 mutating 할 필요 없음
//        self.num = 19
//    }
}
//128강
protocol SomeProtocol {
    init(num: Int)
}

class SomeClass : SomeProtocol {
    required convenience init(num: Int) {
        self.init()
    }
    init() {}
}
//129강
protocol Certificate {
    func doSomething()
}
class Person {
    
}
extension Person : Certificate {
    func doSomething() {
        print("Do Something")
    }
}
//130강
protocol Remote {
    func turnOn()
    func turnOff()
}
class Tv : Remote {
    func turnOn() {
        print("티비를 킨다.")
    }
    func turnOff() {
        print("티비를 끈다.")
    }
}
struct SeTopBox : Remote {
    func turnOn() {
        print("셋톱박스를 킨다.")
    }
    func turnOff() {
        print("셋톱박스를 끈다.")
    }
    func doNetflix() {
        print("넷플릭스를 본다.")
    }
}
let tv: Remote = Tv()
tv.turnOn()
tv.turnOff()

let sBox : Remote = SeTopBox()
sBox.turnOff()
sBox.turnOn()
(sBox as? SeTopBox)?.doNetflix()

let electronic : [Remote] = [tv, sBox]

for item in electronic {
    item.turnOn()
}

tv is Remote // --> 특정타입이 프로토콜을 채택하고 있는지 확인
let newBox = sBox as Remote //(업캐스팅)
newBox.turnOn()

let sBox2 = electronic[1] as? SeTopBox
sBox2?.doNetflix()
//131강
protocol Remote1 {
    func turnOn()
    func turnOff()
}
protocol AirConRemote {
    func UP()
    func DOWN()
}
protocol SuperRemote : Remote1, AirConRemote{
//    func turnOn()
//    func turnOff()
//    func UP()
//    func DOWN()
    func doSomething()
}
class HomePot : SuperRemote {
    func doSomething() {}
    func turnOn() {}
    func turnOff() {}
    func UP() {}
    func DOWN() {}
}
protocol Named {
var name : String {get}
}
protocol Aged {
var age : Int {get}
}
struct Person1 : Named, Aged{
var name : String
var age : Int
}
func wishHappyBirthday(_ celebrator : Named & Aged) {
print("생일축하해, \(celebrator.name), 넌 이제 \(celebrator.age)살이 되었구나!")
}
let birthdayPerson = Person1(name: "홍길동", age : 20)
wishHappyBirthday(birthdayPerson)
let whoIsThis : Named & Aged = birthdayPerson
//132강 예시를 들자면 이렇다. 프로토콜을 선택적으로 선언할 때는 @objc 를 붙여야 하고 클래스 전용 프로토콜이다(구조체와 열거형에선 채택 불가)
@objc protocol Myprotocol {        //@objc 는 swift 로 작성한 코드를 objective-c 코드에서도 사용할 수 있다.
    @objc optional var isOn : Bool {get set}    // 멤버 앞에는 @objc optional
    var name : String {get}
}
//133강
protocol Remote2 {
    func turnOn()
    func turnOff()
    //func throw1()
}
class TV4 : Remote2 {
    func turnOn() {
        print("킨다.")
    }
}
class TV5 : Remote2 {
    func turnOn() {
        print("티비5를 켠다.")
    }
    func throw1(){
        print("티비5를 던진다.")
    }
}
extension Remote2 {
    func turnOn(){
        print("티비를 켠다")
    }
    func turnOff(){
        print("티비를 끈다")
    }
    func throw1() {
        print("티비를 던진다")
    }
}
print("---")
var tv5 : Remote2 = TV5()
tv5.turnOn()    //
tv5.turnOff()
//직접적으로 메서드에 주소를 삽입한다.
tv5.throw1()    // TV5() 타입을 받게되면 TV5 에 있는 메서드가 실행되지만, tv5 : Remote2 = TV5() 타입을 받게 되면 프로토콜의 확장된(extension) 메서드가 출력된다
protocol Remote3 {
    func turnOn()
    func turnOff()
    
}
extension Remote3 {
    func turnOn(){
        print("리모컨 켜기")
    }
    func doAnotherAction(){
        print("리모컨 또 다른 동작")
    }
}
class Ipad1 : Remote3 {
    
    func turnOn() {
        print("아이패드 켜기")
    }
    func turnOff() {}
    func doAnotherAction(){
        print("아이패드 또 다른 동작")
    }
}
var ipad1 = Ipad1()
ipad1.turnOn()      //아이패드 켜기
ipad1.turnOff()     //
ipad1.doAnotherAction()     //아이패드 또 다른 동작
var ipad2 : Remote3 = Ipad1()
ipad2.turnOn()      //아이패드 켜기
ipad2.turnOff()     //
ipad2.doAnotherAction()     //리모컨 또 다른 동작
//134강
protocol Bluetooth {
    func blueOn()
    func blueOff()
}
extension Bluetooth where Self : Remote2 {
    func blueOn(){
        print("블루투스 켜기")
    }
    func blueOff(){
        print("블루투스 끄기")
    }
}
class SmartPhone1 : Remote2, Bluetooth {
    
}

