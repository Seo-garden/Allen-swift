import UIKit

class Person {
    var name = "길동"
    var age = 20
}

let aPerson = Person()
aPerson.name = "에렌"
print(aPerson.name)
let bPerson = aPerson
bPerson.name = "예거"

print(aPerson.name)     //메모리 주소가 동일한 것이 담겨 있기 때문에 결국 가리키는 녀석은 하나의 데이터다.
print(bPerson.name)

struct Fruits {
    var name = "사과"
    var price = 1000
}

var grapes = Fruits(name: "포도", price: 1500)


var strawberrys = grapes
strawberrys.name = "딸기"

print(grapes.name)      //포도
print(strawberrys.name) //딸기

