func abc(_ num1 : Double...) -> Double {
    var total = 0.0
    for number in num1 {
        total += number
    }
    return total / Double(num1.count)
}

abc(12, 2, 3)
