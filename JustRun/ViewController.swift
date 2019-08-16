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
    public static var speed1Time1: String = "10"
    public static var speed2Time1: String = "10"
    public static var speed1Time2: String = "10"
    public static var speed2Time2: String = "10"
    
    weak var textFieldSpeed1: UITextField!
    weak var textFieldSpeed2: UITextField!
    weak var textFieldSpeed1Time1: UITextField!
    weak var textFieldSpeed2Time1: UITextField!
    weak var textFieldSpeed1Time2: UITextField!
    weak var textFieldSpeed2Time2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let labelSpeed1 = UILabel(frame: CGRect(x: 10, y: 50, width: 100, height: 50))
        labelSpeed1.text = "慢跑速度:"
        self.view.addSubview(labelSpeed1)
 
        textFieldSpeed1 = self.createTextField(x: 160, y: 50, width: 190, height: 50, tag: 1, placeholder: "慢跑速度默认6.5km/h")
        self.view.addSubview(textFieldSpeed1)
        
        let labelTime1 = UILabel(frame: CGRect(x: 10, y: 170, width: 150, height: 50))
        labelTime1.text = "慢跑循环时长1:"
        self.view.addSubview(labelTime1)
        
        textFieldSpeed1Time1 = self.createTextField(x: 160, y: 170, width: 190, height: 50, tag: 3, placeholder: "输入慢跑时间1")
        self.view.addSubview(textFieldSpeed1Time1)
        
        let labelSpeed2 = UILabel(frame: CGRect(x: 10, y: 110, width: 100, height: 50))
        labelSpeed2.text = "快跑速度:"
        self.view.addSubview(labelSpeed2)
        
        textFieldSpeed2 = self.createTextField(x: 160, y: 110, width: 190, height: 50, tag: 2, placeholder: "快跑速度默认8.5km/h")
        self.view.addSubview(textFieldSpeed2)
        
        let labelTime2 = UILabel(frame: CGRect(x: 10, y: 230, width: 150, height: 50))
        labelTime2.text = "快跑循环时长1:"
        self.view.addSubview(labelTime2)
        
        textFieldSpeed2Time1 = self.createTextField(x: 160, y: 230, width: 190, height: 50, tag: 4, placeholder: "输入快跑时间1")
        self.view.addSubview(textFieldSpeed2Time1)
//        textFieldTime2.addTarget(self, action: #selector(fieldLoseFoucus), for: UIControl.Event.editingDidEnd)
        
        let labelTime12 = UILabel(frame: CGRect(x: 10, y: 290, width: 150, height: 50))
        labelTime12.text = "慢跑循环时长2:"
        self.view.addSubview(labelTime12)
        
        textFieldSpeed1Time2 = self.createTextField(x: 160, y: 290, width: 190, height: 50, tag: 5, placeholder: "输入慢跑时间2")
        self.view.addSubview(textFieldSpeed1Time2)
        
        let labelTime22 = UILabel(frame: CGRect(x: 10, y: 350, width: 150, height: 50))
        labelTime22.text = "快跑循环时长2:"
        self.view.addSubview(labelTime22)
        
        textFieldSpeed2Time2 = self.createTextField(x: 160, y: 350, width: 190, height: 50, tag: 6, placeholder: "输入快跑时间2")
        self.view.addSubview(textFieldSpeed2Time2)
        
        
        let startButton = UIButton(frame: CGRect(x: 110, y: 450, width: 150, height: 100))
        startButton.backgroundColor = UIColor.red
        startButton.setTitle("设置好了", for: UIControl.State.normal)
        self.view.addSubview(startButton)
        startButton.addTarget(self, action: #selector(btnClickFun), for: UIControl.Event.touchDown)
    }
    
    @objc func btnClickFun(sender: UIButton?){
        let runningView = RunningViewController()
        self.present(runningView, animated: true, completion: nil)
    }
    
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
            ViewController.speed2 = textFieldSpeed2.text ?? "8.5"
        case 3:
            ViewController.speed1Time1 = textFieldSpeed1Time1.text ?? "10"
        case 4:
            ViewController.speed2Time1 = textFieldSpeed2Time1.text ?? "10"
        case 5:
            ViewController.speed1Time2 = textFieldSpeed1Time2.text ?? "10"
        case 6:
            ViewController.speed2Time2 = textFieldSpeed2Time2.text ?? "10"
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
            textFieldSpeed2.becomeFirstResponder()
        case 2:
            textFieldSpeed1Time1.becomeFirstResponder()
        case 3:
            textFieldSpeed2Time1.becomeFirstResponder()
        case 4:
            textFieldSpeed1Time2.becomeFirstResponder()
        case 5:
            textFieldSpeed2Time2.becomeFirstResponder()
        case 6:
            textFieldSpeed2Time2.resignFirstResponder()
            let runningView = RunningViewController()
            self.present(runningView, animated: true, completion: nil)
        default:
            break
        }
        return true
    }
}

