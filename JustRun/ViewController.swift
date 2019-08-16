//
//  ViewController.swift
//  JustRun
//
//  Created by lulian on 2019/8/15.
//  Copyright © 2019 LULIANAPP. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    public static var speed1: String = "6.5"
    public static var speed2: String = "8.5"
    public static var time1: String = "6"
    public static var time2: String = "3"
    
    weak var textFieldSpeed1: UITextField!
    weak var textFieldSpeed2: UITextField!
    weak var textFieldTime1: UITextField!
    weak var textFieldTime2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let labelSpeed1 = UILabel(frame: CGRect(x: 80, y: 200, width: 100, height: 50))
        labelSpeed1.text = "速度1:"
        self.view.addSubview(labelSpeed1)
 
        textFieldSpeed1 = self.createTextField(x: 180, y: 200, width: 150, height: 50, tag: 1, placeholder: "输入慢跑速度")
        self.view.addSubview(textFieldSpeed1)
        
        let labelTime1 = UILabel(frame: CGRect(x: 80, y: 300, width: 100, height: 50))
        labelTime1.text = "单次时长:"
        self.view.addSubview(labelTime1)
        
        textFieldTime1 = self.createTextField(x: 180, y: 300, width: 150, height: 50, tag: 2, placeholder: "输入慢跑时间")
        self.view.addSubview(textFieldTime1)
//        textFieldTime1.addTarget(self, action: #selector(fieldLoseFoucus), for: UIControl.Event.touchUpOutside)
        
        let labelSpeed2 = UILabel(frame: CGRect(x: 80, y: 400, width: 100, height: 50))
        labelSpeed2.text = "速度2:"
        self.view.addSubview(labelSpeed2)
        
        textFieldSpeed2 = self.createTextField(x: 180, y: 400, width: 150, height: 50, tag: 3, placeholder: "输入慢跑速度")
        self.view.addSubview(textFieldSpeed2)
        
        let labelTime2 = UILabel(frame: CGRect(x: 80, y: 500, width: 100, height: 50))
        labelTime2.text = "单次时长:"
        self.view.addSubview(labelTime2)
        
        textFieldTime2 = self.createTextField(x: 180, y: 500, width: 150, height: 50, tag: 4, placeholder: "输入快跑时间")
        self.view.addSubview(textFieldTime2)
//        textFieldTime2.addTarget(self, action: #selector(fieldLoseFoucus), for: UIControl.Event.editingDidEnd)
        
        let startButton = UIButton(frame: CGRect(x: 130, y: 650, width: 150, height: 100))
        startButton.backgroundColor = UIColor.red
        startButton.setTitle("设置好了", for: UIControl.State.normal)
        self.view.addSubview(startButton)
        startButton.addTarget(self, action: #selector(btnClickFun), for: UIControl.Event.touchDown)
    }
    
    @objc func btnClickFun(sender: UIButton?){
        let runningView = RunningViewController()
//        let view = CountDownTimerController()
        self.present(runningView, animated: true, completion: nil)
    }
    
//     @objc func fieldLoseFoucus(sender: UITextField?){
//        print("fieldLoseFoucus")
//        sender?.resignFirstResponder();
//    }
    
    func createTextField(x: Int, y: Int, width: Int, height: Int, tag: Int, placeholder: String) -> UITextField {
        let textField = UITextField(frame: CGRect(x: x, y: y, width: width, height: height))
        textField.tag = tag
        textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        textField.borderStyle = UITextField.BorderStyle.bezel
        textField.delegate = self
        textField.placeholder  = placeholder
        textField.clearButtonMode = .whileEditing
        textField.returnKeyType = UIReturnKeyType.next
        textField.addTarget(self, action: #selector(textChanged), for: UIControl.Event.editingChanged)
        return textField
    }

    @objc func textChanged(sender: UITextField?){
        let tag = sender?.tag
        switch tag {
        case 1:
            ViewController.speed1 = textFieldSpeed1.text ?? "6.5"
        case 2:
            ViewController.time1 = textFieldTime1.text ?? "6"
        case 3:
            ViewController.speed2 = textFieldSpeed2.text ?? "8.5"
        case 4:
            ViewController.time2 = textFieldTime2.text ?? "3"
        default:
            break
        }
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //收起键盘
        let tag = textField.tag
        switch tag {
        case 1:
            textFieldTime1.becomeFirstResponder()
        case 2:
            textFieldSpeed2.becomeFirstResponder()
        case 3:
            textFieldTime2.becomeFirstResponder()
        default:
            textFieldTime2.resignFirstResponder()
        }
        return true
    }
}

