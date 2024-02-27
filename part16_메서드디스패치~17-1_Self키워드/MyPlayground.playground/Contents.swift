import Foundation
import UIKit
//138강
class AClass {
    class BClass {
        
    }
}

class Message {
    // 상태를 중첩타입으로 (외부에서 접근못하게 하려면, private으로 선언가능)
    private enum Status {
        case sent
        case received
        case read
    }
    
    // 보낸 사람, 받는 사람
    let sender: String, recipient: String, content: String
    // 보낸 시간
    let timeStamp: Date
    // 메세지 상태 정보 (보냄/받음/읽음)
    private var status: Message.Status = Message.Status.sent
    
    init(sender: String, recipient: String, content: String) {
        self.sender = sender
        self.recipient = recipient
        self.content = content
        
        self.timeStamp = Date()   // 현재시간 생성 ===> 시간은 유저가 주는 정보 아님
    }
    
    func getBasicInfo() -> String {
        return "보낸사람: \(sender), 받는사람: \(recipient), 메세지 내용: \(content), 보낸 시간: \(timeStamp.description), "
    }
    
    // 메세지 상태에 따라서, 색깔 바뀜
    func statusColor() -> UIColor {
        switch status {
        case .sent:
            return UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        case .received:
            return UIColor(red: 0, green: 0, blue: 1, alpha: 1)
        case .read:
            return UIColor(red: 0, green: 1, blue: 1, alpha: 1)
        }
    }
}


let message1 = Message(sender: "홍길동", recipient: "임꺽정", content: "뭐해?")
print(message1.getBasicInfo())
sleep(1)
let message2 = Message(sender: "임꺽정", recipient: "홍길동", content: "그냥")
print(message2.getBasicInfo())

//141강
struct MyStruct {
    static let club = "iOS부서"
    static func doSomething(){
        print("소속은 \(self.club) 입니다.")
    }
}

