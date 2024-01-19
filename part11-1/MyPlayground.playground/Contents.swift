import UIKit

var greeting = "Hello, playground"

class Dog {
    var name : String
    var weight : Int
    init(name: String, weight: Int) {
        self.name = name
        self.weight = weight
    }
    func sit(){
        print("\(self.name)이 앉아있습니다.")
    }
}
var bori = Dog(name: "보리", weight: 10)
