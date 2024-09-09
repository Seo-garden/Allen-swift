import UIKit
import Foundation
func afunction(str: String) -> String {
    return "hello \(str)"
}

let asd = {() -> Void in
    return
}
let a = {print("안녕")}
a()     //실행
func aFunction1(param : String) -> String {
    return "hello \(param)"
}
var a1 : (String) -> String = aFunction1
a1("hello")
a1 = afunction
//MARK: - 143강
let add = { (a1: Int, b1: Int) -> Int in
    let result1 = a1 + b1
    return result1
}
//타입추론이 가능한 경우
let add1 : (Int, Int) -> Int = {
(a,b) in
    let result = a + b
    return result
}
//MARK: - 144강
func closureParamFunction(closure: () -> Void) {
    print("프린트 시작")
    closure()
}
closureParamFunction(closure: {
    print("프린트 종료")
})
func printSwiftFunction(){
    print("프린트 종료")
}
let printSwift = { () -> Void in
    print("프린트 종료")
}
// MARK: - 145강
//closureParamFunction(closure: printSwift)
//closureParamFunction(closure: printSwiftFunction)
closureParamFunction(closure: {     // 이런식으로 많이 쓴다.
    print("프린트 안녕 안녕")
})
func closureCaseFunction(a: Int, b: Int, closure: (Int) -> Void) {
    let c = a + b
    closure(c)
}
closureCaseFunction(a: 5, b: 2, closure: { param -> () in       //위아래 동일하다.
    print("반갑습니다. \(param)")
})
closureCaseFunction(a: 2, b: 4){ number in        //사후적 정의로 재활용? 하는 느낌으로 / 트레일러 클로저 기법
    print("반갑습니다 2번째 \(number)")
}
//MARK: - 146강
func closureParamFunction2(closure2: () -> Void) {
    print("프린트 시작")
    closure2()}
// 1. 트레일링 클로저 문법(후행 클로저)
closureParamFunction2{    //closureParamFunction2 자동완성에서 엔터를 치면 후행클로저 형식으로 변한다.
    //개발자가 자주 소괄호 닫은 것을 까먹어서 앞으로 뺄 수 있는데, 문법적으로 closure2 파라미터를 생략해도 되고, 괄호도 생략해도 된다.
    print("프린트 종료")
}      //})맨뒤에 있는 소괄호를 앞으로 뺄 수 있다.

closureParamFunction2(closure2: {
    //여기서
})
closureParamFunction2(closure2:){
    //괄호를 앞으로
}
closureParamFunction2(){
    //파라미터를 생략하고
}
closureParamFunction2{
    //괄호를 생략하면 후행클로저의 모습이 된다.
}


//2. 파라미터 및 생략 등의 간소화
func performClosure(param : (String) -> Int) {
    param("Swift")
}//타입 추론
performClosure(param: { (str: String) in
    return str.count
})//싱글익스프레션인 경우 리턴 키워드 생략
performClosure(param: { (str) in
    str.count
})//아규먼트 이름 축약
performClosure(param: {
    $0.count
})//후행 클로저 - 결론적으로 이렇게 사용할 것 이기 때문에 중요하다.
performClosure{$0.count}

let closureType4 : (Int, Int) -> Int = {$0 * $1}
// MARK: - 147강
// UIKit 이나 SwiftUI의 함수 혹은 메서드를 사용할 때 많이 사용한다.
Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
    print("1초뒤에 출력")
}
class ViewController : UIViewController {
    
}
let vc = ViewController()
//vc.dismiss(animated: false, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>) 여기도 클로저
vc.dismiss(animated: false) {
    print("화면 닫기 완료")
}
//멀티플 트레일링 클로저
func multipleClosure(first : () -> (), second: () -> (), third: () -> ()) {
    first()
    second()
    third()
}
multipleClosure {
    
} second: {
    
} third: {
    
}
func multipleClosure2(first : () -> (), _ second: () -> (), third: () -> ()) {
    first()
    second()
    third()
}
multipleClosure2 {
    print("1")
} _: {
    print("2")
} third: {
    print("3")
}
//MARK: - 148강
var stored = 0
//클로저 외부에 존재하는 stored 변수를 계속 사용해야 하기 때문에 캡처현상이 발생한다.
let closure = { (number: Int) -> Int in
    stored += number
    return stored
}
closure(3)      //3
closure(5)      //8
// 아래의 경우 중첩 함수로 되어있고
// 내부 함수 외부에 계속 사용해야 하는 값이 있기 때문에 캡처 현상이 발생
// 함수, 클로저를 변수에 저장하는 시점을 캡처 --> 클래스도 레퍼런스 타입
func calculateFunc() -> ((Int) -> Int) {
    var sum = 0
    func square(num: Int) -> Int {
        sum += (num*num)
        return sum
    }
    return square
}
// 함수를 변수에 할당하거나, 클로저를 사용하는 경우 힙에 해당 메모리주소를 저장 및 (외부의)필요한 변수를 캡처
var squareFunc = calculateFunc()        // 이 클로저는 힙에 저장이 되는데, squareFunc(10) 이 함수가 종료되면 스택프레임에서 사라지지만,
//변수를 할당하고 있었기 때문에 값이 사라지지 않는다.
squareFunc(10)      //100
squareFunc(20)      //500
squareFunc(30)      //1400
//래퍼런스 타입
var dodoFunc = calculateFunc()
dodoFunc(20)        //1800
//MARK: - 149강
//escaping 키워드가 필요한 경우
//원칙적으로 함수의 실행이 종료되면 파라미터로 쓰이는 클로저도 제거된다
//@escaping 키워드는 클로저를 제거하지 않고 함수에서 탈출시킴(함수가 종료되어도 클로저가 존재하도록 한다) --> 클로저가 함수의 실행흐름(스택프레임)을 벗어날 수 있도록 함
//@escaping 사용의 대표적인 경우
//1. 어떤 함수의 내부에 존재하는 클로저를 외부 변수에 저장
//2. GCD (비동기 코드의 사용)
var aSavedFunction: () -> () = {print("출력")}

func performEscaping2(closure: @escaping () -> Void){
    aSavedFunction = closure                //클로저를 실행하는 것이 아닌 aSaveFunction 변수에 저장
}

performEscaping2 {print("다르게 출력")}      //클로저를 실행하는 것이 아닌 print함수를 aSaveFunction 에 할당
aSavedFunction() // 다르게 출력이 출력된다.

func performEscaping1(closure: @escaping (String) -> ()) {      //비동기 코드이기 때문에 @escaping 필요
    var name = "홍길동"
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {   //1초뒤에 실행하도록 만들기
        closure(name)
    }
}

performEscaping1 { str in
    print("이름 출력하기 \(str)")
}
//클로저 앞에 @autoclosure 키워드 사용(파라미터가 없는 클로저만 가능)
func someFunction(closure: @autoclosure () -> Bool) {       //input 이 없을 때만
    if closure(){
        print("참입니다.")
    } else {
        print("거짓입니다.")
    }
}
someFunction(closure: )
