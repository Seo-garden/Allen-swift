import UIKit
import Foundation
//MARK: - 192강
class SomeClass {
    fileprivate var name = "가든"     //private 외부에서 접근할 수 없다.
    func changeName(name : String){     //이름을 바꿀 수 있는 로직을 만들 수 있다.
        if name == "가든" {
            return
        }
        self.name = name
    }
}
let object = SomeClass()
//object.name       private 으로 선언한 저장속성은 외부에서 접근해서 변경할 수 없다.
object.changeName(name: "정원")
print(object.name)

//open var some : String = "STR"String과 같은 타입에서도 타입의 접근수준보다 더 넓게 선언되어 있어야 사용이 가능하다. String 의 경우 public 까지만 지원한다.
class SomeOtherClass {
    private var _name = "이름"        //관습적으로, 언더바(_) 로 선언했을 경우 private 을 사용해서 이름을 짓는 경우가 많다.
    var name : String {
        return _name
    }
}

class SomeAnotherClass {
    private(set) var name = "이름"        //이름을 선언할 때만 private 이고, 선언 후에는 internal 이지만, 외부에서 접근이 불가하다. 외부에서 읽기는 가능하지만, 쓰기는 가능하다.
//    public private(set) var name = "이름"        //이름을 선언할 때만 private 이고, 선언 후에는 public
}
let sac = SomeAnotherClass()
sac.name
//MARK: - 193강
public class SomePublicClass {          //public 을 선언하지 않고 internal 로 선언하면, internal 로 작동한다.
    open var someOpenProperty = "SomeOpen"      //open 이라고 선언했지만, public 으로 작동한다. open 은 public 보다 더 넓은 범위에 있기 때문이다.
}
private class SomePrivateClass {        //타입을 private 으로 선언하면 아무곳에서도 사용할 수 없기 때문에, 의미가 없다. 따라서 fileprivate 으로 동작.
    open var someOpenProperty = "SomeOpen"
}
//접근 수준이 높다고, 내부 멤버의 접근 수준이 무조건 따라서 높은 것은 아니다.
open class openClass {
    open var openProperty = "SomeInternal"
    // internal -> 클래스와 동일한 수준을 유지하려면 명시적으로 open 선언이 필요하다.
}
//MARK: - 194강
public class A {
    fileprivate func someMethod() {}
}
internal class B : A {
    fileprivate override func someMethod() {        //접근 수준을 올려서 재정의 가능
        super.someMethod()                          //접근 수준이 더 낮아도 모듈에서 접근가능하기 때문에, 호출 가능
    }
}
