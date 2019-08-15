//
//  CountDownTimerController.swift
//  JustRun
//
//  Created by lulian on 2019/8/15.
//  Copyright © 2019 LULIANAPP. All rights reserved.
//
import UIKit


class CountDownTimerController: UIViewController{
    var btn : UIButton!
    var leftTime:Int = 60
    var timer :Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn = UIButton.init(type: .system)
        btn.frame = CGRect.init(x: 100, y: 400, width: 100, height: 100)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.setTitleColor(UIColor.green, for: .disabled)
        btn.setTitle("开始", for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 5.0
        btn.addTarget(self, action: #selector(startClicked), for: .touchUpInside)
        
        self.view.addSubview(btn)
        
    }
    @objc func startClicked() {
        leftTime = 60
        btn.setTitle("重新开始计时(\(leftTime))", for: .disabled)
        self.btn.isEnabled = false
        //获取该计时器的剩余时间
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(tickDown), userInfo: nil, repeats: true)
        
    }

    @objc func tickDown() {
        //将剩余时间减少1秒
        leftTime -= 1
        print(leftTime)
        //修改UIDatePicker的剩余时间
        btn.setTitle("重新开始计时(\(leftTime))", for: .disabled)
        //如果剩余时间小于等于0
        if leftTime <= 0 {
            //取消定时器
            timer.invalidate()
            self.btn.isEnabled = true
            btn.setTitle("重新开始计时", for: .normal)
            let alter = UIAlertView()
            alter.title = "时间到"
            alter.message = "时间到"
            alter.addButton(withTitle: "确定")
            alter.show()
            
        }
    }
}
