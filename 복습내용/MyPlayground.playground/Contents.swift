import Foundation
import UIKit
//MARK: - Part3. switch
var number = Int.random(in: 1...10)
switch number {
case 0...3:
    print("0~3")
case 4...7:
    print("4~7")
default:
    break       //원래 한번만 돌아가는 switch문이지만 default블록에 뭐라도 써줘야 하기 때문에 break를 썼다
}
//MARK: - Part4. 튜플
let iOS = ("Swift", 5.0)        //타입을 굳이 선언하지 않아도 되고 다양한 타입을 동시에 선언이 가능하다
let (name, age, address) = ("홍길동", 20, "대구")

var coordinate = (0,5)
switch coordinate {
case (let distance, 0):   // x축이나 y축에 있으면 출력하라는 코드
    print("X축 위에 위치하며, \(distance)만큼의 거리가 떨어져 있음")
case (0, let distance):
    print("Y축 위에 위치하며, \(distance)만큼의 거리가 떨어져 있음")
default:
    print("축 위에 있지 않음")
}
//MARK: - Part6. 반복문
for num in 1...10 {
    print(num)
    if num >= 8 {
        break       //num이 8이상이면 반복문을 탈출한다.
    }
}
for num in 1...10 {
    if num % 2 == 0 {
        continue      //num을 2로 나누었을 때 나머지가 0이 나오면 건너뛰고 다음반복문 실행
    }
    print(num)
}
// MARK: - 오버로딩
func add() {}
func add(a: Int, b: Int){}
func add(d: Double, e: Double){}        //함수의 이름은 같지만, 파라미터를 바꾸기만 해도 새로 사용할 수 있다.
