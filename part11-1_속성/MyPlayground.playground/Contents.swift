class Dog {
    var name : String
    var weight : Int
    init(name: String, weight: Int) {
        self.name = name
        self.weight = weight
    }
    func sit(){
        print("\(self.name)이 앉아있습니다.")
    }
}
var bori = Dog(name: "보리", weight: 10)

class Person {
    var height : Double
    var weight : Double
    init(height: Double, weight: Double) {
        self.height = height
        self.weight = weight
    }
    func calculateBMI() -> Double{
        let bmi = weight / (height * height) * 10000
        return bmi
    }
}
let a = Person(height: 160, weight: 60)
a.calculateBMI()

class Person1 {
    var height : Double
    var weight : Double
    init(height: Double, weight: Double) {
        self.height = height
        self.weight = weight
    }
    var bmi : Double{
        var result = weight / (height * height) * 10000
        return result
    }
}
let b = Person1(height: 160, weight: 60)
b.bmi


func sum(_ a: Int, _ b: Int) -> Int{
    var c = a + b
    return c
}

var x = sum(3, 4)

class Person2 {
    var birth : Int = 0
    func getAge() -> Int{
        return 2024 - birth
    }
    func setAge(_ age : Int) {
        self.birth = 2024 - age
    }
}
var p1 = Person2()

p1.birth = 2000
p1.getAge()
p1.setAge(25)
p1.birth


class BMI {
    var name : String = "홍길동"
    var height : Double = 0.0
    var weight : Double = 0.0
    
    var bmi : Double {
        get{
            let result = weight / (height * height ) * 10000
            return result
        }
        set{
            
        }
    }
}
// 95강 - 계산 속성
class MyComProperty {
    private var _myValue = 0
    var myValue: Int {
        set{
            _myValue = newValue > 100 ? 100 : newValue
        } get {
            return _myValue
        }
    }
}

var myComProperty = MyComProperty()
myComProperty.myValue = 100
print("myValue: \(myComProperty.myValue)")
myComProperty.myValue = 200
print("myValue: \(myComProperty.myValue)")

class Bug {
    static var species : String = "Bug"
    var name : String
    var cm : Double
    init(name: String, cm: Double) {
        self.name = name
        self.cm = cm
    }
}
var bug = Bug(name: "벌레", cm: 8.1)
Bug.species
bug.cm
bug.name

//98강 - 저장타입속성
class Car { //예를 들어 자동차는 어떤 종류의 차라도 바퀴는 4개로 고정이다.
    static let numberOfWheels = 4
    var brand: String

    init(brand: String) {
        self.brand = brand
    }
}

let car1 = Car(brand: "Toyota")
let car2 = Car(brand: "Honda")

print(Car.numberOfWheels)  // 출력: 4
//99강 - 계산타입속성
struct Circle {
    static let pi = 3.14
    var radius: Double

    // 계산 타입 속성
    static var diameter: Double {
        return 2 * pi
    }

    // 계산된 속성
    var circumference: Double {
        return Circle.diameter * radius
    }
}

let smallCircle = Circle(radius: 5.0)
print(smallCircle.circumference)  // 출력: 31.4
//99강
class Profile {
    var name : String = "홍길동"
    var statusMessage : String = " " {
        willSet{
            print("한줄 소개가 \(statusMessage) 에서 \(newValue) 로 변경될 예정입니다.")
        }
        didSet{
            print("한줄 소개가 \(oldValue) 에서 \(statusMessage) 로 변경되었습니다.")
        }
    }
}
var p10 = Profile()
p10.statusMessage = "반갑습니다"
//100강
class Lion {
    var name : String
    var weight : Double
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
    func changeName(newName name : String) {
        self.name = name
    }
    //오버로딩
    func changeName() {
        print("asdas")
    }
}
var lionKing = Lion(name: "라이언", weight: 100.0)

lionKing.changeName(newName: "asd")
print(lionKing.name)
struct Matrix {
    var data = [["0","1", "2"], ["3", "4", "5"]]
    subscript(row: Int, col: Int) -> String {
        if row > 3 || col > 3 {
            return "값이 없습니다."
        }
        return data[row][col]
    }
}
var tax = Matrix()
tax[0, 1]


struct MyArray {
    private var elements: [Int]
    
    init(_ elements: [Int]) {
        self.elements = elements
    }
    
    subscript(index: Int) -> Int {
        get {
            return elements[index]
        }
        set(newValue) {
            elements[index] = newValue
        }
    }
}

var myArray = MyArray([1, 2, 3])
print(myArray[1]) // 출력: 2

myArray[1] = 10
print(myArray[1]) // 출력: 10
