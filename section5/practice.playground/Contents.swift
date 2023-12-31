import UIKit
import Foundation
// MARK: - 가위바위보

var computer = Int.random(in: 0...2)
print("숫자를 입력해주세요 : ")
if let input = readLine(), let number = Int(input) {
    print("컴퓨터가 낸 값은 \(computer) 입니다.")
    if number == computer {
        print("비겼습니다.")
    }
    else if number > computer {
        print("이겼습니다.")
    } else {
        print("비겼습니다")
    }
}

// MARK: - 업다운게임

var computer1 = Int.random(in: 0...10)
print("숫자를 입력하세요 : ")

while(true){
    if let input1 = readLine(), let number1 = Int(input1) {
        print("컴퓨터가 낸 값은 \(computer1) 입니다.")
        if number1 > computer1 {
            print("숫자가 큽니다. 낮은 값을 제시해주세요.")
        }
        else if number1 < computer1 {
            print("숫자가 작습니다. 높은 값을 제시해주세요.")
        }
        else {
            print("정답입니다.")
        }
    }
}
