//
//  UserViewController.swift
//  CarRentingApp
//
//  Created by user on 2021/1/19.
//

import UIKit

class UserViewController: UIViewController, UserButtonDelegate, BackButtonDelegate, CreditViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        //用户界面背景切图
        let userBG = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenWidth*248/375))
        userBG.image = UIImage(named: "个人中心背景")
        view.addSubview(userBG)
        
        let cHeight = 66/339*(kScreenWidth-36)
        //信用积分CreditView
        let creditView = CreditView(frame: CGRect(x: 18, y: userBG.frame.height-cHeight/2, width: kScreenWidth-36, height: cHeight))
        creditView.delegate = self
        view.addSubview(creditView)
        
        //用户信息UserInfoView
        let userInfoView = UserInfoView(frame: CGRect(x: 18, y: creditView.frame.origin.y-77 , width: kScreenWidth, height: 65))
        view.addSubview(userInfoView)
        
        //我的订单
        let myOrderButton = UserButton(type: .Order,frame: CGRect(x: 18, y: creditView.frame.origin.y + cHeight + 10, width: kScreenWidth-36, height: 64))
        myOrderButton.delegate = self
        view.addSubview(myOrderButton)
        
        //我的消息
        let messageButton = UserButton(type: .Message,frame: CGRect(x: 18, y: myOrderButton.frame.origin.y + 74, width: kScreenWidth-36, height: 64))
        messageButton.delegate = self
        view.addSubview(messageButton)
        
        //我的设置
        let settingButton = UserButton(type: .Setting,frame: CGRect(x: 18, y: messageButton.frame.origin.y + 74, width: kScreenWidth-36, height: 64))
        settingButton.delegate = self
        view.addSubview(settingButton)
        
        let buttonHeight: CGFloat = kScreenWidth == 375 ? 30 : 50
        //返回按钮
        let backButton = BackButton(frame: CGRect(x: 12, y: buttonHeight, width: 24, height: 24))
        backButton.delegate = self
        view.addSubview(backButton)
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    ///UserButtonDelegate
    func toMyOrder() {
        let myOrderVC = MyOrderViewController()
        self.navigationController?.pushViewController(myOrderVC, animated: true)
    }
    
    func toMessage() {
        let messageVC = MyMessageViewController()
        self.navigationController?.pushViewController(messageVC, animated: true)
    }
    
    func toSetting() {
        let settingsVC = SettingsViewController()
        self.navigationController?.pushViewController(settingsVC, animated: true)
    }

    ///BackButtonDelegate
    func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    ///CreditViewDelegate
    func toCredit() {
        let creditVC = CreditViewController()
        self.navigationController?.pushViewController(creditVC, animated: true)
    }
    
    func toIdentify() {
        let idVC = IdentifyViewController()
        self.navigationController?.pushViewController(idVC, animated: true)
    }
}
