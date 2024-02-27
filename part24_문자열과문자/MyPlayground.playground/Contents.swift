import UIKit
import Foundation
//MARK: - 195강
var someString = "Some swift"

for code in someString.unicodeScalars {
    print(code.value, terminator: " ")
}

var hangeul1 = "\u{D55C}"
print("한의 글자수", hangeul1.count)

var nsString : NSString = "Swift"
let string : String = nsString as String

nsString.length     //유니코드 기반
string.count        //의미 글자수 기반
//MARK: - 196강
let stringLineString = "what the \nhell"
print("\(stringLineString)")
//여러줄을 입력하고 싶을 때
//문자열 그대로 들어간다.
let quotation = 
"""
    \"one two three four five

six seven eight nine ten\"
"""
print("\(quotation)")
//# 을 rawString 으로 확장 구분자라고 하는데, 특수기호를 편하게 입력할 수 있다.
var name = #"Steve"#
print(name)
//MARK: - 197강
let Name = "유나"
print("있지 유고걸 \(Name)")
//문자열 내에서 \()은 어떻게 동작할까?
struct Dog {
    var name : String
    var weight : Double
}
let dog = Dog(name: "초코", weight: 15.0)
//셋다 다르게 출력이 된다.
dump("\(dog)")  //메모리 구조상 어떻게 이루어져 있는지를 출력한다.
dump(dog)
print(dog)      //print("\(dog)")와 동일하다.

//protocol CustomStringConvertible {
//  var description : String
//}

extension Dog : CustomStringConvertible {       //swift 4점대 버전은 이렇게 사용했다.
    var description: String {
        return "강아지의 이름은 \(name), 몸무게는 \(weight)kg 입니다."
    }
}
//swift 5 에서 변경
struct Point {
    var x : Int
    var y : Int
}

let point = Point(x: 5, y: 3)
print("\(point)")

extension String.StringInterpolation {      //swift5 는 이런식으로 모아서 메서드를 구현해놓으면 호출되면서 사용한다.
    mutating func appendInterpolation(_ value : Point, style: NumberFormatter) {    //필요하면 검색해서 사용하거나 복붙해서 사용한다. 외우지 않아도 된다.
        let formatter = NumberFormatter()
        formatter.numberStyle
        appendInterpolation("x좌표 \(value.x), y좌표 \(value.y)")
    }
    mutating func appendInterpolation(_ value : Dog, style: NumberFormatter) {
        appendInterpolation("강아지의 몸무게는 \(value.weight), 강아지의 이름은 \(value.name)")
    }
}
print("\(point)")
