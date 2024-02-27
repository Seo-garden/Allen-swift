import UIKit
//MARK: - 163강
// 반드시 에러를 먼저 정의, 에러가 발생할 수 있는 함수를 정의, 에러가 발생할 수 있는 함수의 처리
// 에러 정의
enum SomeError : Error {        //에러를 정의할 때 반드시 Error 프로토콜을 채택해야 한다.
    case aError
    case bError
    case cError
}
// 에러가 발생할 수 있는 함수 정의
func doSomething(num: Int) throws -> Bool {     //에러처리를 할 때 함수선언뒤에 throws 를 넣는다.
    if num >= 7 {
        return true
    } else {
        if num < 0 {
            throw SomeError.aError              //내부에서 에러를 던질 때 throw를 쓴다 (주의)
        }
        return false
    }
}
//에러가 발생할 수 있는 함수의 처리
do {    //정상적인 경우의 처리 상황
    var result = try doSomething(num: 6)        //에러가 발생할 수 있는 함수 앞에는 try 키워드를 붙여야 하고, 반드시 do {} 블록안에 사용해야 한다. 반환타입이 있을 경우 변수에 담아서 사용가능하다.
    print("결과값 : \(result)")
} catch {   //에러를 던지면 받는 catch 블럭으로, 에러가 발생할 경우의 코드 처리
    print("에러가 발생한 경우의 처리")
}





//MARK: - 164강
// 에러 정의
enum HeightError: Error {
    case maxHeight
    case minHeight
}
// 에러가 발생할 수 있는 함수 정의
func checkingHeight(height: Int) throws -> Bool {
    if height > 190 {
        throw HeightError.maxHeight
    } else if height < 130 {
        throw HeightError.minHeight
    } else {
        if height >= 160 {
            return true
        } else {
            return false
        }
    }
}
// 에러 처리 부분
do {
    let isChecked = try checkingHeight(height: 200)
    if isChecked {
        print("청룡열차 가능")
    } else {
        print("후룸라이드 가능")
    }
} catch {
    print("놀이기구 타는 것 불가능")
}
//try? (옵셔널 트라이) ===> 옵셔널 타입으로 리턴, 정상적인 경우 ==> (정상)리턴타입으로 | 리턴에러가 발생하면 ==> nil 리턴
let isChecked = try? checkingHeight(height: 200)      // Bool? 당연히, 옵셔널 타입을 벗겨서 사용해야함

//try! (Forced 트라이) ===> 에러가 날 수 없는 경우에만 사용 가능, 정상적인 경우 ==> (정상)리턴타입으로 리턴 | 에러가 발생하면 ==> 런타임에러
let isChecked2: Bool = try! checkingHeight(height: 150)     // 에러가 발생할 수 없다고 확신이 있는 경우만 사용해야 함

//catch 블럭은 do블럭에서 발생한 에러만을 처리하는 블럭
//모든 에러를 반드시 처리해야함 (글로벌 스코프에서는 모든 에러 처리를 하지 않아도 컴파일 에러 발생하지 않는다.)
do {
    var result = try checkingHeight(height: 190)
} catch HeightError.maxHeight {     //where 절을 추가해서, 매칭시킬 에러패턴에 조건을 추가할 수 있음(자주 사용하진 않는다.)
    print("키가 너무 커서 탑승할 수 없습니다.")
} catch {   //error 라는 상수가 제공된다.(모든 에러가 넘어옴)
    if let error = error as? HeightError {      //타입캐스팅해서 구체적으로 분기처리가 가능하다.
        switch error {
        case .maxHeight:
            print("키가 커서 불가능")
        case .minHeight:
            print("키가 작아서 불가능")
        //case HeightError.maxHeight, HeightError.minHeight: 케이스를 이런식으로 콤마를 찍어서 연결할 수 있다.
        }
    }
}






//MARK: - 165강
enum SomeError1 : Error {
    case aError
}
func throwingFunc() throws {        //무조건 에러를 던지는 함수
    throw SomeError1.aError
}
do {
    try throwingFunc()
} catch {
    print(error)
}
//일반적인
func handleError() {
    do {
        try throwingFunc()
    } catch {
        print(error)
    }
}
handleError()
//1. 함수 내에서 에러를 직접 처리하지 못할 경우, 에러를 다시 던질 수 있다.
func handleError1() throws {
//    do {
        try throwingFunc()
//    }     catch 블럭이 없어도 에러를 밖에 던질 수 있음.
}
//2. 에러를 던지는 throwing 함수를 파라미터로 받는 경우, 내부에서 다시 던지기 가능 - rethrow
func someFunction1(callback: () throws -> Void) rethrows {
    try callback()          //에러를 다시 던짐
}
func someFunction2(callback: () throws -> Void) rethrows {
    enum NewError : Error {
        case error1
    }
    do {
        try callback()
    } catch {
        throw NewError.error1           //catch 절 내부에서 throw 키워드를 사용해서 에러를 변환해서 사용하는 것은 가능
    }
}
//에러 정의
enum NameError : Error {
    case noName
}
//throwing 함수 뿐만 아니라, 생성자와 메서드에서도 사용 가능
class Course {
    var name : String
    
    init(name: String) throws {
        if name == "" {
            throw NameError.noName
        } else {
            self.name = name
            print("수업 생성")
        }
    }
}
do {
    let _ = try Course(name: "스위프트5")
} catch NameError.noName {
   print("이름이 없어 수업 생성 불가.")
}
//생성자와 메서드를 재정의도 가능하다.
class NewCourse: Course {
    override init(name: String) throws {
        try super.init(name: name)
    }
}





//MARK: - 166강
//defer 문은 코드의 실행을 스코프가 종료되는 시점으로 연기시키는 문법
//일반적으로 어떤 동작을 마무리 동작을 특정하기 위해 사용한다.
//호출이 되야만 미룰 수 있다.
func deferStatement1() {
    defer {
        print("나중에 실행하기")
    }
    print("먼저 실행하기")
}
deferStatement1()
//등록한 역순으로 실행, 보통 한번만 쓰는 것을 추천
func deferStatement3() {
    defer {
        print("1")
    }
    defer {
        print("2")
    }
    defer {
        print("3")
    }
}
deferStatement3()
