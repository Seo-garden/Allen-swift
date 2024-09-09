import UIKit
import Foundation
//MARK: - 150강
let numbers = [1,2,3,4,5]

//numbers.map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)
var aaa = numbers.map { num in      //숫자를 하나씩 빼서
    return num
}
print(aaa)

var alphabet = ["A", "B", "C", "D"]

var ccc = alphabet.map { str in
    return str + "!!!"
}
print(ccc)

var newAlphabet = alphabet.map { name -> String in
    return name + "'s good"
}
print(newAlphabet)
//MARK: - 151강
let names = ["Apple", "Black", "Circle", "Dream"]

var lown = names.filter { str in
    return str.contains("l")
}
print(lown)

let array = [1,2,3,4,5,6,7,8]

//array.filter(<#T##isIncluded: (Int) throws -> Bool##(Int) throws -> Bool#>)

var evenNumbersArray = array.filter { $0%2 != 0 }       //하지만 클로저로 전달하는 것이 짧아서 일반적으로 클로저
print(evenNumbersArray)

func isEven(_ i: Int) -> Bool {     //함수로 정의할 수도 있다
    return i % 2 == 0
}
var bbb = array.filter(isEven)
print(bbb)

var c1 = [2,4,6,8].filter { num in //아래에 정의된 evenNumbersArray 와 동일하다
    return num < 5
 }
evenNumbersArray = array.filter{$0 % 2 == 0}.filter{ $0 < 5}

//기존 배열 등의 각 아이템을 클로저가 제공하는 방식으로 결합해서
//마지막 결과값을 리턴
//(각 아이템을 결합해서 단 하나의 값으로 리턴)

var numbersArray = [1,2,3,4,5,6,7,8,9,10]

var resultSum = numbersArray.reduce(0) { a, b in     //초기값이 필요하다 0을 뽑아서 a 에 넣고 numbersArray의 0번째를 b에 넣는다.
    return a + b
}
print(resultSum)
var a1 = numbersArray.reduce("0") { result, item in     //초기값을 0으로 주고 배열의 0번째를 문자열로 변환
    return result + String(item)        //"012345678910" -> "0" + "1" -> "01"
}
print(a1)

numbersArray = [1,2,3,4,5,6,7,8,9,10]

numbersArray.filter { num in
    return num % 2 != 0
}.map { num in
    return num * num
}.reduce(0) { first, item in
    return first + item
}
//위와 아래와 동일하다.
numbersArray.filter {$0 % 2 != 0}.map {$0 * $0}.reduce(0) {$0 + $1}
//MARK: - 152강
let immutableArray = [1,2,3,4,5]
immutableArray.forEach { num in     //map 과 다르게 배열로 반환하지 않는다.
    print(num)
}
let stringArray: [String?] = ["A", nil, "C", "B", nil]

var newString = stringArray.compactMap {$0}     //nil 을 제외하고 가지고 있는 배열을 그대로 반환
print(newString)

var nestedArray = [[1,2,3], [4,5,6], [7,8,9]]
print(nestedArray.flatMap{$0})      //배열들을 하나의 배열로 만들어 준다.
//MARK: - 153강
//명령형 프로그래밍
let number = [1,2,3]
var sum = 0
for number in numbers {
    sum += number
}
print(sum)
//함수형 프로그래밍
var newSum = 0
newSum = number.reduce(0){$0+$1}
//MARK: - 154강
class Dog {
    var name : String?
    var weight : Int
    init(name: String? = nil, weight: Int) {
        self.name = name
        self.weight = weight
    }
    func sit(){
        print("\(self.name) 이 앉았습니다.")
    }
    func layDown(){
        print("누웠습니다.")
    }
}
class Human {
    var dog : Dog?
}
//옵셔널 타입에 대해 "접근사용자"를 사용할 때, 물음표를 넣어서 앞의 타입이 값이 nil
var choco : Dog? = Dog(name: "초코", weight: 15)
choco?.name
choco?.weight
choco?.sit()     //Optional 초코가 앉음

var human = Human()
human.dog = choco
human.dog?.name     //마지막에 있는 옵셔널타입은 ? 를 붙이지 않는다.

var bori : Dog? = Dog(name: "보리", weight: 10)
bori?.sit()     //앞 타입이 옵셔널이라고 해서 메서드가 실행이 안되는 것이 아니다
bori?.layDown()
bori = nil      //bori 가 nil 로 될 경우 결과 값이 nil 로 된다.




let numberArray = [1,2,3,4,5,6,7,8,9,10]

var a = numberArray
    .filter { $0 % 2 == 0 }
    .map { $0 * $0 }
    .reduce(0) { return $0 + $1 }

