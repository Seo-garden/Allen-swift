import UIKit

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
//143강
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

