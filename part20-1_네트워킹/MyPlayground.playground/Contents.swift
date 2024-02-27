import UIKit
import Foundation
//MARK: - 169강
//0. URL 주소 문자열로
let movieURL = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f32d5ae15b72378543d7b0c287ab406a&targetDt=20120101"
//1. URL 구조체 만들기
let structURL = URL(string: movieURL)!
//2. URLSession 만들기
let session = URLSession.shared
//3. 세션에 작업 부여
session.dataTask(with: structURL) { data, response, error in
    if error != nil {
        print(error!)
        return
    }
//    guard let safeData = data else{ return }
//    var movieArray = parseJSON1(safeData)
//    print(movieArray!)      //dump 가 각각의 인스턴스를 깔끔하게 출력하게 도와준다.
}.resume()
//task.resume()
//MARK: - 171강
// 서버에서 주는 데이터의 형태
struct MovieData: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

struct DailyBoxOfficeList: Codable {
    let rank: String
    let movieNm: String
    let audiCnt: String
    let audiAcc: String
    let openDt: String
}
//Decodable : 채택하면 JSONDecoder 를 분석할 수 있다.
//Encodable : 구조체나, 클래스를 데이터 형태로 변형시켜주는 프로토콜
//Codable = Decodable + Encodable
//받아온 데이터를 우리가 쓰기 좋게 변환하는 과정
//dump : 깔끔하게 출력해준다.
func parseJSON1(_ movieData: Data) -> [DailyBoxOfficeList]? {
    do {
        // 스위프트5
        // 자동으로 원하는 클래스/구조체 형태로 분석
        // JSONDecoder
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(MovieData.self, from: movieData)       //decode 자체가 에러를 발생할 수 있기 때문에, try 를 선언해야 한다.
        return decodedData.boxOfficeResult.dailyBoxOfficeList
    } catch {
        return nil
    }
}

