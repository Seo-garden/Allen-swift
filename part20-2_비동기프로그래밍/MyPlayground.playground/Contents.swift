import UIKit
import Foundation
////MARK: - 175강
////오래 걸리는 작업을 할 때
//func task() {
//    print("task시작")
//    sleep(2)
//    print("task종료")
//}
//func task2() {
//    print("task2시작")
//    sleep(2)
//    print("task2종료")
//}
//func task3() {
//    print("task3시작")
//    sleep(2)
//    print("task3종료")
//}
//func task4() {
//    print("task4시작")
//    sleep(2)
//    print("task4종료")
//}
//print("1")
//func task5(){       //비동기적인 함수 정의
//    DispatchQueue.global().async {
//        print("task5시작")
//        sleep(2)
//        print("task5종료")
//    }
//}
////디폴트 글로벌큐를 생성해서 비동기적으로
//DispatchQueue.global().async {      //클로저 안에 비동기적으로 실행함.        .sync 를 쓰면 동기적으로 실행
//    task()      //다른 쓰레드로 보낼 작업을 배치          동시에 다같이 실행하는데 순서가 일정하지 않고 아무거나 다같이 실행해서 2초안에 끝남
//    print("1")      //클로저안에 여러 작업이 있을 경우 클로저안에서는 순서대로 실행한다.(하나의 작업으로 취급한다.)
//    print("2")
//}
//DispatchQueue.global().async {      //클로저 안에 비동기적으로 실행함.
//    task2()
//}
//DispatchQueue.global().async {      //클로저 안에 비동기적으로 실행함.
//    task3()
//}
//DispatchQueue.global().async {      //클로저 안에 비동기적으로 실행함.
//    task4()
//}
//print("2")      //12 ~~ 로 출력되긴 하지만 무조건적으로 2가 먼저 출력이 안될 수도 있다.
////직렬큐
//
//let serialQueue = DispatchQueue(label: "serial")        //일을 순서대로 실행한다.      DispatchQueue.global() --> 동시큐
//serialQueue.async {
//    task()
//}
//serialQueue.async {
//    task2()
//}
//serialQueue.async {
//    task3()
//}
////MARK: - 176강
//let mainQueue = DispatchQueue.main // 메인큐 = 메인쓰레드(쓰레드1번)을 의미하고, 한개뿐이고 serial 직렬큐
////글로벌큐의 종류는 Qos. 품질에 따라서 6가지 종류도 나뉜다.
//let defaultQueue = DispatchQueue.global(qos: .default)        //DispatchQueue.global()과 동일하다. 아무것도 선언하지 않으면       DispatchQueue.global(qos: .) 6가지를 확인할 수 있다.
//
//DispatchQueue(label: "serial")        //serial 을 입력하면 시리얼 큐가 된다.
//DispatchQueue(label: "custom", attributes: .concurrent)     //이런식으로 입력하면 동시큐이다. 하지만 드물다.
////MARK: - 177강
//var imageView : UIImageView? = nil
//let url = URL(string: "http://bit.ly/32ps0DI")!
//URLSession.shared.dataTask(with: url) { (data, response, error) in      //URLSession 내부적으로 비동기처리가 되어있기 때문에, 디스패치큐.글로벌 안에서 실행된다고 생각해도 된다. 1번이 아닌 다른 쓰레드에서 실행되기 때문에, 아래에서 메인쓰레드로 보낸다는 코드를 작성해줘야 한다.
//    if error != nil {
//        print("에러 발생")
//    }
//    guard let imageData = data else { return }      //위에 선언된 data 는 Data? 타입이기 때문에, guard let 바인딩을 해줘야 한다.
//    
//    let photoImage = UIImage(data: imageData)
//    DispatchQueue.main.async {
//        imageView?.image = photoImage
//    }
////    imageView?.image = photoImage     코드상의 오류는 없지만, 런타임오류이기 때문에 컴파일러가 오류인지 모른다. 화면을 재설정하는 코드는 디스패치메인큐안에서 처리해야 한다.
//}.resume()
//
//func ProperlyGetImage(with urlString: String, completionHandler: @escaping (UIImage?) -> Void) {
//    let url = URL(string : urlString)!
//    var photoImage : UIImage? = nil
//    
//    URLSession.shared.dataTask(with: url) { data, response, error in
//        if error != nil {
//            print(error!)
//        }
//        guard let imageData = data else { return }
//        photoImage = UIImage(data: imageData)
//        
//        completionHandler(photoImage)
//    }.resume()
//}
//
//ProperlyGetImage(with: "이미지 받을 링크") { image in
//    //처리 관련 코드
//    DispatchQueue.main.async {
//        //UI관련 화면 처리
//    }
//}
////MARK: - 179강
//class ViewController: UIViewController {
//    var name: String = "뷰컨"
//    func doSomething() {
//        // 강한 참조 사이클이 일어나지 않지만, 굳이 뷰컨트롤러를 길게 잡아둘 필요가 없다면
//        // weak self로 선언
//        DispatchQueue.global().async { [weak self] in       //weak self 로 할 경우 약한참조가 일어나기 때문에 레퍼런스 카운트가 증가하지 않는다.
//            guard let weakSelf = self else { return }       //weakSelf에는 nil 이 할당되기 때문에, 아래에 있는 프린트문은 실행되지 않는다.
//            sleep(3)
//            print("글로벌큐에서 출력하기: \(weakSelf.name)")
//        }
//    }
//    deinit {
//        print("\(name) 메모리 해제")
//    }
//}
//func localScopeFunction1() {
//    let vc = ViewController()
//    vc.doSomething()
//}
//localScopeFunction1()
//
//func longtimePrint(name: String) -> String {
//    print("프린트 - 1")
//    sleep(1)
//    print("프린트 - 2")
//    sleep(1)
//    print("프린트 - 3 이름:\(name)")
//    sleep(1)
//    print("프린트 - 4")
//    sleep(1)
//    print("프린트 - 5")
//    return "작업 종료"
//}
//longtimePrint(name: "잡스")
//
//func asyncLongTimePrint(name: String, completionHandler : @escaping (String) -> Void) {
//    DispatchQueue.global().async {
//        let n = longtimePrint(name: "잡스")
//        completionHandler(n)
//    }
//}
//asyncLongTimePrint(name: "잡스") { result in
//    print(result)
//}
//MARK: - 180강
//func longTimePrint() async -> Int {      //오래 걸리는 함수라는 전제 하에 async 키워드가 들어가면 이 함수는 비동기방식이라는 것을 나타낸다. 그리고 리턴형도 사용할 수 있다.
//    print("프린트 - 1")
//    sleep(1)
//    print("프린트 - 2")
//    sleep(1)
//    print("프린트 - 3")
//    sleep(1)
//    return 7
//}
//
//func linkedPrint2() async -> Int {
//    _ = await longTimePrint()       //await를 붙이면 실제로 리턴타입을 받을 때 까지 기다려준다.
//    _ = await longTimePrint()
//    _ = await longTimePrint()
//    _ = await longTimePrint()
//    return 7
//}
//MARK: - 182강
var array = [String]()
let serialQueue = DispatchQueue(label: "serial")
for i in 1...20 {
    DispatchQueue.global().async {      //여러 쓰레드로 분할해서 실행하기 때문에, 숫자들이 달라질 수 있고, 쓰레드세이브하지 않은 상황이 발생된다.
        print("\(i)")
//        array.append("\(i)")    //  <===== 동시큐에서 실행하면 동시다발적으로 배열의 메모리에 접근
        serialQueue.async {        // 올바른 처리 ⭐️
            array.append("\(i)")
        }
    }
}
// 5초후에 배열 확인하고 싶은 코드 일뿐...

DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    print(array)
    //PlaygroundPage.current.finishExecution()
}

