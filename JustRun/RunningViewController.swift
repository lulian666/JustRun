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
    var time1: Int = Int(ViewController.time1) ?? 6
    var time2: Int = Int(ViewController.time2) ?? 3
    var speed1 = ViewController.speed1
    var speed2 = ViewController.speed2
    var isSpeed1 = true
    var leftTime:Int = 1
    var speedLabel: UILabel!
    
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
        
        speedLabel = UILabel(frame: CGRect(x: 75, y: 100, width: 300, height: 50))
        speedLabel.text = "目前速度：\(isSpeed1 ? speed1 : speed2)km/h"
        speedLabel.font = UIFont.systemFont(ofSize: 30)
        speedLabel.textColor =  UIColor.black
        self.view.addSubview(speedLabel)
    }
    
    @objc func startCounting(){
        leftTime = isSpeed1 ? time1 - 1: time2 - 1
        startCountingButton.setTitle("(\(leftTime)s)", for: .normal)
        self.startCountingButton.isEnabled = false
        //获取该计时器的剩余时间
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(tickDown), userInfo: nil, repeats: true)
    }
    
    @objc func tickDown() {
        //将剩余时间减少1秒
        leftTime -= 1
        print(leftTime)
        //修改剩余时间
        startCountingButton.setTitle("(\(leftTime)s)", for: .normal)
//        print(startCountingButton.title(for: .normal))
        //如果剩余时间小于等于0
        if leftTime <= 0 {
            self.startCountingButton.isEnabled = true
            isSpeed1 = !isSpeed1
            leftTime = isSpeed1 ? time1 : time2
            speedLabel.text = "目前速度：\(isSpeed1 ? speed1 : speed2)"
        }
    }
    
    @objc func stopCounting(sender: UIButton?){
        if (timer != nil){
            timer.invalidate()
        }
        self.dismiss(animated: true, completion: nil)
    }
}
