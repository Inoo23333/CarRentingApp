//
//  LoginViewController.swift
//  CarRentingApp
//
//  Created by user on 2021/1/20.
//

import Alamofire
import UIKit
import Foundation
import Toaster

// 验证码登录注册界面
class YZMLoginViewController: UIViewController {
    let userViewController: UserViewController = UserViewController()
    let phoneText = UITextField(frame: CGRect(x: 77, y: 0, width: kScreenWidth - 77 - 48, height: 50))
    let codeText = UITextField(frame: CGRect(x: 16, y: 0, width: 200, height: 50))

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
                YZMattr = [.font: UIFont.systemFont(ofSize: 16), .foregroundColor:UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)]
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
        let PLAttrString = NSMutableAttributedString(string: "验证码登录")
        PhoneLoginLabel.numberOfLines = 1
        let PLAttr1: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 30, weight: .semibold), .foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        PLAttrString.addAttributes(PLAttr1, range: NSRange(location: 0, length: PLAttrString.length))
        PhoneLoginLabel.attributedText = PLAttrString
        view.addSubview(PhoneLoginLabel)

        let tipLabel = UILabel(frame: CGRect(x: 24, y: 162.5, width: 300, height: 20))
        let attrString2 = NSMutableAttributedString(string: "请输入手机号并用验证码登陆")
        let attr2: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)]
        attrString2.addAttributes(attr2, range: NSRange(location: 0, length: attrString2.length))
        tipLabel.attributedText = attrString2
        view.addSubview(tipLabel)

        let PhoneNumberView = UIView()
        PhoneNumberView.frame = CGRect(x: 24, y: 212.5, width: kScreenWidth - 48, height: 50)
        // strokeCode
        let phoneBorderLayer = CALayer()
        phoneBorderLayer.frame = PhoneNumberView.bounds
        phoneBorderLayer.borderColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1).cgColor
        phoneBorderLayer.cornerRadius = 30
        phoneBorderLayer.borderWidth = 0.5
        PhoneNumberView.layer.addSublayer(phoneBorderLayer)
        view.addSubview(PhoneNumberView)

        let codeView = UIView(frame: CGRect(x: 24, y: 292.5, width: kScreenWidth - 48, height: 50))
        let codeBorderLayer1 = CALayer()
        codeBorderLayer1.frame = codeView.bounds
        codeBorderLayer1.borderColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1).cgColor
        codeBorderLayer1.cornerRadius = 30
        codeBorderLayer1.borderWidth = 0.5
        codeView.layer.addSublayer(codeBorderLayer1)
        view.addSubview(codeView)

        let PNLabel1 = UILabel()
        let PNAttrString = NSMutableAttributedString(string: "+86")
        PNLabel1.frame = CGRect(x: 40, y: 226, width: 35, height: 22.5)
        PNLabel1.numberOfLines = 0
        let PNattr: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)]
        PNAttrString.addAttributes(PNattr, range: NSRange(location: 0, length: PNAttrString.length))
        PNLabel1.attributedText = PNAttrString
        view.addSubview(PNLabel1)

        // 手机号输入框
//        phoneText.backgroundColor = .purple
        phoneText.placeholder = "请输入手机号"
        PhoneNumberView.addSubview(phoneText)
        phoneText.textAlignment = .left

        // 验证码输入框
//        codeText.backgroundColor = .blue
        codeText.placeholder = "请输入验证码"
        codeView.addSubview(codeText)

        // 发送验证码button
        
//        codeButton.backgroundColor = .systemPink
        let YZMAttrString = NSMutableAttributedString(string: "获取验证码")
        let YZMattr: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)]
        YZMAttrString.addAttributes(YZMattr, range: NSRange(location: 0, length: YZMAttrString.length))
        YZMLabel.attributedText = YZMAttrString
        codeButton.addSubview(YZMLabel)
        codeView.addSubview(codeButton)
        codeButton.addTarget(self, action: #selector(sendCode), for: .touchDown)

        // 登录按钮button
        let loginButton = UIButton(frame: CGRect(x: 22, y: 395.5, width: kScreenWidth - 44, height: 50))
        let loginLabel = UILabel(frame: CGRect(x: 0, y: 0, width: kScreenWidth - 44, height: 50))
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
        loginButton.addTarget(self, action: #selector(toLogin), for: .touchDown)

        // 密码登录切换按钮
        let mmLoginButton = UIButton(frame: CGRect(x: 24, y: 358.5, width: 67.5, height: 21))
        mmLoginButton.backgroundColor = .white
        let PasswordLoginLabel = UILabel()
        let CPAttrString = NSMutableAttributedString(string: "密码登录")
        PasswordLoginLabel.frame = CGRect(x: 0, y: 0, width: 67.5, height: 21)
        PasswordLoginLabel.numberOfLines = 0
        let CPAttr: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 15), .foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)]
        CPAttrString.addAttributes(CPAttr, range: NSRange(location: 0, length: CPAttrString.length))
        PasswordLoginLabel.attributedText = CPAttrString
        mmLoginButton.addSubview(PasswordLoginLabel)
        view.addSubview(mmLoginButton)
        mmLoginButton.addTarget(self, action: #selector(toMMLogin), for: .touchDown)

        // 注册按钮
        let registerButton = UIButton(frame: CGRect(x: kScreenWidth - 161, y: 358.5, width: 130, height: 21))
        registerButton.backgroundColor = .white
        let registerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 130, height: 20))
        let registerAttrString = NSMutableAttributedString(string: "还未注册？点击注册")
        let registerAttr: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)]
        registerAttrString.addAttributes(registerAttr, range: NSRange(location: 0, length: registerAttrString.length))
        registerButton.addSubview(registerLabel)
        view.addSubview(registerButton)
        let strSubAttr1: [NSMutableAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.000000)]
        registerAttrString.addAttributes(strSubAttr1, range: NSRange(location: 0, length: 5))
        let strSubAttr2: [NSMutableAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1.000000)]
        registerAttrString.addAttributes(strSubAttr2, range: NSRange(location: 5, length: 4))
        registerLabel.attributedText = registerAttrString
        registerButton.addTarget(self, action: #selector(toRegister), for: .touchDown)

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
        if canLogin() {
            Toast(text: "登录成功").show()
            let homeVC = HomeViewController()
            navigationController?.pushViewController(homeVC, animated: true)
        } else {
            Toast(text: "登录失败，验证码错误").show()
        }
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
        let semaphore = DispatchSemaphore (value: 0)
        let parameters = "{\n  \"phone\": \"\(phone)\"\n}"
        let postData = parameters.data(using: .utf8)
        var request = URLRequest(url: URL(string: "http://car.ecnucpp.cn:8086/login/send_code")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = postData
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
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

    @objc func toMMLogin() {
        let mmLoginVC = MMLoginViewController()
        navigationController?.pushViewController(mmLoginVC, animated: true)
    }

    @objc func toRegister() {
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }

    @objc private func updateTime() {
        remainingSeconds -= 1
    }

    func canLogin() -> Bool {
        var res = true
        let code = codeText.text!
        let phone = phoneText.text!
        let semaphore = DispatchSemaphore (value: 0)
        let parameters = "{\n  \"code\": \"\(code)\",\n  \"phone\": \"\(phone)\"\n}"
        let postData = parameters.data(using: .utf8)
        var request = URLRequest(url: URL(string: "http://car.ecnucpp.cn:8086/login/code")!,timeoutInterval: Double.infinity)
        let token = TokenManager.getToken()
        if token != nil {
            let str = token!
            request.addValue("\(str)", forHTTPHeaderField: "token")
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = postData
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            res = false
            semaphore.signal()
            return
          }
            guard let dict = try? JSONSerialization.jsonObject(with: data,
                                                               options: .mutableContainers) as? NSDictionary else {
                res = false
                semaphore.signal()
                    return
                }
            print(dict)
            guard let tokenInfo = dict.value(forKey: "data") as? NSDictionary, let token = tokenInfo.value(forKey: "token") as? String, let seconds = tokenInfo.value(forKey: "seconds") as? Int else {
                res = false
                semaphore.signal()
                return
                }
            TokenManager.saveToken(token: token,seconds: seconds)
          semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        return res
    }
}
