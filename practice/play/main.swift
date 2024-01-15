////입력받은 수의 합구하기
//print("a의 값을 입력하세요 : ")
//var num1 = readLine()
//
//print("b의 값을 입력하세요 : ")
//var num2 =  readLine()
//let number1 = Int(num1!)
//let number2 = Int(num2!)
//
//func add(_ a: Int, _ b: Int) -> Int{
//    return a + b
//}
//var result = add(number1!, number2!)
//print("합은 \(result) 입니다.")
//입력받은 수의 제곱 구하기
//print("숫자를 입력하세요 : ")
//var number = readLine()
//let squ = Int(number!)
//
//func square(_ num: Int) -> Int {
//    return num * num
//}
//var result1 = square(squ!)
//print("입력한 숫자의 제곱근은 \(result1)")
//옵셔널 정수(Int)를 받아 2를 곱한 수(두배)를 반환하거나 입력이 nil인 경우 기본값을 반환하는 함수를 작성
//func optional(num: Int?) {
//    guard let n = num else {
//        print("nil")
//        return
//    }
//    print(n * 2)
//}
//
//while(true) {
////    print("숫자를 입력하세요 : ")
////    let number = readLine()
////    var num = Int(number!)
////    print(num!)
////    let result : [Int] = []
////    print(result)
//
//    func average(){
//        
//    }
//    
////    numbers.append(result)
//}
//
//var result: [Int] = []
//var average = 0
//var counter = 1
//while counter > 0{
//    func addNumberToResult() {
//        print("숫자를 입력하세요: ")
//        if let input = readLine(), let number = Int(input) {
//            result.append(number)
//            print("배열에 추가된 값: \(result)")
//        } else {
//            average = result.reduce(0, +)
//            print("합은 : \(average) 입니다.")
//            counter = -1
//        }
//    }
//    addNumberToResult()
//}

var num1 = readLine()
var result1 = 0
result1 = Int(num1!)!
var num2 = readLine()
var result2 = 0
result2 = Int(num2!)!
var sum = 0
sum = result1 + result2
print(String(result1 + result2))

func Function(number1 a: Int, number2 b: Int) -> Int {
    
}
Function(number1: 3, number2: 2)
