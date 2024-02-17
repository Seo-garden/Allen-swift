import UIKit
import Foundation
//MARK: - 175강
//오래 걸리는 작업을 할 때
func task() {
    print("task시작")
    sleep(2)
    print("task종료")
}
func task2() {
    print("task2시작")
    sleep(2)
    print("task2종료")
}
func task3() {
    print("task3시작")
    sleep(2)
    print("task3종료")
}
func task4() {
    print("task4시작")
    sleep(2)
    print("task4종료")
}
print("1")
func task5(){       //비동기적인 함수 정의
    DispatchQueue.global().async {
        print("task5시작")
        sleep(2)
        print("task5종료")
    }
}
//디폴트 글로벌큐를 생성해서 비동기적으로
DispatchQueue.global().async {      //클로저 안에 비동기적으로 실행함.        .sync 를 쓰면 동기적으로 실행
    task()      //다른 쓰레드로 보낼 작업을 배치          동시에 다같이 실행하는데 순서가 일정하지 않고 아무거나 다같이 실행해서 2초안에 끝남
    print("1")      //클로저안에 여러 작업이 있을 경우 클로저안에서는 순서대로 실행한다.(하나의 작업으로 취급한다.)
    print("2")
}
DispatchQueue.global().async {      //클로저 안에 비동기적으로 실행함.
    task2()
}
DispatchQueue.global().async {      //클로저 안에 비동기적으로 실행함.
    task3()
}
DispatchQueue.global().async {      //클로저 안에 비동기적으로 실행함.
    task4()
}
print("2")      //12 ~~ 로 출력되긴 하지만 무조건적으로 2가 먼저 출력이 안될 수도 있다.
//직렬큐

let serialQueue = DispatchQueue(label: "serial")        //일을 순서대로 실행한다.      DispatchQueue.global() --> 동시큐
serialQueue.async {
    task()
}
serialQueue.async {
    task2()
}
serialQueue.async {
    task3()
}
//MARK: - 176강
let mainQueue = DispatchQueue.main // 메인큐 = 메인쓰레드(쓰레드1번)을 의미하고, 한개뿐이고 serial 직렬큐
//글로벌큐의 종류는 Qos. 품질에 따라서 6가지 종류도 나뉜다.
let defaultQueue = DispatchQueue.global(qos: .default)        //DispatchQueue.global()과 동일하다. 아무것도 선언하지 않으면       DispatchQueue.global(qos: .) 6가지를 확인할 수 있다.

DispatchQueue(label: "serial")        //serial 을 입력하면 시리얼 큐가 된다.
DispatchQueue(label: "custom", attributes: .concurrent)     //이런식으로 입력하면 동시큐이다. 하지만 드물다.
//MARK: - 177강
var imageView : UIImageView? = nil
let url = URL(string: "http://www.naver.com")!
URLSession.shared.dataTask(with: url) { (data, response, error) in
    if error != nil {
        print("에러 발생")
    }
    guard let imageData = data else { return }
    
    let photoImage = UIImage(data: imageData)
    imageView?.image = photoImage
}
