import UIKit
import Foundation
//MARK: - 150강
let numbers = [1,2,3,4,5]

//numbers.map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)
var aaa = numbers.map { num in      //숫자를 하나씩 빼서
    return "숫자 : \(num)"
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

var numbersArray = [1,2,3,4,5,6,7,8,9,10]

var resultSum = numbersArray.reduce(0) { a, b in     //초기값이 필요하다 0을 뽑아서 a 에 넣고 numbersArray의 0번째를 b에 넣는다.
    return a + b
}
print(resultSum)
var a1 = numbersArray.reduce("0") { result, item in     //초기값을 0으로 주고 배열의 0번째를 문자열로 변환
    return result + String(item)
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
numbersArray.filter {$0 % 2 != 0}.map {$0 * $0
}.reduce(0) {$0 + $1}
//MARK: - 152강
