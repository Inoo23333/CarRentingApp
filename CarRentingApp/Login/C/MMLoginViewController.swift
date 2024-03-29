//
//  MMLoginViewController.swift
//  CarRentingApp
//
//  Created by user on 2021/1/23.
//

import UIKit

//密码登录界面
class MMLoginViewController: UIViewController {
    let userViewController: UserViewController = UserViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let loginBg = UIImageView(image: UIImage(named: "LoginBG"))
        loginBg.frame = CGRect(x: kScreenWidth - 247.5, y: 0, width: 247.5, height: 192)
        view.addSubview(loginBg);
        
        let PhoneLoginLabel = UILabel()
        let PLAttrString = NSMutableAttributedString(string: "手机号登录")
        PhoneLoginLabel.frame = CGRect(x: 24, y: 118, width: 200, height: 42)
        PhoneLoginLabel.numberOfLines = 1
        let PLAttr1: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 30, weight: .semibold),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        PLAttrString.addAttributes(PLAttr1, range: NSRange(location: 0, length: PLAttrString.length))
        PhoneLoginLabel.attributedText = PLAttrString
        view.addSubview(PhoneLoginLabel)
        
        let label2 = UILabel()
        let attrString2 = NSMutableAttributedString(string: "未注册的手机号验证通过后将自动注册")
        label2.frame = CGRect(x: 24, y: 162.5, width: 300, height: 20)
        label2.numberOfLines = 0
        let attr2: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14),.foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)]
        attrString2.addAttributes(attr2, range: NSRange(location: 0, length: attrString2.length))
        label2.attributedText = attrString2
        view.addSubview(label2)
        
        let PhoneNumberView = UIView()
        PhoneNumberView.frame = CGRect(x: 24, y: 212.5, width: kScreenWidth-48, height: 50)
        // strokeCode
        let phoneBorderLayer = CALayer()
        phoneBorderLayer.frame = PhoneNumberView.bounds
        phoneBorderLayer.borderColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1).cgColor
        phoneBorderLayer.cornerRadius = 30
        phoneBorderLayer.borderWidth = 0.5
        PhoneNumberView.layer.addSublayer(phoneBorderLayer)
        view.addSubview(PhoneNumberView)
        
        let passwordView = UIView()
        passwordView.frame = CGRect(x: 24, y: 292.5, width: kScreenWidth-48, height: 50)
        // strokeCode
        let borderLayer1 = CALayer()
        borderLayer1.frame = passwordView.bounds
        borderLayer1.borderColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1).cgColor
        borderLayer1.cornerRadius = 30
        borderLayer1.borderWidth = 0.5
        passwordView.layer.addSublayer(borderLayer1)
        view.addSubview(passwordView)
        
        let PNLabel1 = UILabel()
        let PNAttrString = NSMutableAttributedString(string: "+86")
        PNLabel1.frame = CGRect(x: 40, y: 226, width: 35, height: 22.5)
        PNLabel1.numberOfLines = 0
        let PNattr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 16),.foregroundColor: UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)]
        PNAttrString.addAttributes(PNattr, range: NSRange(location: 0, length: PNAttrString.length))
        PNLabel1.attributedText = PNAttrString
        view.addSubview(PNLabel1)
        
        //手机号输入框
        let phoneText = UITextField(frame: CGRect(x: 77, y: 0, width: 150, height: 50))
        phoneText.placeholder = "请输入手机号"
        PhoneNumberView.addSubview(phoneText)
        phoneText.textAlignment = .left
        
        //密码输入框
        let passwordText = UITextField(frame: CGRect(x: 16, y: 0, width: 150, height: 50))
        passwordText.placeholder = "请输入密码"
        passwordView.addSubview(passwordText)
        
        //button
        let loginButton = UIButton()
        loginButton.frame = CGRect(x: 22, y: 395.5, width: kScreenWidth-44, height: 50)
        let loginLabel = UILabel()
        loginLabel.frame = CGRect(x: 0, y: 0, width: kScreenWidth-44, height: 50)
        loginLabel.text = "登录"
        loginLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        loginLabel.textColor = .white
        loginLabel.textAlignment = .center
        // fillCode
        let LoginBgLayer1 = CAGradientLayer()
        LoginBgLayer1.colors = [UIColor(red: 0.95, green: 0.85, blue: 0.59, alpha: 1).cgColor, UIColor(red: 0.78, green: 0.64, blue: 0.35, alpha: 1).cgColor]
        LoginBgLayer1.locations = [0, 1]
        LoginBgLayer1.frame = loginButton.bounds
        LoginBgLayer1.cornerRadius = 24.5
        LoginBgLayer1.startPoint = CGPoint(x: 0, y: 0.5)
        LoginBgLayer1.endPoint = CGPoint(x: 0.5, y: 0.5)
        loginButton.layer.addSublayer(LoginBgLayer1)
        loginButton.addSubview(loginLabel)
        view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(toHome), for: .touchDown)
        
        let mmLoginButton = UIButton(frame: CGRect(x: 24, y: 358.5, width: 67.5, height: 21))
        mmLoginButton.backgroundColor = .white
        let PasswordLoginLabel = UILabel()
        let CPAttrString = NSMutableAttributedString(string: "验证码登录")
        PasswordLoginLabel.frame = CGRect(x: 0, y: 0, width: 80, height: 21)
        PasswordLoginLabel.numberOfLines = 0
        let CPAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 15),.foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)]
        CPAttrString.addAttributes(CPAttr, range: NSRange(location: 0, length: CPAttrString.length))
        PasswordLoginLabel.attributedText = CPAttrString
        mmLoginButton.addSubview(PasswordLoginLabel)
        view.addSubview(mmLoginButton)
        mmLoginButton.addTarget(self, action: #selector(toYZMLogin), for: .touchDown)
        
        let label = UILabel()
        let attrString = NSMutableAttributedString(string: "登录即代表同意《隐私政策和用户协议》")
        label.frame = CGRect(x: (kScreenWidth-225)/2, y: kScreenHeight-16.5-21, width: 225, height: 16.5)
        label.numberOfLines = 0
        let attr1: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12),.foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)]
        attrString.addAttributes(attr1, range: NSRange(location: 0, length: attrString.length))
        view.addSubview(label)
        let strSubAttr1: [NSMutableAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 12),.foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6,alpha:1.000000)]
        attrString.addAttributes(strSubAttr1, range: NSRange(location: 0, length: 7))

        let strSubAttr2: [NSMutableAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 12),.foregroundColor: UIColor(red: 0.34, green: 0.64, blue: 0.87,alpha:1.000000)]
        attrString.addAttributes(strSubAttr2, range: NSRange(location: 7, length: 11))

        label.attributedText = attrString
    }
    
    @objc func toHome() {
        if isNewUser() {
            let passwordVC = PasswordViewController()
            self.navigationController?.pushViewController(passwordVC, animated: true)
        } else {
            let homeVC = HomeViewController()
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
//        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc func toYZMLogin() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func isNewUser() -> Bool {
        return true
    }
}
