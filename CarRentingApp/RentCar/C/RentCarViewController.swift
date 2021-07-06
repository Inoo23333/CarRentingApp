//
//  RentCarViewController.swift
//  CarRentingApp
//
//  Created by user on 2021/1/31.
//

import UIKit

class RentCarViewController: UIViewController, BackButtonDelegate, RentTabViewDelegate {
    
    let openButton = UIButton()
    let lockButton = UIButton()
    let unlockButton = UIButton()
    let testButton = UIButton()
    let testDoneButton = UIButton()
    
    let returnLabel = UILabel()
    
    let posVC = PositonViewController()
    let guideVC = GuideViewController()
    let chargeVC = ChargeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //背景图
        let bgHeight = 230/375*kScreenWidth
        let bgView = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: bgHeight))
        bgView.image = UIImage(named: "矩形")
        view.addSubview(bgView)
        
        let buttonHeight: CGFloat = kScreenWidth == 375 ? 30 : 50
        //返回按钮
        let backButton = BackButton(frame: CGRect(x: 12, y: buttonHeight, width: 24, height: 24))
        backButton.delegate = self
        view.addSubview(backButton)
        
        //取消订单
        let cancelLabel = UILabel(frame: CGRect(x: kScreenWidth-64-12, y: buttonHeight, width: 68, height: 22.5))
        let cancelAttrString = NSMutableAttributedString(string: "取消订单")
        cancelLabel.numberOfLines = 0
        let cancelAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 16, weight: .regular),.foregroundColor: UIColor(red: 0.56, green: 0.41, blue: 0.08, alpha: 1)]
        cancelAttrString.addAttributes(cancelAttr, range: NSRange(location: 0, length: cancelAttrString.length))
        cancelLabel.attributedText = cancelAttrString
        view.addSubview(cancelLabel)
        
        //CarInfoView
        let carInfoView = CarInfoView(frame: CGRect(x: 18, y: backButton.frame.origin.y+34, width: kScreenWidth-36, height: 60))
        view.addSubview(carInfoView)
        
        //CarDetailView
        let carDetailView = CarDetailView(frame: CGRect(x: 18, y: backButton.frame.origin.y+94, width: kScreenWidth-36, height: 60))
        view.addSubview(carDetailView)
        
        //rentTabView
        let tabHeight = 60/339*(kScreenWidth-36)
        //租车tab
        let rentTabView = RentTabView(frame: CGRect(x: 18, y: bgHeight-tabHeight/2, width: kScreenWidth-36, height: tabHeight))
        rentTabView.delegate = self
        view.addSubview(rentTabView)
        
        //tipLabel
        let tipLabel = UILabel(frame: CGRect(x: 35, y: rentTabView.frame.origin.y+tabHeight, width: kScreenWidth-70, height: 72))
        let tipAttrString = NSMutableAttributedString(string: "请在下单后15分钟内打开车门，否则因超时订单自动取消；首次开启开门系统开始计费；请在开门后5分钟内完成环境评测，提交测评报告有相应的积分奖励。")
        tipLabel.frame = CGRect(x: 35, y: rentTabView.frame.origin.y+tabHeight, width: kScreenWidth-70, height: 72)
        tipLabel.numberOfLines = 0
        let tipAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)]
        tipAttrString.addAttributes(tipAttr, range: NSRange(location: 0, length: tipAttrString.length))
        tipLabel.attributedText = tipAttrString
        view.addSubview(tipLabel)
        
        //开门button
        openButton.frame = CGRect(x: 20, y: tipLabel.frame.origin.y+130, width: kScreenWidth-40, height: 50)
        let openLabel = UILabel()
        openLabel.frame = CGRect(x: 0, y: 0, width: kScreenWidth-40, height: 50)
        openLabel.text = "开门"
        openLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        openLabel.textColor = .white
        openLabel.textAlignment = .center
        // fillCode
        let openBgLayer1 = CAGradientLayer()
        openBgLayer1.colors = [UIColor(red: 0.95, green: 0.85, blue: 0.59, alpha: 1).cgColor, UIColor(red: 0.78, green: 0.64, blue: 0.35, alpha: 1).cgColor]
        openBgLayer1.locations = [0, 1]
        openBgLayer1.frame = openButton.bounds
        openBgLayer1.cornerRadius = 24.5
        openBgLayer1.startPoint = CGPoint(x: 0, y: 0.5)
        openBgLayer1.endPoint = CGPoint(x: 0.5, y: 0.5)
        openButton.layer.addSublayer(openBgLayer1)
        openButton.addSubview(openLabel)
        openButton.addTarget(self, action: #selector(open), for: .touchDown)
        view.addSubview(openButton)

        //锁车button
        lockButton.frame = CGRect(x: 20, y: tipLabel.frame.origin.y+130, width: kScreenWidth-40, height: 50)
        let lockLabel = UILabel()
        lockLabel.frame = CGRect(x: 0, y: 0, width: kScreenWidth-40, height: 50)
        lockLabel.text = "锁车"
        lockLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        lockLabel.textColor = UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)
        lockLabel.textAlignment = .center
        lockButton.backgroundColor = .white
        lockButton.layer.borderWidth = 1
        lockButton.layer.borderColor = UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1).cgColor
        lockButton.layer.cornerRadius = 24.5
        lockButton.addSubview(lockLabel)
        lockButton.addTarget(self, action: #selector(lock), for: .touchDown)
        lockButton.isHidden = true
        view.addSubview(lockButton)
        
        //开门button2
        unlockButton.frame = CGRect(x: 20, y: tipLabel.frame.origin.y+130, width: kScreenWidth-40, height: 50)
        let unlockLabel = UILabel()
        unlockLabel.frame = CGRect(x: 0, y: 0, width: kScreenWidth-40, height: 50)
        unlockLabel.text = "开门"
        unlockLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        unlockLabel.textColor = UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)
        unlockLabel.textAlignment = .center
        unlockButton.backgroundColor = .white
        unlockButton.layer.borderWidth = 1
        unlockButton.layer.borderColor = UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1).cgColor
        unlockButton.layer.cornerRadius = 24.5
        unlockButton.addSubview(unlockLabel)
        unlockButton.addTarget(self, action: #selector(unlock), for: .touchDown)
        unlockButton.isHidden = true
        view.addSubview(unlockButton)
        
        //环境测评button
        testButton.frame = CGRect(x: 20, y: lockButton.frame.origin.y+50+12, width: kScreenWidth-40, height: 50)
        let testLabel = UILabel()
        testLabel.frame = CGRect(x: 0, y: 0, width: kScreenWidth-40, height: 50)
        testLabel.text = "环境测评"
        testLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        testLabel.textColor = UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)
        testLabel.textAlignment = .center
        testButton.backgroundColor = .white
        testButton.layer.borderWidth = 1
        testButton.layer.borderColor = UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1).cgColor
        testButton.layer.cornerRadius = 24.5
        testButton.addSubview(testLabel)
        testButton.addTarget(self, action: #selector(test), for: .touchDown)
        testButton.isHidden = true
        view.addSubview(testButton)

        //环境测评button
        testDoneButton.frame = CGRect(x: 20, y: lockButton.frame.origin.y+50+12, width: kScreenWidth-40, height: 50)
        let testDoneLabel = UILabel()
        testDoneLabel.frame = CGRect(x: 0, y: 0, width: kScreenWidth-40, height: 50)
        testDoneLabel.text = "环境测评已提交"
        testDoneLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        testDoneLabel.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        testDoneLabel.textAlignment = .center
        testDoneButton.backgroundColor = .white
        testDoneButton.layer.borderWidth = 1
        testDoneButton.layer.borderColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1).cgColor
        testDoneButton.layer.cornerRadius = 24.5
        testDoneButton.addSubview(testDoneLabel)
        testDoneButton.addTarget(self, action: #selector(testDone), for: .touchDown)
        testDoneButton.isHidden = true
        view.addSubview(testDoneButton)
        
        //归还车辆
        let returnAttrString = NSMutableAttributedString(string: "归还车辆")
        returnLabel.frame = CGRect(x: 150.8, y: 524.5, width: 80, height: 25)
        returnLabel.numberOfLines = 0
        let returnAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 18, weight: .regular),.foregroundColor: UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)]
        returnAttrString.addAttributes(returnAttr, range: NSRange(location: 0, length: returnAttrString.length))
        returnLabel.attributedText = returnAttrString
        returnLabel.isHidden = true
        view.addSubview(returnLabel)

        //拨打客服号码
        let serviceLabel = UILabel(frame: CGRect(x: (kScreenWidth-84)/2, y: kScreenHeight-50, width: 90, height: 20))
        let serviceAttrString = NSMutableAttributedString(string: "拨打客服号码")
        let serviceAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .regular),.foregroundColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)]
        serviceAttrString.addAttributes(serviceAttr, range: NSRange(location: 0, length: serviceAttrString.length))
        serviceLabel.attributedText = serviceAttrString
        view.addSubview(serviceLabel)
    }
    
    @objc func open() {
        lockButton.isHidden = false
        testButton.isHidden = false
        openButton.isHidden = true
    }
    
    @objc func lock() {
        unlockButton.isHidden = false
        returnLabel.isHidden = false
        lockButton.isHidden = true
    }
    
    @objc func unlock() {
        lockButton.isHidden = false
        unlockButton.isHidden = true
    }
    
    @objc func test() {
        testDoneButton.isHidden = false
        testButton.isHidden = true
    }
    
    @objc func testDone() {
        
    }
    
    ///BackButtonDelegate
    func popVC() {
        self.navigationController?.popViewController(animated: true)
    }

    ///RentTabViewDelegate
    func toPos() {
        self.navigationController?.pushViewController(posVC, animated: true)
    }
    
    func toGuide() {
        self.navigationController?.pushViewController(guideVC, animated: true)
    }
    
    func toCharge() {
        self.navigationController?.pushViewController(chargeVC, animated: true)
    }
}
