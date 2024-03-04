import UIKit
import Foundation
//MARK: - 207
var num : Int = 25
//num 에 2진법, 8진법, 16진법으로도 변수에 넣을 수 있다.
num = 1_000_000        //숫자에 언더바도 삽입할 수 있다
//MARK: - 208
//스위프트에서는 기본적으로 오버플로우를 허락하지 않음 -> 에러발생(크러시)
//let num : UInt8 = 300     overflows
//특정한 경우에, 특정패턴을 구현하기 위해 오버플로우를 허용하는 경우가 필요한데, 이런 경우 활용을 위해 오버플로우 연산자가 있음
/**===========================
 [오버플로우 연산자] 보통 게임같은걸 만들 때 사용하므로, 간단히 훑고 지나가도(까먹어도) 상관없다.
 - &+ : 오버플로우 더하기 연산자
 - &- : 오버플로우 빼기 연산자
 - &* : 오버플로우 곱하기 연산자 곱하기의 경우 비트가 하나씩 올라간다
 
 - 앰퍼샌드(&)기호가 붙어있음
=============================**/
var b = UInt8.max
b = b &+ 1

var c1 = UInt8.max
c1 = c1 &* 2        //비트를 한칸 옮기는 것이 곱하기해서 하는 것 보다 실행이 훨씬 빠르다.
//MARK: - 209
//스위프트의 논리평가식은 "단락 평가"를 사용
//단락평가 : 논리평가식에서 결과도출에 필요한 최소한의 논리식만 평가
//우선순위는 && -> || 순서이다.
func checking() -> Bool {
    print(#function)
    num = 0
    num += 1
    return true
}
checking()

if checking() || checking() {
    
}
num
//MARK: - 210
let a1 : UInt8  = 0b1111_1100
let a2 : UInt8  = 0b0011_1111
let c2 = a1 & a2
//a4 ^ b4 --> 서로 같으면 0, 서로 다르면 1 배타적
let a4 : UInt8 = 0b0001_0100        //20
let b4 : UInt8 = 0b0000_0101        //5
let c4 = a4 ^ b4
