//118강
class SomeType {
    
}
var a = SomeType()
a.doSomething()
extension SomeType {
    func doSomething(){
        print("do Something")
    }
}

class Person {
    var id = 0
    var name = "이름"
    var email = "1234@naver.com"
    
    func walk(){
        print("사람이 걷는다.")
    }
}
class Student : Person {
    var studentID = 1
    override func walk() {
        print("학생이 걷는다.")
    }
    func study(){
        print("학생이 공부한다.")
    }
}
extension Student {
    func play(){
        print("학생이 게임을 한다.")
    }
}
class Undergraduate : Student {
    var major = "전공"
    override func walk(){
        print("대학생이 걷는다.")
    }
    override func study(){
        print("대학생이 공부한다.")
    }
    func party(){
        print("대학생이 파티한다.")
    }
//    func play(){      //swift 에서의 확장에서 구현된 메서드는 재정의가 불가하다. 하지만 상위 extension 에 @objc 를 붙이면 재정의가 가능하다.
//        print("학생이 게임을 한다.")
//    }
}
var under = Undergraduate()
under.play()
//119강
extension Int {     //소급모델링
    var squared : Int {
        return self * self
    }
}
5.squared       //기존에 존재하는 인스턴스에다가 속성을 이용해서 구현

func squared(_ num: Int) -> Int {       //이런식으로 함수를 만드는 것보다 간단하고, 더 간결하게 만들 수 있다.
    return num * num
}
squared(5)      //함수를 실행하는 방식
//121강
extension Int {
    static func printNumberRandom(){
        for i in 1...5 {
            print(i)
        }
    }
}
Int.printNumberRandom()
//122강
struct Point {
    var x = 0.0
    var y = 0.0
    //init(x : Double, y : Double){}
    //init(){}
}
extension Point {
    init(num : Double, num1: Double){
        self.init(x: num, y: num1)      //본체의 생성자를 반드시 호출해야 한다.
    }
//    init(num : Double, num1 : Double){        //예외의 경우,
//        self.x = num
//        self.y = num1
//    }
}
struct Dohun {
    var name : String = "도훈"
    var weight : Double = 12.0
    var height : Double
}
//123강
extension Int {
    subscript(num: Int) -> Int {
        var demicalNum = 1
        for _ in 0..<num {
            demicalNum * 10
        }
        return (self/demicalNum) % 10
    }
}
//124강
class Home {
    enum Week {
        case Monday
        case Tuesday
    }
    var day : Week = .Monday
}

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind : Kind {
        switch self {
        case 0:
            return Kind.zero
        case let x where x > 0:
            return Kind.positive
        default:
            return Kind.negative
        }
    }
}
func printIntegerKinds(_ numbers : [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("-", terminator: "")
        case .zero:
            print(0, terminator: "")
        case .positive:
            print("+", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([-6, 1, 0, 0, -123, 99])
