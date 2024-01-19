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

class Person {
    var height : Double
    var weight : Double
    init(height: Double, weight: Double) {
        self.height = height
        self.weight = weight
    }
    func calculateBMI() -> Double{
        let bmi = weight / (height * height) * 10000
        return bmi
    }
}
let a = Person(height: 160, weight: 60)
a.calculateBMI()

class Person1 {
    var height : Double
    var weight : Double
    init(height: Double, weight: Double) {
        self.height = height
        self.weight = weight
    }
    var bmi : Double{
        var result = weight / (height * height) * 10000
        return result
    }
}
let b = Person1(height: 160, weight: 60)
b.bmi
