import UIKit

class Human {
    var name : String = "asd"
    var age : Int = 8
}

class Student1 : Human{
    var grade : Int = 1
}

class Undergrate : Student1{
    var major = "asd"
}
let human : Human = Undergrate() //메모리에 저장되어 있는 저장 속성은 4개의 저장속성(class Undergrate)이다. 저장할 땐 3개만 보이도록 하는 것.
human.name
//116강
if let ppp = human as? Undergrate {
    
}
class Person {
    var id = 0
    var name = "이름"
    var email = "asd@naver.com"
    func walk(){
        print("사람이 걷는다.")
    }
}

class Student : Person {
    var studentID = 0
    override func walk() {
        print("학생이 걷는다.")
    }
    func study() {
        print("학생이 공부한다")
    }
}
class UnderGrate : Student {
    var major = "전공"
    override func walk() {
        print("대학생이 걷는다.")
    }
    override func study() {
        print("대학생이 공부한다.")
    }
    func party(){
        print("대학생이 축제한다.")
    }
}

let person1 = Person()
person1.walk()

//let student1 = Student()
let student1 : Person = Student()
student1.walk()
//student1.study()

let objArray : [Any] = [5, "안녕", 3.5, Student()]

for (index, item) in objArray.enumerated() {
    //(0, 5)
    //(1, 0.5)
    //(2, "King)
    switch item {
    case is Int:                            //item is Int
        print("index - \(index): 정수입니다.")
    case is Double:                         //let num = item as? Double if let 바인딩처럼 성공하는 경우에만 담기기 때문에 
        print("index - \(index): 실수입니다.")
    case let student as Student1:           //let student = item as Student1
        print("index - \(index) 는 사람입니다.")
    case is (String) -> String:             //item is (String) -> String
        print("index - \(index) 는 클로저입니다.")
    default:
        print("index - \(index) 는 그 외의 타입입니다.")
    }
}
