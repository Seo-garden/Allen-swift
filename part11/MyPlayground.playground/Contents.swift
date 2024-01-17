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

var grapes = Fruits()


var strawberrys = grapes
strawberrys.name = "딸기"

print(grapes.name)      //포도
print(strawberrys.name) //딸기

class Dog {
    var name1 : String
    var weight1 : Double
    init(name2: String, weight2: Double){
        self.name1 = name2
        self.weight1 = weight2
    }
}

var siba = Dog(name2: "시바견", weight2: 7.0)

class Book {
    var bookName : String
    var bookPrice : Int
    var publisher : String
    var author : String
    var page : Int
    init(bookName: String, bookPrice: Int, publisher: String, author: String, page: Int) {
        self.bookName = bookName
        self.bookPrice = bookPrice
        self.publisher = publisher
        self.author = author
        self.page = page
    }
}
