class Person {      //저장속성의 기본값을 부여했기 때문에, 초기화를 하지 않아도 된다.
    var name = "이름"
    var email = "asd@naver.com"
}
class Student : Person {
    //name
    //email
    var grade = 0
}
//MARK: -  105강
class Aclass {
    func doSomething(){
        print("asdasd")
    }
}

class Bclass : Aclass {
    override func doSomething() {
        super.doSomething() // 상위에 있는 메서드를 호출
        print("asdasdasd")
    }
}

class SuperClass {
    var Value = 0
    func something(){
        print("asdasdssn")
    }
}

class SubClass : SuperClass {
    override var Value: Int {
        get{return 1}
        set(Value){super.Value = Value}
    }
}
//MARK: - 107강
class Color {
    let red : Double
    let blue : Double
    let green : Double
    //생성자도 오버로딩을 지원, 값을 초기화하는 방법은 여러가지가 있다.
    init(){
        red = 0.0
        blue = 0.0
        green = 0.0
    }
    init(white: Double) {
        red = white
        blue = white
        green = white
    }
    init(red: Double, blue: Double, green: Double) {        //이게 정석대로 초기화하는 방법이다.
        self.red = red
        self.blue = blue
        self.green = green
    }
}

struct Color1 {
    let red : Double
    let blue : Double
    let green : Double
    
    init(red: Double, blue: Double, green: Double) {        //구조체는 따로 이니셜라이저를 구현하지 않아도 된다. 알아서 된다
        self.red = red
        self.blue = blue
        self.green = green
    }
}
// MARK: - 109강
class Dog {
    var name : String
    var weight : Int
    
    init(name: String, weight: Int) {
        self.name = name
        self.weight = weight
    }
}

class Kingyul : Dog {
    convenience init(name : String) {       //편의생성자로 몸무게를 10으로 지정했다.
        self.init(name: name, weight: 10)
    }
}
var kingyul = Kingyul(name: "미친킹율강아지")
kingyul.name
kingyul.weight

class A {
    var x : Int
    var y : Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    convenience init(){
        self.init(x: 0, y: 0)
    }
}

class B : A {
    var z : Int
    init(x : Int, y : Int, z : Int) {
        self.z = z      //필수
        super.init(x: x, y: y)//필수 상위생성자 호출 생략하면 오류가 뜸
    }
}

class X {
    var x = 0 //init() {}
}
class Y : X {
    var y: Int
    override init() {
        self.y = 0
        super.init()
    }
}
class Z : Y {
    var z : Int
    override convenience init() {
        self.init(z: 12)
//      super.init() 생략을 해도 상관은 없다
    }
    init(z: Int) {
        self.z = z
        super.init()
    }
}
//MARK: - 111강
class Food{
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init(){
        self.init(name: "없음")
    }
}

class Recipe : Food {
    var quantity : Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String){
        self.init(name: name, quantity: 1)
    }
}
var kimchi = Recipe()
kimchi.name
kimchi.quantity
//MARK: - 112강
class XClass {
    var x = 0
    var y = 0
    deinit{
        print("인스턴스 소멸 예정")
    }
}
var x : XClass? = XClass()
x = nil
//MARK: -
