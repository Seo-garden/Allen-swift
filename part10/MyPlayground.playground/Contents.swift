enum RSPgame : Int {
    case rock
    case paper
    case sissor
}

RSPgame(rawValue: 0)!

let number = Int.random(in: 0...100) % 3

print(RSPgame(rawValue: number)!)
