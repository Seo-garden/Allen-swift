//
//  main.swift
//  RandomBingo
//
//  Created by 서정원 on 1/16/24.
//

import Foundation

var computerChoice = Int.random(in: 1...100)
var myChoice : Int = 0

while true {
    var userInput = readLine()

    if let userInput = userInput {
        if let number = Int(userInput) {
            myChoice = number
        }
    }
    if computerChoice > myChoice {
        print("UP")
    } else if computerChoice < myChoice {
        print("DOWN")
    } else {
        print("BINGO")
        break       //반복문을 종료
    }
}
