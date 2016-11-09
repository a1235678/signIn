//
//  ViewController.swift
//  signIn
//
//  Created by Apple Hsiao on 2016/11/9.
//  Copyright © 2016年 zeroplus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let acctTextField = UITextField(frame:
        CGRect(x: 100, y: 50, width: 150, height: 30))
    let passTextField = UITextField(frame:
        CGRect(x: 100, y: 100, width: 150, height: 30))
    let acctLabel = UILabel(frame: CGRect(x: 30, y: 50, width: 50, height: 30))
    let passLabel = UILabel(frame: CGRect(x: 30, y: 100, width: 50, height: 30))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        genLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func genLayout(){
        
        //帳號輸入欄，tag: 0
        acctTextField.tag = 0
        acctTextField.borderStyle = .roundedRect
        acctTextField.placeholder = "請輸入12位以內"
        acctTextField.returnKeyType = .next
        view.addSubview(acctTextField)
        
        //密碼輸入欄，tag: 1
        passTextField.tag = 1
        passTextField.borderStyle = .roundedRect
        passTextField.placeholder = "請輸入12位以內"
        passTextField.returnKeyType = .default
        passTextField.isSecureTextEntry = true
        view.addSubview(passTextField)
        
        //帳號標題
        acctLabel.text = "帳號"
        view.addSubview(acctLabel)
        
        //密碼標題
        passLabel.text = "密碼"
        view.addSubview(passLabel)
        
        //設定delegate
        self.acctTextField.delegate = self
        self.passTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //帳號欄按next跳到密碼欄，密碼欄按return收鍵盤
        if textField.tag == 0{
            passTextField.becomeFirstResponder()
        }else if textField.tag == 1{
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //控制帳號密碼的長度<=12
        let countOfWords = string.characters.count +  textField.text!.characters.count - range.length
        
        if countOfWords > 12{
            return false
        }
        
        return true
    }
    
    


}

