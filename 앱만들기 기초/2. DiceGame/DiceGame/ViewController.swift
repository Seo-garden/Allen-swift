//
//  ViewController.swift
//  DiceGame
//
//  Created by 서정원 on 1/13/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    var diceArray : [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func RollBtnTapped(_ sender: UIButton) {
        //첫번째 이미지뷰를 랜덤으로 변경해야 한다.
        firstImageView.image = diceArray.randomElement()
        //두번째 이미지뷰를 랜덤으로 변경해야 한다.
        secondImageView.image = diceArray.randomElement()
        
        
    }
    
    

}

