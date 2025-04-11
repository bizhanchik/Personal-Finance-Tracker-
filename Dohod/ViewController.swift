//
//  ViewController.swift
//  Dohod
//
//  Created by Swift on 29.09.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var PasscodeLabel: UILabel!
    
    
    var PasscodeStar:String = ""
    var InputPasscode:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func button1Pressed(_ sender: Any) {
        InputPasscode.append(1)
        PasscodeStar += "*"
        PasscodeLabel.text = PasscodeStar
    }
    
    @IBAction func button2Pressed(_ sender: Any) {
        InputPasscode.append(2)
        PasscodeStar += "*"
        PasscodeLabel.text = PasscodeStar
    }
    
    @IBAction func button3Pressed(_ sender: Any) {
        InputPasscode.append(3)
        PasscodeStar += "*"
        PasscodeLabel.text = PasscodeStar
    }
    
    
    @IBAction func button4Pressed(_ sender: Any) {
        InputPasscode.append(4)
        PasscodeStar += "*"
        PasscodeLabel.text = PasscodeStar
    }
    
    @IBAction func button5Pressed(_ sender: Any) {
        InputPasscode.append(5)
        PasscodeStar += "*"
        PasscodeLabel.text = PasscodeStar
    }
    
    @IBAction func button6Pressed(_ sender: Any) {
        InputPasscode.append(6)
        PasscodeStar += "*"
        PasscodeLabel.text = PasscodeStar
    }
    
    @IBAction func button7Pressed(_ sender: Any) {
        InputPasscode.append(7)
        PasscodeStar += "*"
        PasscodeLabel.text = PasscodeStar
    }
    
    @IBAction func button8Pressed(_ sender: Any) {
        InputPasscode.append(8)
        PasscodeStar += "*"
        PasscodeLabel.text = PasscodeStar
    }
    
    @IBAction func button9Pressed(_ sender: Any) {
        InputPasscode.append(9)
        PasscodeStar += "*"
        PasscodeLabel.text = PasscodeStar
    }
    
    @IBAction func button0Pressed(_ sender: Any) {
        InputPasscode.append(0)
        PasscodeStar += "*"
        PasscodeLabel.text = PasscodeStar
        
    }
    
    
    @IBAction func checkPasscode(_ sender: Any) {
        if PasscodeStar == "****" {
            if InputPasscode == [1,2,3,4]{
                PasscodeLabel.textColor = UIColor.green
                
                PasscodeLabel.text = "Correct"
                
                PasscodeLabel.textColor = UIColor.green
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.navigationController?.pushViewController(SecondViewController(), animated: true)
                    self.PasscodeLabel.textColor = UIColor.black
                    self.PasscodeStar = ""
                    self.InputPasscode = []
                    self.PasscodeLabel.text = "Code:"
                }
                
                
                
            }else{
                PasscodeLabel.text = "Incorrect"
                PasscodeLabel.textColor = UIColor.red
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.PasscodeLabel.textColor = UIColor.black
                    self.PasscodeStar = ""
                    self.InputPasscode = []
                    self.PasscodeLabel.text = "Code:"
                }
                
            }
        }

    }
    
    
    
    
    
    

}

