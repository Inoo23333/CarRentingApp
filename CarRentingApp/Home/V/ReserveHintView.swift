//
//  ReserveHintView.swift
//  CarRentingApp
//
//  Created by user on 2021/1/31.
//

import UIKit

protocol ReserveHintViewDelegate:NSObjectProtocol {
    func toReserveCar()
    func cancleReserve()
}

class ReserveHintView: UIView {
    weak var delegate:ReserveHintViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        let bgView = UIView(frame: CGRect(x: (kScreenWidth-255.5)/2, y: (kScreenHeight-285.5)/5*2, width: 255.5, height: 285.5))
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 7
        addSubview(bgView)
        
        let label1 = UILabel()
        let attrString1 = NSMutableAttributedString(string: "预约须知")
        label1.frame = CGRect(x: 85.6, y: 20, width: 90, height: 29.5)
        label1.numberOfLines = 0
        let attr1: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 21, weight: .medium),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        attrString1.addAttributes(attr1, range: NSRange(location: 0, length: attrString1.length))
        label1.attributedText = attrString1
        bgView.addSubview(label1)
        
        let label = UILabel()
        let attrString = NSMutableAttributedString(string: "请在预约后1小时内打开车门，否则因超时订单自动取消；首次开启开门系统开始计费；请在开门后5分钟内完成环境评测，提交测评报告有相应的积分奖励。")
        label.frame = CGRect(x: 18, y: 67.5, width: 222, height: 103.5)
        label.numberOfLines = 0
        let attr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .regular),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        attrString.addAttributes(attr, range: NSRange(location: 0, length: attrString.length))
        label.attributedText = attrString
        bgView.addSubview(label)
        
        //确认预约button
        let confirmButton = UIButton()
        confirmButton.frame = CGRect(x: 18, y: 194, width: 219.5, height: 41)
        let confirmLabel = UILabel()
        confirmLabel.frame = CGRect(x: 0, y: 0, width: 219.5, height: 41)
        confirmLabel.text = "确认预约"
        confirmLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        confirmLabel.textColor = .white
        confirmLabel.textAlignment = .center
        // fillCode
        let confirmBgLayer1 = CAGradientLayer()
        confirmBgLayer1.colors = [UIColor(red: 0.95, green: 0.85, blue: 0.59, alpha: 1).cgColor, UIColor(red: 0.78, green: 0.64, blue: 0.35, alpha: 1).cgColor]
        confirmBgLayer1.locations = [0, 1]
        confirmBgLayer1.frame = confirmButton.bounds
        confirmBgLayer1.cornerRadius = 24.5
        confirmBgLayer1.startPoint = CGPoint(x: 0, y: 0.5)
        confirmBgLayer1.endPoint = CGPoint(x: 0.5, y: 0.5)
        confirmButton.layer.addSublayer(confirmBgLayer1)
        confirmButton.addSubview(confirmLabel)
        bgView.addSubview(confirmButton)
        confirmButton.addTarget(self, action: #selector(comfirmReserve), for: .touchDown)
        
        //稍后再说button
        let cancelButton = UIButton()
        cancelButton.frame = CGRect(x: 18, y: 240, width: 219.5, height: 41)
//        cancelButton.backgroundColor = .blue
        let cancelLabel = UILabel()
        cancelLabel.frame = CGRect(x: 0, y: 0, width: 219.5, height: 41)
        cancelLabel.text = "稍后再说"
        cancelLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        cancelLabel.textColor = UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)
        cancelLabel.textAlignment = .center
        cancelButton.addSubview(cancelLabel)
        bgView.addSubview(cancelButton)
        cancelButton.addTarget(self, action: #selector(cancleReserve), for: .touchDown)
        
        
    }
    
    @objc func comfirmReserve() {
        print("确认预约")
        self.delegate?.toReserveCar()
    }
    
    @objc func cancleReserve() {
        print("稍后再说")
        self.delegate?.cancleReserve()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
