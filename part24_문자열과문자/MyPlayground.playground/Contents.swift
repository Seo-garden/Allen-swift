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


//MARK: - 198강
var string1 : String = ""
var pi : Double = 3.1415926
string1 = String(3.1415926)
print(string1)
string1 = String(format: "%.3f", pi)      //(변환하고 싶은 형식, 변환하고 싶은 변수 혹은 상수) 반올림 해준다.
print(string1)

var swift = "Swift"
string1 = String(format: "Hello, %1$@", swift)      //1$ 를 사용하면 첫번째 파라미터를 의미하는데, 지금같은 경우는 파라미터가 하나밖에 없지만, 파라미터를 여러개 사용할 경우에 사용한다. 외울 필요 없고 구글링해서 찾아서 쓰면 된다.
print(string1)

let numberFormatter = NumberFormatter()
numberFormatter.roundingMode = .floor       //버림으로 지정
numberFormatter.maximumFractionDigits = 3   //최대자릿수

let value = 3.1415926
var valueFormatted = numberFormatter.string(for: value)!
print(valueFormatted)
//세자리수 마다 콤마 넣기
numberFormatter.numberStyle = .decimal
let price = 10000000
let result = numberFormatter.string(for:price)!
print(result)


//MARK: - 199강
var greeting = "Hello, World"
let index : String.Index = greeting.firstIndex(of: ",") ?? greeting.endIndex        //콤마의 인덱스
let beginning = greeting[..<index]      //처음부터 인덱스까지
//prefix 메서드 사용시
//beginning 은 greeting 메모리 공간을 가리킨다
//스위프트 내부적으로 최적화가 되어있다.
//수정 등이 일어날 때 까지 메모리 공유
var word : String.SubSequence = greeting.prefix(5)


//MARK: - 200강
//1. 문자열 자체도, 여러개의 문자를 담고 있는 데이터이기 때문에 쉽게 배열로 변형이 가능하고, 반대 변형도 쉬움
var someString2 = "Swift"
//2. 문자열을 문자열 배열화 하기, 일반적으로 이렇게 쓴다.
var array = someString2.map { String($0) } //문자열에도 고차함수가 포함되어 있다
print(array)
//3. 문자열을 문자 배열화 하기
var array2 = Array(someString2)     //[Character]
//4. 문자열 배열 [String] --> 문자열
var newString = array.joined()

someString = "Swift"

var newString2 = String(someString.shuffled())
print(newString2)
//map 고차함수를 사용해서 변환하는데 이런 경우로 사용하는 케이스가 더 많다.
newString2 = newString2.map{String($0)}.shuffled().joined()


//MARK: - 201강
var string2 = "swift"
string2.lowercased()        //전체 소문자로 바꾼 문자열 리턴
string2.uppercased()        //전체 대문자로 바꾼 문자열 리턴

string2.capitalized         //대문자로 시작하는 글자로 리턴하는 속성

var emptyString = " "

emptyString.count       //1
emptyString.isEmpty     //false

let greeting2 = "Guten Tag!"
var gt2 = greeting2.startIndex
greeting2[gt2]      //"G" 출력


//정수 형태로 한번 변형해서(걸러서) 사용하는 방식
var newIndex = greeting2.index(greeting2.startIndex, offsetBy: 2)      //시작 인덱스부터 2 만큼 떨어진 것 부터 출력 G -> u -> t부터 출력
greeting2[newIndex] //"t" 출력

newIndex = greeting2.index(greeting2.startIndex, offsetBy: 1)      //시작 인덱스부터 2 만큼 떨어진 것 부터 출력 G -> u -> t부터 출력
greeting2[newIndex] //"u" 출력

newIndex = greeting2.index(after: greeting2.startIndex)
greeting2[newIndex] //"u" 출력

for index in greeting2.indices {
    print("\(greeting2[index])", terminator: "")
}

//공백 문자열 다음의 문자를 알고 싶을 때
greeting2[greeting2.index(greeting2.endIndex, offsetBy: -1)]

for i in greeting2.indices {
    print(greeting2[i])
}
//문자열의 인덱스는 정수가 아님(스위프트는 문자열을 글자의 의미단위로 사용되기 때문에, 정수 인덱스 사용 불가)
//[String.Index]
//startIndex / endIndex, index(i, offsetBy: )


//MARK: - 202강
var welcome = "Hello"
welcome.insert("!", at: welcome.endIndex)       //이런 경우에 character 하나만 넣을 수 있는데
welcome.insert(contentsOf: "asdasd", at: welcome.startIndex)        //이렇게 구성하면 여러문자를 넣을 수 있다.

if let range = welcome.range(of: "!") {
    welcome.replaceSubrange(range, with: "Swift")
}

var newWelcome = welcome.replacingOccurrences(of: "Swift", with: "New world")       //"Swift" 라는 문자열이 존재하면 "World" 로 교체
//인덱스 범위 파악
//var range = welcome.index(welcome.endIndex, offsetBy: 6)..<welcome.endIndex

var string3 = "Hello World"

if let someIndex = string3.firstIndex(of: " ") {
    string3.insert(contentsOf: " super", at: someIndex)
}
//MARK: - 202강
var a = "Swift"
var b = "swift"

a.caseInsensitiveCompare(b)     //대소문자를 무시하고 비교하는 메서드가 존재한다.
//ComparisonResult 열거형 타입으로 정의
//.orderSame    순서가 동일
//.orderAscending       오름차순
//.orderAsDecending     내림차순
//단순히 같은지 다른지를 비교하는 것이 아닌 결과가 오름차순/내림차순인지 알 수 있어서 결괏값이 활용성이 높고 보다 구체적인 정보 제공 가능
var result1 = a.caseInsensitiveCompare(b)

switch result1 {
case .orderedAscending:
    print("오름차순")
case .orderedDescending:
    print("내림차순")
default:
    print("동일한 차순으로 나옴")
}


//문자열.compare
