import UIKit
import Foundation
//MARK: - 188강
//기본적으로 지역/타임존의 영향을 받음
let now = Date()
print(now)      //그냥 출력하면 UTC 시간으로 출력된다.

now.timeIntervalSinceReferenceDate      //2001.01.01 00:00:00 UTC 기준으로 지난 초

let oneSecond = TimeInterval(1.0)       //1초 간격

TimeZone.current
//MARK: - 189강
//날짜를 제대로 다루려면, Calendar 구조체의 도움이 필요하다. (양력, 음력)
//문자열로 변형시켜주는, DateFormatter 클래스의 도움도 필요
var calendar = Calendar.current     //현재의 달력 반환(양력)
//Calendar(identifier: .gregorian)    양력(위와 동일하다.)
calendar.locale = Locale(identifier: "ko_KR")     //외워서 쓰는건 아니다. 검색해서 써라
calendar.timeZone   //타임존 -> Asia/Seoul

let nowYear = calendar.component(.year, from: now)      //요소화 시키다. .year 로 할 경우 년도가 출시된다. month, day~~ 등등 맞춰서 출력하면 된다.
var myDatecom = calendar.dateComponents([.year, .month, .day], from: now)

class Dog {
    var name : String
    var yearOfBirth : Int
    init(name: String, yearOfBirth: Int) {
        self.name = name
        self.yearOfBirth = yearOfBirth
    }
    var age : Int {
        get {
            let year = Calendar.current.component(.year, from: Date())
            return year - yearOfBirth
        }
    }
}
var bori = Dog(name: "보리", yearOfBirth: 2015)
bori.age
//오늘 요일 확인하기
enum Weekday : Int {
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    static var today : Weekday {
        let weekday : Int = Calendar.current.component(.weekday, from: Date())
        return Weekday(rawValue: 6)!
    }
}
let today = Weekday.today

let startDay = Date()
let endDay = startDay.addingTimeInterval(86400)

let calendar2 = Calendar.current
let someDays = calendar2.dateComponents([.day], from: startDay, to: endDay).day!
//MARK: - 190강
//Date 를 특정형식의 문자열로 변환하려면 1. 지역설정 + 2. 시간대설정 + 3. 날짜형식 + 4. 시간형식
let formatter = DateFormatter()
//1. 지역설정
formatter.locale = Locale(identifier: "ko_KR")
//2. 시간대설정
formatter.timeZone = TimeZone.current       //현재 시간대
//3. 날짜형식
// (1) 날짜 형식 선택
formatter.dateStyle = .full           // "Tuesday, April 13, 2021"
//formatter.dateStyle = .long         // "April 13, 2021"
//formatter.dateStyle = .medium       // "Apr 13, 2021"
//formatter.dateStyle = .none         // (날짜 없어짐) 시간만 볼 때
//formatter.dateStyle = .short        // "4/13/21"

// (2) 시간 형식 선택
formatter.timeStyle = .full           // "2:53:12 PM Korean Standard Time"
//formatter.timeStyle = .long         // "2:54:52 PM GMT+9"
//formatter.timeStyle = .medium       // "2:55:12 PM"
//formatter.timeStyle = .none         // (시간 없어짐)
//formatter.timeStyle = .short        // "2:55 PM"
let something = formatter.string(from: Date())
print("\(something)")
/**==========================================
  2) 커스텀 형식으로 생성
============================================**/
formatter.dateFormat = "yyyy/mm/dd"     //찾아서 쓸 수 밖에 없다. 외워야 한다는 부담을 가지지 않아도 된다.

let someString2 = formatter.string(from: Date())
print(someString2)
//MARK: - 191강
var components = DateComponents()
components.year = 2024
components.month = 2
components.day = 23
components.hour = 22
components.month = 30
components.second = 0
let specifiedDate : Date = Calendar.current.date(from: components)!
print(specifiedDate)

// 조금 더 세련된 방식으로 구현
// 구조체의 확장이용해서 Date에 생성자 구현
extension Date {
    // 구조체 실패가능 생성자로 구현
    init?(y year: Int, m month: Int, d day: Int) {
        
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        guard let date = Calendar.current.date(from: components) else {
            return nil  // 날짜 생성할 수 없다면 nil리턴
        }
        
        self = date      //구조체이기 때문에, self에 새로운 인스턴스를 할당하는 방식으로 초기화가능
    }
}

let someDate = Date(y: 2021, m: 1, d: 1)      // 특정날짜(시점) 객체 생성
let someDate2 = Date(y: 2021, m: 7, d: 10)
