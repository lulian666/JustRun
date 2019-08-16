//
//  RunningViewController.swift
//  JustRun
//
//  Created by lulian on 2019/8/15.
//  Copyright © 2019 LULIANAPP. All rights reserved.
//

import UIKit

class RunningViewController: UIViewController {
    var endButton: UIButton!
    var startCountingButton: UIButton!
    var timer: Timer!
    var speed1Time1: Int = Int(ViewController.speed1Time1) ?? 10
    var speed2Time1: Int = Int(ViewController.speed2Time1) ?? 10
    var speed1Time2: Int = Int(ViewController.speed1Time2) ?? 10
    var speed2Time2: Int = Int(ViewController.speed2Time2) ?? 10
    var speed1 = ViewController.speed1
    var speed2 = ViewController.speed2
    var isSpeed1 = true
    
    enum TimeToCountDown {
        case SPEED1TIME1
        case SPEED1TIME2
        case SPEED2TIME1
        case SPEED2TIME2
    }
    
    var whichTime = TimeToCountDown.SPEED1TIME1
    var leftTime:Int = 1
    var nextLeftTime = 1
    var currentTime = 1
    var speedLabel: UILabel!
    var timeLabel: UILabel!
    var nextSpeedLabel: UILabel!
    var nextTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startCountingButton = UIButton.init(type: .system)
        startCountingButton.frame = CGRect.init(x: 100, y: 300, width: 200, height: 200)
        startCountingButton.setTitleColor(UIColor.red, for: .normal)
        startCountingButton.setTitleColor(UIColor.red, for: .disabled)
        startCountingButton.backgroundColor = UIColor.green
        startCountingButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        startCountingButton.setTitle("开始", for: .normal)
        startCountingButton.clipsToBounds = true
        startCountingButton.layer.cornerRadius = 5.0
        startCountingButton.addTarget(self, action: #selector(startCounting), for: .touchUpInside)
        
        self.view.addSubview(startCountingButton)
        self.view.backgroundColor = UIColor.lightGray
     
        endButton = UIButton(frame: CGRect(x: 130, y: 650, width: 150, height: 100))
        endButton.setTitle("结束跑步", for: .normal)
        endButton.setTitleColor(UIColor.green, for: .normal)
        endButton.backgroundColor = UIColor.red
        endButton.addTarget(self, action: #selector(stopCounting), for: UIControl.Event.touchUpInside)
        self.view.addSubview(endButton)
        
//        speedLabel = UILabel(frame: CGRect(x: 75, y: 20, width: 300, height: 50))
//        speedLabel.text = "目前速度：\(isSpeed1 ? speed1 : speed2)km/h"
//        speedLabel.font = UIFont.systemFont(ofSize: 30)
//        speedLabel.textColor =  UIColor.black
//        self.view.addSubview(speedLabel)
        speedLabel = self.createLabel(x: 75, y: 20, width: 300, height: 50, text: "目前速度：\(isSpeed1 ? speed1 : speed2)km/h", size: 30, color: .black)
        self.view.addSubview(speedLabel)
        
        timeLabel = UILabel(frame: CGRect(x: 75, y: 80, width: 300, height: 50))
        currentTime = speed1Time1
        timeLabel.text = "持续时间：\(currentTime)s"
        timeLabel.font = UIFont.systemFont(ofSize: 30)
        timeLabel.textColor =  UIColor.black
        self.view.addSubview(timeLabel)
        
        nextSpeedLabel = UILabel(frame: CGRect(x: 75, y: 140, width: 300, height: 50))
        nextSpeedLabel.text = "下个速度：\(isSpeed1 ? speed2 : speed1)km/h"
        nextSpeedLabel.font = UIFont.systemFont(ofSize: 30)
        nextSpeedLabel.textColor =  UIColor.darkGray
        self.view.addSubview(nextSpeedLabel)
        
        nextTimeLabel = UILabel(frame: CGRect(x: 75, y: 200, width: 300, height: 50))
        leftTime = speed2Time1
        nextTimeLabel.text = "下个时间：\(leftTime)s"
        nextTimeLabel.font = UIFont.systemFont(ofSize: 30)
        nextTimeLabel.textColor =  UIColor.darkGray
        self.view.addSubview(nextTimeLabel)
    }
    
    @objc func startCounting(){
        leftTime = self.getLeftTime()
        currentTime = leftTime
        self.startCountingButton.isEnabled = false
        //获取该计时器的剩余时间
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(tickDown), userInfo: nil, repeats: true)
    }
    
    @objc func tickDown() {
        //修改剩余时间
        startCountingButton.setTitle("(\(leftTime)s)", for: .normal)
        //将剩余时间减少1秒
        leftTime -= 1
        speedLabel.text = "目前速度：\(isSpeed1 ? speed1 : speed2)km/h"
        nextSpeedLabel.text = "下个速度：\(isSpeed1 ? speed2 : speed1)km/h"
        timeLabel.text = "持续时间：\(currentTime)s"
        switch whichTime {
        case .SPEED1TIME1:
            nextLeftTime = speed2Time1
        case .SPEED1TIME2:
            nextLeftTime = speed2Time2
        case .SPEED2TIME1:
            nextLeftTime = speed1Time2
        case .SPEED2TIME2:
            nextLeftTime = speed1Time1
        }
        
        nextTimeLabel.text = "下个时间：\(nextLeftTime)s"
        //如果剩余时间小于等于0
        if leftTime == 0 {
            self.startCountingButton.isEnabled = true
            isSpeed1 = !isSpeed1
            
            switch whichTime {
            case .SPEED1TIME1:
                whichTime = .SPEED2TIME1
            case .SPEED1TIME2:
                whichTime = .SPEED2TIME2
            case .SPEED2TIME1:
                whichTime = .SPEED1TIME2
            case .SPEED2TIME2:
                whichTime = .SPEED1TIME1
            }
            leftTime = self.getLeftTime()
            currentTime = leftTime
        }
    }
    
    @objc func stopCounting(sender: UIButton?){
        if (timer != nil){
            timer.invalidate()
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func getLeftTime() -> Int {
        var time = 0
        switch whichTime {
        case .SPEED1TIME1:
            time = speed1Time1
        case .SPEED1TIME2:
            time = speed1Time2
        case .SPEED2TIME1:
            time = speed2Time1
        case .SPEED2TIME2:
            time = speed2Time2
        }
        return time
    }
    
    func createLabel(x: Int, y: Int, width: Int, height: Int, text: String, size: Int, color: UIColor ) -> UILabel {
        let label = UILabel(frame: CGRect(x: 75, y: 20, width: 300, height: 50))
        label.text = "目前速度：\(isSpeed1 ? speed1 : speed2)km/h"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor =  UIColor.black
        return label
    }
}
