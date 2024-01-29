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
