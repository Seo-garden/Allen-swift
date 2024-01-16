//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 서정원 on 1/13/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!  //interface builder
    
    
    //앱의 화면에 처음 들어오면 처음 실행시키는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "반갑습니다 랄롭니다."
        mainLabel.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    
    @IBAction func btnPress(_ sender: Any) {
        mainLabel.text = "안녕하세요"
        mainLabel.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        //#colorLiteral()
        //#imageLiteral()
        mainLabel.textColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        mainLabel.textAlignment = NSTextAlignment.right
        
    }
}

