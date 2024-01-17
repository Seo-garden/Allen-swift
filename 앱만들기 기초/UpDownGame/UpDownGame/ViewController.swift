//
//  ViewController.swift
//  UpDownGame
//
//  Created by 서정원 on 1/16/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    //컴퓨터가 랜덤으로 선택한 숫자(1~10)
    var comNumber = Int.random(in: 1...10)
    //내가 선택한 숫자
    var myNumber : Int = 1
    
    //앱의 화면에 들어오면 가장 처음에 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "선택하세요"
        numberLabel.text = " "
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        // 1. 버튼의 숫자를 가져와야함
        guard let numString = sender.currentTitle else {return}
        // 2. 숫자 레이블이 변하도록 (숫자에 따라)
        numberLabel.text = numString
        // 3. 선택한 숫자를 변수에다가 저장 (선택사항) -> 숫자로 변환한다음 저장
        guard let num = Int(numString) else {return}
        myNumber = num
    }
    @IBAction func selectButtonPressed(_ sender: UIButton) {
        // 1. 컴퓨터의 숫자와 내가 선택한 숫자를 비교해서 UP / DOWN / BINGO (메인레이블)
        if comNumber > myNumber {
            mainLabel.text = "UP"
        } else if comNumber < myNumber {
            mainLabel.text = "DOWN"
        } else {
            mainLabel.text = "BINGO😀"
        }
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        // 1. mainLabel 이 다시 "선택하세요"
        mainLabel.text = "선택하세요"
        // 2. 숫자레이블을 " " (빈문자열)
        numberLabel.text = ""
        // 3. 컴퓨터의 숫자를 다시 선택하게
        comNumber = Int.random(in: 1...10)
    }
}
