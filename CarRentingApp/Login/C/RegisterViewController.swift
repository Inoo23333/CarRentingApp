//
//  PasswordViewController.swift
//  CarRentingApp
//
//  Created by user on 2021/1/23.
//

import Foundation
import Toaster
import UIKit

class RegisterViewController: UIViewController {
    let userViewController: UserViewController = UserViewController()

    let phoneText = UITextField(frame: CGRect(x: 77, y: 0, width: kScreenWidth - 77 - 48, height: 50))
    let codeText = UITextField(frame: CGRect(x: 16, y: 0, width: 200, height: 50))
    let passwordText = UITextField(frame: CGRect(x: 16, y: 0, width: 280, height: 50))
    let rePasswordText = UITextField(frame: CGRect(x: 16, y: 0, width: 280, height: 50))

    var YZMLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 22.5))
    var codeButton = UIButton(frame: CGRect(x: kScreenWidth - 48 - 90 - 16, y: 13, width: 200, height: 22.5))
    private var countdownTimer: Timer?
    private var remainingSeconds: Int = 0 {
        willSet {
            var YZMAttrString = NSMutableAttributedString(string: "重新获取\(newValue)s")
            var YZMattr: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.gray]
            YZMAttrString.addAttributes(YZMattr, range: NSRange(location: 0, length: YZMAttrString.length))
            YZMLabel.attributedText = YZMAttrString

            if newValue <= 0 {
                YZMAttrString = NSMutableAttributedString(string: "获取验证码")
                YZMattr = [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)]
                YZMAttrString.addAttributes(YZMattr, range: NSRange(location: 0, length: YZMAttrString.length))
                YZMLabel.attributedText = YZMAttrString
                isCounting = false
            }
        }
    }

    var isCounting = false {
        willSet {
            if newValue {
                countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)

                remainingSeconds = 60
                codeButton.setTitleColor(.blue, for: .normal)
            } else {
                countdownTimer?.invalidate()
                countdownTimer = nil

                codeButton.setTitleColor(.purple, for: .normal)
            }

            codeButton.isEnabled = !newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        let loginBg = UIImageView(image: UIImage(named: "LoginBG"))
        loginBg.frame = CGRect(x: kScreenWidth - 247.5, y: 0, width: 247.5, height: 192)
        view.addSubview(loginBg)

        let PhoneLoginLabel = UILabel(frame: CGRect(x: 24, y: 118, width: 200, height: 42))
        let PLAttrString = NSMutableAttributedString(string: "注册")
        let PLAttr1: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 30, weight: .semibold), .foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        PLAttrString.addAttributes(PLAttr1, range: NSRange(location: 0, length: PLAttrString.length))
        PhoneLoginLabel.attributedText = PLAttrString
        view.addSubview(PhoneLoginLabel)

        let label2 = UILabel(frame: CGRect(x: 24, y: 162.5, width: 300, height: 20))
        let attrString2 = NSMutableAttributedString(string: "请验证手机号并设置密码后注册")
        let attr2: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)]
        attrString2.addAttributes(attr2, range: NSRange(location: 0, length: attrString2.length))
        label2.attributedText = attrString2
        view.addSubview(label2)

        // 输入手机号
        let PhoneNumberView = UIView(frame: CGRect(x: 24, y: 212.5, width: kScreenWidth - 48, height: 50))
        let phoneBorderLayer = CALayer()
        phoneBorderLayer.frame = PhoneNumberView.bounds
        phoneBorderLayer.borderColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1).cgColor
        phoneBorderLayer.cornerRadius = 30
        phoneBorderLayer.borderWidth = 0.5
        PhoneNumberView.layer.addSublayer(phoneBorderLayer)
        view.addSubview(PhoneNumberView)
        phoneText.placeholder = "请输入手机号"
        PhoneNumberView.addSubview(phoneText)
        phoneText.textAlignment = .left
        // "+86"
        let PNLabel1 = UILabel()
        let PNAttrString = NSMutableAttributedString(string: "+86")
        PNLabel1.frame = CGRect(x: 40, y: 226, width: 35, height: 22.5)
        PNLabel1.numberOfLines = 0
        let PNattr: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)]
        PNAttrString.addAttributes(PNattr, range: NSRange(location: 0, length: PNAttrString.length))
        PNLabel1.attributedText = PNAttrString
        view.addSubview(PNLabel1)

        // 验证码
        let codeView = UIView(frame: CGRect(x: 24, y: 292.5, width: kScreenWidth - 48, height: 50))
        let codeBorderLayer1 = CALayer()
        codeBorderLayer1.frame = codeView.bounds
        codeBorderLayer1.borderColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1).cgColor
        codeBorderLayer1.cornerRadius = 30
        codeBorderLayer1.borderWidth = 0.5
        codeView.layer.addSublayer(codeBorderLayer1)
        view.addSubview(codeView)
        // 验证码输入框
        codeText.placeholder = "请输入验证码"
        codeView.addSubview(codeText)

        let YZMAttrString = NSMutableAttributedString(string: "发送验证码")
        let YZMattr: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)]
        YZMAttrString.addAttributes(YZMattr, range: NSRange(location: 0, length: YZMAttrString.length))
        YZMLabel.attributedText = YZMAttrString
        codeButton.addSubview(YZMLabel)
        codeView.addSubview(codeButton)
        codeButton.addTarget(self, action: #selector(sendCode), for: .touchDown)

        // 密码输入框
        let passwordView = UIView(frame: CGRect(x: 24, y: 372.5, width: kScreenWidth - 48, height: 50))
        let passwordBorderLayer = CALayer()
        passwordBorderLayer.frame = passwordView.bounds
        passwordBorderLayer.borderColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1).cgColor
        passwordBorderLayer.cornerRadius = 30
        passwordBorderLayer.borderWidth = 0.5
        passwordView.layer.addSublayer(passwordBorderLayer)
        view.addSubview(passwordView)
        // 密码输入框
        passwordText.placeholder = "请输入密码"
        passwordView.addSubview(passwordText)
        passwordText.textAlignment = .left

        // 重新密码输入框
        let rePasswordView = UIView(frame: CGRect(x: 24, y: 452.5, width: kScreenWidth - 48, height: 50))
        let borderLayer1 = CALayer()
        borderLayer1.frame = rePasswordView.bounds
        borderLayer1.borderColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1).cgColor
        borderLayer1.cornerRadius = 30
        borderLayer1.borderWidth = 0.5
        rePasswordView.layer.addSublayer(borderLayer1)
        view.addSubview(rePasswordView)
        // 重新密码输入框
        rePasswordText.placeholder = "请再次输入密码"
        rePasswordView.addSubview(rePasswordText)

        // 已有账号？直接登录
        let toLoginButton = UIButton(frame: CGRect(x: kScreenWidth - 161, y: 600, width: 130, height: 21))
        toLoginButton.backgroundColor = .white
        let toLoginLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 130, height: 20))
        let toLoginAttrString = NSMutableAttributedString(string: "已有账号？直接登录")
        let toLoginAttr: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)]
        toLoginAttrString.addAttributes(toLoginAttr, range: NSRange(location: 0, length: toLoginAttrString.length))
        toLoginButton.addSubview(toLoginLabel)
        view.addSubview(toLoginButton)
        let strSubAttr1: [NSMutableAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.000000)]
        toLoginAttrString.addAttributes(strSubAttr1, range: NSRange(location: 0, length: 5))
        let strSubAttr2: [NSMutableAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1.000000)]
        toLoginAttrString.addAttributes(strSubAttr2, range: NSRange(location: 5, length: 4))
        toLoginLabel.attributedText = toLoginAttrString
        toLoginButton.addTarget(self, action: #selector(toLogin), for: .touchDown)

        // button
        let registerButton = UIButton()
        registerButton.frame = CGRect(x: 22, y: 532.5, width: kScreenWidth - 44, height: 50)
        let registerLabel = UILabel()
        registerLabel.frame = CGRect(x: 0, y: 0, width: kScreenWidth - 44, height: 50)
        registerLabel.text = "注册"
        registerLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        registerLabel.textColor = .white
        registerLabel.textAlignment = .center
        let registerBgLayer1 = CAGradientLayer()
        registerBgLayer1.colors = [UIColor(red: 0.95, green: 0.85, blue: 0.59, alpha: 1).cgColor, UIColor(red: 0.78, green: 0.64, blue: 0.35, alpha: 1).cgColor]
        registerBgLayer1.locations = [0, 1]
        registerBgLayer1.frame = registerButton.bounds
        registerBgLayer1.cornerRadius = 24.5
        registerBgLayer1.startPoint = CGPoint(x: 0, y: 0.5)
        registerBgLayer1.endPoint = CGPoint(x: 0.5, y: 0.5)
        registerButton.layer.addSublayer(registerBgLayer1)
        registerButton.addSubview(registerLabel)
        view.addSubview(registerButton)
        registerButton.addTarget(self, action: #selector(register), for: .touchDown)

        // 隐私协议按钮
        let privacyLabel = UILabel(frame: CGRect(x: (kScreenWidth - 225) / 2, y: kScreenHeight - 16.5 - 21, width: 225, height: 16.5))
        let privacyAttrString = NSMutableAttributedString(string: "登录即代表同意《隐私政策和用户协议》")
        let privacyattr1: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)]
        privacyAttrString.addAttributes(privacyattr1, range: NSRange(location: 0, length: privacyAttrString.length))
        view.addSubview(privacyLabel)
        let strAttr1: [NSMutableAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.000000)]
        privacyAttrString.addAttributes(strAttr1, range: NSRange(location: 0, length: 7))
        let strAttr2: [NSMutableAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor(red: 0.34, green: 0.64, blue: 0.87, alpha: 1.000000)]
        privacyAttrString.addAttributes(strAttr2, range: NSRange(location: 7, length: 11))

        privacyLabel.attributedText = privacyAttrString
    }

    @objc func toLogin() {
        let yzmVC = YZMLoginViewController()
        navigationController?.pushViewController(yzmVC, animated: true)
    }

    // MARK: 注册网络请求

    @objc func register() {
        let res = canRegister()
        if res == "000" {
            Toast(text: "注册成功").show()
            navigationController?.popViewController(animated: true)
        } else if res == "500" {
            Toast(text: "用户已存在").show()
        } else {
            Toast(text: "注册失败\(res)").show()
        }
    }

    func canRegister() -> String {
        var res = "000"
        let phone = phoneText.text!
        let code = codeText.text!
        let password = passwordText.text!
        let repassword = rePasswordText.text!
        if password != repassword {
            Toast(text: "两次密码输入不一致").show()
            return "-1"
        }
        let semaphore = DispatchSemaphore(value: 0)
        let parameters = "{\n  \"code\": \"\(code)\",\n  \"password\": \"\(password)\"\n  \"phoneNum\": \"\(phone)\"\n}"
//        let parameters = "{\n  \"certificated\": true,\n  \"createTime\": {\n    \"date\": 0,\n    \"day\": 0,\n    \"hours\": 0,\n    \"minutes\": 0,\n    \"month\": 0,\n    \"nanos\": 0,\n    \"seconds\": 0,\n    \"time\": 0,\n    \"timezoneOffset\": 0,\n    \"year\": 0\n  },\n  \"deleted\": true,\n  \"enabled\": true,\n  \"fullName\": \"string\",\n  \"id\": 0,\n  \"mvcc\": 0,\n  \"password\": \"\(password)\",\n  \"phoneNum\": \"\(phone)\",\n  \"roles\": [\n    \"ROLE_ADMIN\"\n  ],\n  \"status\": \"APPLYING\",\n  \"updateTime\": {\n    \"date\": 0,\n    \"day\": 0,\n    \"hours\": 0,\n    \"minutes\": 0,\n    \"month\": 0,\n    \"nanos\": 0,\n    \"seconds\": 0,\n    \"time\": 0,\n    \"timezoneOffset\": 0,\n    \"year\": 0\n  }\n}"
        let postData = parameters.data(using: .utf8)
        var request = URLRequest(url: URL(string: "http://car.ecnucpp.cn:8086/login/app_register_code")!, timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = postData
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                print(String(describing: error))
                res = "-1"
                semaphore.signal()
                return
            }
            guard let dict = try? JSONSerialization.jsonObject(with: data,
                                                               options: .mutableContainers) as? NSDictionary else {
                res = "-1"
                semaphore.signal()
                return
            }
            print(dict)
            guard let code = dict.value(forKey: "code") as? String else {
                res = "-1"
                semaphore.signal()
                return
            }
            guard let userInfo = dict.value(forKey: "data") as? NSDictionary else {
                res = code
                semaphore.signal()
                return
            }
            print(userInfo)
            print(code)
            res = code
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        return res
    }

    // MARK: 发送验证码

    @objc private func updateTime() {
        remainingSeconds -= 1
    }

    @objc func sendCode() {
        // 发送验证码
        let phone = phoneText.text!
        if phone.count != 11 {
            Toast(text: "手机号格式错误").show()
        } else {
            // 倒计时60s
            isCounting = true
            canSendCode()
        }
    }

    func canSendCode() {
        let phone = phoneText.text!
        let semaphore = DispatchSemaphore(value: 0)
        let parameters = "{\n  \"phone\": \"\(phone)\"\n}"
        let postData = parameters.data(using: .utf8)
        var request = URLRequest(url: URL(string: "http://car.ecnucpp.cn:8086/login/send_code")!, timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = postData
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                print(String(describing: error))
                semaphore.signal()
                return
            }
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
}
