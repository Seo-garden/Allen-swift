import Foundation

class SomeData {
    var datas = ["Apple", "Swift", "iOS"]
}

var data = SomeData()
data.datas

struct TimesTable {
    let multiplier = 3
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable()
threeTimesTable[2]

enum Planet: Int {
    case mercury = 1, venus, earth, mars
    
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]

class Aclass {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    convenience init(){
        self.init(x: 0, y: 0)
    }
}
let person = Aclass()

class Bclass : Aclass {
    var z : Int
    
    init(x: Int, y: Int, z: Int) {
        self.z = z
        super.init(x: x, y: y)
    }
}
