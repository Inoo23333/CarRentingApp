//
//  RentPage2.swift
//  CarRentingApp
//
//  Created by user on 2021/1/30.
//

import UIKit
protocol RentPage2Delegate:NSObjectProtocol {
    func showReserveHint()
    func showRentHint()
}

class RentPage2: UIView {

    weak var delegate:RentPage2Delegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // fillCode
        let pageBgLayer1 = CALayer()
        pageBgLayer1.frame = bounds
        pageBgLayer1.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        pageBgLayer1.cornerRadius = 20
        layer.addSublayer(pageBgLayer1)
        // shadowCode
        layer.shadowColor = UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 0.3).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 1
        layer.shadowRadius = 9
        
        //小区
        let distanceLabel = UILabel()
        let distanceAttrString = NSMutableAttributedString(string: "协和小区南门，距您50m")
        distanceLabel.frame = CGRect(x: 18, y: 20.5, width: 140, height: 16.5)
        distanceLabel.numberOfLines = 0
        let distanceAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)]
        distanceAttrString.addAttributes(distanceAttr, range: NSRange(location: 0, length: distanceAttrString.length))
        distanceLabel.attributedText = distanceAttrString
        addSubview(distanceLabel)
        //车型1
        let label1 = UILabel()
        let attrString1 = NSMutableAttributedString(string: "别克GL8豪华版")
        label1.frame = CGRect(x: 18, y: 42, width: 130, height: 25)
        label1.numberOfLines = 0
        let attr1: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 18, weight: .medium),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        attrString1.addAttributes(attr1, range: NSRange(location: 0, length: attrString1.length))
        label1.attributedText = attrString1
        addSubview(label1)
        
        let label2 = UILabel()
        let attrString2 = NSMutableAttributedString(string: "微型轿车")
        label2.frame = CGRect(x: 18, y: 73.5, width: 55, height: 16.5)
        label2.numberOfLines = 0
        let attr2: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        attrString2.addAttributes(attr2, range: NSRange(location: 0, length: attrString2.length))
        label2.attributedText = attrString2
        addSubview(label2)
        
        let label3 = UILabel()
        let attrString3 = NSMutableAttributedString(string: "自动 2.0T")
        label3.frame = CGRect(x: 90.5, y: 73.5, width: 60, height: 16.5)
        label3.numberOfLines = 0
        let attr3: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        attrString3.addAttributes(attr3, range: NSRange(location: 0, length: attrString3.length))
        label3.attributedText = attrString3
        addSubview(label3)
        
        let label4 = UILabel()
        let attrString4 = NSMutableAttributedString(string: "5座")
        label4.frame = CGRect(x: 168.5, y: 73.5, width: 25, height: 16.5)
        label4.numberOfLines = 0
        let attr4: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        attrString4.addAttributes(attr4, range: NSRange(location: 0, length: attrString4.length))
        label4.attributedText = attrString4
        addSubview(label4)
        
        //搜索其它区域
        let label5 = UILabel()
        let attrString5 = NSMutableAttributedString(string: "搜索其它区域")
        label5.frame = CGRect(x: kScreenWidth-121, y: 16, width: 95, height: 21)
        label5.numberOfLines = 0
        let attr5: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 15, weight: .regular),.foregroundColor: UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)]
        attrString5.addAttributes(attr5, range: NSRange(location: 0, length: attrString5.length))
        label5.attributedText = attrString5
        addSubview(label5)
        
        //箭头
        let arrow = UIImageView(frame: CGRect(x: kScreenWidth-31+5, y: 18, width: 15, height: 15))
        arrow.image = UIImage(named: "Arrow2")
        addSubview(arrow)
        
        let carDetailView = UIView()
        carDetailView.frame = CGRect(x: 18, y: 107, width: kScreenWidth-36, height: 60)
        // fillCode
        let carDetailbgLayer1 = CALayer()
        carDetailbgLayer1.frame = carDetailView.bounds
        carDetailbgLayer1.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1).cgColor
        carDetailView.layer.addSublayer(carDetailbgLayer1)
        addSubview(carDetailView)
        
        let label6 = UILabel()
        let attrString6 = NSMutableAttributedString(string: "车牌号")
        label6.frame = CGRect(x: 16, y: 9, width: 40, height: 15)
        label6.numberOfLines = 0
        let attr6: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 11, weight: .regular),.foregroundColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)]
        attrString6.addAttributes(attr6, range: NSRange(location: 0, length: attrString6.length))
        label6.attributedText = attrString6
        carDetailView.addSubview(label6)
        
        let label7 = UILabel()
        let attrString7 = NSMutableAttributedString(string: "实时状况")
        label7.frame = CGRect(x: 133, y: 9, width: 50, height: 15)
        label7.numberOfLines = 0
        let attr7: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 11, weight: .regular),.foregroundColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)]
        attrString7.addAttributes(attr7, range: NSRange(location: 0, length: attrString7.length))
        label7.attributedText = attrString7
        carDetailView.addSubview(label7)
        
        let label8 = UILabel()
        let attrString8 = NSMutableAttributedString(string: "沪FY7600")
        label8.frame = CGRect(x: 16, y: 29.5, width: 75, height: 21)
        label8.numberOfLines = 0
        let attr8: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 15, weight: .medium),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        attrString8.addAttributes(attr8, range: NSRange(location: 0, length: attrString8.length))
        label8.attributedText = attrString8
        carDetailView.addSubview(label8)
        
        let label9 = UILabel()
        let attrString9 = NSMutableAttributedString(string: "续航里程245.7公里（估算）")
        label9.frame = CGRect(x: 133, y: 29.5, width: 200, height: 21)
        label9.numberOfLines = 0
        let attr9: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 15, weight: .medium),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        attrString9.addAttributes(attr9, range: NSRange(location: 0, length: attrString9.length))
        label9.attributedText = attrString9
        carDetailView.addSubview(label9)
        
        //预约button
        let reserveButton = UIButton()
        reserveButton.frame = CGRect(x: 18, y: 191, width: (kScreenWidth-54)/2, height: 50)
        let reserveButtonBorderLayer1 = CALayer()
        reserveButtonBorderLayer1.frame = reserveButton.bounds
        reserveButtonBorderLayer1.borderColor = UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1).cgColor
        reserveButtonBorderLayer1.cornerRadius = 24.5
        reserveButtonBorderLayer1.borderWidth = 0.5
        let reserveLabel = UILabel()
        reserveLabel.frame = CGRect(x: 0, y: 0, width: (kScreenWidth-54)/2, height: 50)
        reserveLabel.text = "预约"
        reserveLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        reserveLabel.textColor = UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)
        reserveLabel.textAlignment = .center
        
        reserveButton.layer.addSublayer(reserveButtonBorderLayer1)
        reserveButton.addSubview(reserveLabel)
        reserveButton.addTarget(self, action: #selector(showReserveHint), for: .touchDown)
        addSubview(reserveButton)
        
        
        //现在租button
        let rentButton = UIButton()
        rentButton.frame = CGRect(x: (kScreenWidth-54)/2+36, y: 191, width: (kScreenWidth-54)/2, height: 50)
        let rentLabel = UILabel()
        rentLabel.frame = CGRect(x: 0, y: 0, width: (kScreenWidth-54)/2, height: 50)
        rentLabel.text = "现在租"
        rentLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        rentLabel.textColor = .white
        rentLabel.textAlignment = .center
        // fillCode
        let rentBgLayer1 = CAGradientLayer()
        rentBgLayer1.colors = [UIColor(red: 0.95, green: 0.85, blue: 0.59, alpha: 1).cgColor, UIColor(red: 0.78, green: 0.64, blue: 0.35, alpha: 1).cgColor]
        rentBgLayer1.locations = [0, 1]
        rentBgLayer1.frame = rentButton.bounds
        rentBgLayer1.cornerRadius = 24.5
        rentBgLayer1.startPoint = CGPoint(x: 0, y: 0.5)
        rentBgLayer1.endPoint = CGPoint(x: 0.5, y: 0.5)
        
        rentButton.layer.addSublayer(rentBgLayer1)
        rentButton.addSubview(rentLabel)
        rentButton.addTarget(self, action: #selector(showRentHint), for: .touchDown)
        addSubview(rentButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func showReserveHint() {
        self.delegate?.showReserveHint()
    }
    
    @objc func showRentHint() {
        self.delegate?.showRentHint()
    }
}
