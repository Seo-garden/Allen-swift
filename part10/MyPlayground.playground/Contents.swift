enum RSPgame : Int {
    case rock
    case paper
    case sissor
}

RSPgame(rawValue: 0)!

let number = Int.random(in: 0...100) % 3

print(RSPgame(rawValue: number)!)

var a = 1.0
var b = 2.0
func multiple() -> Double {
    return a*b
}


