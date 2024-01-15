enum RSPgame : Int {
    case rock
    case paper
    case sissor
}

RSPgame(rawValue: 0)!

let number = Int.random(in: 0...100) % 3

print(RSPgame(rawValue: number)!)

var a = 1
var b = 2

func add(a : Int,b : Int) -> Int{
    return a+b
}


func something(name : String?) {
    guard let n = name else {
        print("값은 옵셔널")
        return
    }
    print("\(n)")
}

func factorial(_ num : Int) -> Int{
    if num <= 1 {
        return 1
    }
    return num * factorial(num-1)
}

func someTHING(num : Int?) {
    guard let n = num else {
        print("nil")
        return
    }
    print(n)
}
var number3 = [1,2,3]

number3.append(5)
number3.remove(at: 2)
let numberselect = number3[0]


func numbers(_ numbers : Set<Int>) -> Set<Int>{
    return numbers.filter {$0 % 2 == 0}
}

enum fruits {
    case apple(price: Int, firstName: String)
    case banana(price: Int, secondName: String)
}

var fruit = fruits.apple(price: 1000, firstName: "a")

switch fruit {
case .apple(price: 1000, firstName: "a"):
    print("사과입니다.")
default:
    print("바나나입니다.")
}

func optionalNumber(number: Int?) {
    switch number {
    case .some(let num1):
        print("nil이 아닌 경우")
    case .none:
        print("nil")
    }
}
