typealias Something = (Int) -> String

func someFuncion(completionHandler: (Int) -> String) {

}

func someFuncion2(completionHandler: Something) {

}

// 클로저 타입 별칭
typealias MyClosureType = (Int, String) -> Bool

//클로저 타입 별칭 사용 이전
let myClosure: (Int, String) -> Bool = { (number, text) in
    return true
}

// 클로저 타입 별칭 사용 예제
let myClosure2: MyClosureType = { (number, text) in
    return true
}

//switch
var choice : String = "안녕하세요"

switch choice {
case "가위":
    print("가위입니다.")
case "바위":
    print("가위입니다.")
default:
    print("보자기입니다.")
}
// 여러가지 case
switch choice {
case "가위":
    print("가위입니다.")
case "바위", "보":
    print("가위 혹은 보자기 입니다.")
default:
    break
}
//fallthrough
var num1 = 9

switch num1 {
case ..<10:
    print("1")
    fallthrough     //매칭된 값에 대한 고려없이 무조건 다음블럭을 실행한다.
case 10:
    print("2")
    fallthrough
default:
    print("3")
}


//stride

for number in stride(from: 1, to: 15, by: 2) { //1부터 15전 까지 2씩 성장
    print(number)
}

for number in stride(from: 1, through: 15, by: 2) { //1부터 15까지 2씩 성장
    print(number)
}

//continue

for num in 1...20 {
    if num % 2 == 0 {
        continue    //continue를 만나면 다음 반복문을 실행한다.
    }
    print(num)      //1 3 5 7 9 11 13 15 17 19
}
//break
for num in 1...20 {
    if num % 2 == 0 {
        break    //break 를 만나면 반복문을 종료한다.
    }
    print(num)      //1
}
