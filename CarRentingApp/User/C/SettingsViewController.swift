//
//  SettingsViewController.swift
//  CarRentingApp
//
//  Created by user on 2021/1/30.
//

import UIKit

class SettingsViewController: UIViewController, BackButtonDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        
        //导航栏
        let titleHeight: CGFloat = kScreenWidth == 375 ? 64 : 90
        let titleView = TitleView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: titleHeight),type: .Setting)
        view.addSubview(titleView)
       
        //返回按钮
        let backButton = BackButton(frame: CGRect(x: 12, y: titleView.frame.height-30, width: 24, height: 24))
        backButton.delegate = self
        view.addSubview(backButton)
        
        //账号设置bg
        let bgView1 = UIView()
        bgView1.frame = CGRect(x: 0, y: titleHeight+8, width: kScreenWidth, height: 197.5)
        bgView1.backgroundColor = .white
        view.addSubview(bgView1)
        
        //账号设置label
        let settingLabel = UILabel(frame: CGRect(x: 18, y: 10, width: 60, height: 20))
        let settingAttrString = NSMutableAttributedString(string: "账号设置")
        let settingAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .regular),.foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)]
        settingAttrString.addAttributes(settingAttr, range: NSRange(location: 0, length: settingAttrString.length))
        settingLabel.attributedText = settingAttrString
        bgView1.addSubview(settingLabel)
        
        //头像label
        let userPicLabel = UILabel(frame: CGRect(x: 18, y: 48, width: 30, height: 20))
        let userPicAttrString = NSMutableAttributedString(string: "头像")
        let userPicAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: . medium),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        userPicAttrString.addAttributes(userPicAttr, range: NSRange(location: 0, length: userPicAttrString.length))
        userPicLabel.attributedText = userPicAttrString
        bgView1.addSubview(userPicLabel)
        //头像
        let userPic = UIImageView(frame: CGRect(x: kScreenWidth-45-18, y: 45-8, width: 40, height: 40))
        userPic.image = UIImage(named: "未认证头像")
        bgView1.addSubview(userPic)
        
        //昵称label
        let nameLabel = UILabel(frame: CGRect(x: 18, y: 100.5, width: 30, height: 20))
        let nameAttrString = NSMutableAttributedString(string: "昵称")
        let nameAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: . medium),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        nameAttrString.addAttributes(nameAttr, range: NSRange(location: 0, length: nameAttrString.length))
        nameLabel.attributedText = nameAttrString
        bgView1.addSubview(nameLabel)
        //昵称
        let userNameLabel = UILabel(frame: CGRect(x: kScreenWidth-45-18, y: 100.5, width: 45, height: 20))
        let userNameAttrString = NSMutableAttributedString(string: "未设置")
        let userNameAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: . regular),.foregroundColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)]
        userNameAttrString.addAttributes(userNameAttr, range: NSRange(location: 0, length: userNameAttrString.length))
        userNameLabel.attributedText = userNameAttrString
        bgView1.addSubview(userNameLabel)
        
        //绑定手机号label
        let phoneLabel = UILabel(frame: CGRect(x: 18, y: 153, width: 75, height: 20))
        let phoneAttrString = NSMutableAttributedString(string: "绑定手机号")
        let phoneAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: . medium),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        phoneAttrString.addAttributes(phoneAttr, range: NSRange(location: 0, length: phoneAttrString.length))
        phoneLabel.attributedText = phoneAttrString
        bgView1.addSubview(phoneLabel)
        //手机号
        let phoneNumLabel = UILabel(frame: CGRect(x: kScreenWidth-85-18, y: 153, width: 85, height: 20))
        let phoneNumAttrString = NSMutableAttributedString(string: "150****1032")
        let phoneNumAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: . regular),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        phoneNumAttrString.addAttributes(phoneNumAttr, range: NSRange(location: 0, length: phoneNumAttrString.length))
        phoneNumLabel.attributedText = phoneNumAttrString
        bgView1.addSubview(phoneNumLabel)
        
        //分割线1
        let lineView1 = UIView()
        lineView1.frame = CGRect(x: 18, y: 84, width: kScreenWidth-36, height: 0.5)
        lineView1.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        bgView1.addSubview(lineView1)
        
        //分割线2
        let lineView2 = UIView()
        lineView2.frame = CGRect(x: 18, y: 136.5, width: kScreenWidth-36, height: 0.5)
        lineView2.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        bgView1.addSubview(lineView2)
        
        
        //关于bg
        let bgView2 = UIView()
        bgView2.frame = CGRect(x: 0, y: titleHeight+8+bgView1.frame.height+12, width: kScreenWidth, height: 196)
        bgView2.backgroundColor = .white
        view.addSubview(bgView2)
        
        //关于label
        let aboutLabel = UILabel(frame: CGRect(x: 18, y: 16, width: 30, height: 20))
        let aboutAttrString = NSMutableAttributedString(string: "关于")
        let aboutAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: . regular),.foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)]
        aboutAttrString.addAttributes(aboutAttr, range: NSRange(location: 0, length: aboutAttrString.length))
        aboutLabel.attributedText = aboutAttrString
        bgView2.addSubview(aboutLabel)
        
        //帮助中心label
        let helpLabel = UILabel(frame: CGRect(x: 18, y: 54, width: 60, height: 20))
        let helpAttrString = NSMutableAttributedString(string: "帮助中心")
        let helpAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: . medium),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        helpAttrString.addAttributes(helpAttr, range: NSRange(location: 0, length: helpAttrString.length))
        helpLabel.attributedText = helpAttrString
        bgView2.addSubview(helpLabel)
        
        //用户协议与隐私策略label
        let protocLabel = UILabel(frame: CGRect(x: 18, y: 106.5, width: 130, height: 20))
        let protocAttrString = NSMutableAttributedString(string: "用户协议与隐私策略")
        let protocAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: . medium),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        protocAttrString.addAttributes(protocAttr, range: NSRange(location: 0, length: protocAttrString.length))
        protocLabel.attributedText = protocAttrString
        bgView2.addSubview(protocLabel)
        
        //问题反馈label
        let feedbackLabel = UILabel(frame: CGRect(x: 18, y: 159, width: 60, height: 20))
        let feedbackAttrString = NSMutableAttributedString(string: "问题反馈")
        let feedbackAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: . medium),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        feedbackAttrString.addAttributes(feedbackAttr, range: NSRange(location: 0, length: feedbackAttrString.length))
        feedbackLabel.attributedText = feedbackAttrString
        bgView2.addSubview(feedbackLabel)
        
        //退出登录button
        let exitButton = UIButton()
        exitButton.frame = CGRect(x: 88, y: kScreenHeight-90, width: kScreenWidth-88*2, height: 50)
        exitButton.layer.borderWidth = 1
        exitButton.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        exitButton.layer.cornerRadius = 24.5
        //退出登录label
        let exitLabel = UILabel()
        let exitAttrString = NSMutableAttributedString(string: "退出登录")
        exitLabel.frame = CGRect(x: (exitButton.frame.width-56)/2, y: 15, width: 60, height: 20)
        exitLabel.numberOfLines = 0
        let exitAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: . regular),.foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)]
        exitAttrString.addAttributes(exitAttr, range: NSRange(location: 0, length: exitAttrString.length))
        exitLabel.attributedText = exitAttrString
        
        exitButton.addSubview(exitLabel)
        view.addSubview(exitButton)
        
    }

    ///BackButtonDelegate
    func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
}
