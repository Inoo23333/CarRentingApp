//
//  IDPage3View.swift
//  CarRentingApp
//
//  Created by user on 2021/2/9.
//

import UIKit

protocol IDPage3Delegate: NSObjectProtocol {
    func toPay()
}

class IDPage3View: UIView {
    weak var delegate: IDPage3Delegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        //押金说明
        let instructLabel = UILabel()
        let instructAttrString = NSMutableAttributedString(string: "押金说明")
        instructLabel.frame = CGRect(x: (kScreenWidth-60)/2, y: 15, width: 65, height: 21)
        instructLabel.numberOfLines = 0
        let instructAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 15, weight: .medium),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        instructAttrString.addAttributes(instructAttr, range: NSRange(location: 0, length: instructAttrString.length))
        instructLabel.attributedText = instructAttrString
        addSubview(instructLabel)
        
        let detailLabel = UILabel()
        let detailAttrString = NSMutableAttributedString(string: "取车时冻结2000元租车押金，若无车损还车时解冻当押金无冻结时，可随时退还")
        detailLabel.frame = CGRect(x: (kScreenWidth-340)/2, y: 42, width: 340, height: 40)
        detailLabel.numberOfLines = 0
        let detailAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .regular),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        detailAttrString.addAttributes(detailAttr, range: NSRange(location: 0, length: detailAttrString.length))
        detailLabel.attributedText = detailAttrString
        addSubview(detailLabel)
        
        //bolck
        let lineView = UIView(frame: CGRect(x: 0, y: 100, width: kScreenWidth, height: 12))
        lineView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        addSubview(lineView)
        
        //押金金额label
        let costLabel = UILabel(frame: CGRect(x: 18, y: 128, width: 60, height: 20))
        let costAttrString = NSMutableAttributedString(string: "押金金额")
        costLabel.numberOfLines = 0
        let costAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .medium),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        costAttrString.addAttributes(costAttr, range: NSRange(location: 0, length: costAttrString.length))
        costLabel.attributedText = costAttrString
        addSubview(costLabel)
        
        //押金金额costNumLabel
        let costNumLabel = UILabel()
        let costNumAttrString = NSMutableAttributedString(string: "￥2000")
        costNumLabel.frame = CGRect(x: kScreenWidth-18-48, y: 128, width: 55, height: 20.5)
        costNumLabel.numberOfLines = 0
        let costNumAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .medium),.foregroundColor: UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)]
        costNumAttrString.addAttributes(costNumAttr, range: NSRange(location: 0, length: costNumAttrString.length))
        costNumLabel.attributedText = costNumAttrString
        addSubview(costNumLabel)
        
        //支付方式label
        let payMethodLabel = UILabel(frame: CGRect(x: 18, y: 180.5, width: 60, height: 20))
        let payMethodAttrString = NSMutableAttributedString(string: "支付方式")
        payMethodLabel.numberOfLines = 0
        let payMethodAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .medium),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        payMethodAttrString.addAttributes(payMethodAttr, range: NSRange(location: 0, length: payMethodAttrString.length))
        payMethodLabel.attributedText = payMethodAttrString
        addSubview(payMethodLabel)
        
        //方式label
        let methodLabel = UILabel()
        let methodAttrString = NSMutableAttributedString(string: "智荟金桥")
        methodLabel.frame = CGRect(x: kScreenWidth-56-18, y: 180.5, width: 60, height: 20)
        methodLabel.numberOfLines = 0
        let methodAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .regular),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        methodAttrString.addAttributes(methodAttr, range: NSRange(location: 0, length: methodAttrString.length))
        methodLabel.attributedText = methodAttrString
        addSubview(methodLabel)
    
        //分割线2
        let lineView2 = UIView(frame: CGRect(x: 18, y: 164, width: kScreenWidth-36, height: 0.5))
        lineView2.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        addSubview(lineView2)
        //分割线3
        let lineView3 = UIView(frame: CGRect(x: 18, y: 216.5, width: kScreenWidth-36, height: 0.5))
        lineView3.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        addSubview(lineView3)
        
        //下一步button
        let nextButton = UIButton(frame: CGRect(x: 18, y: self.frame.height-70, width: kScreenWidth-36, height: 50))
        let nextLabel = UILabel()
        nextLabel.frame = CGRect(x: 0, y: 0, width: kScreenWidth-36, height: 50)
        nextLabel.text = "去支付"
        nextLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        nextLabel.textColor = .white
        nextLabel.textAlignment = .center
        // fillCode
        let nextLayer = CAGradientLayer()
        nextLayer.colors = [UIColor(red: 0.95, green: 0.85, blue: 0.59, alpha: 1).cgColor, UIColor(red: 0.78, green: 0.64, blue: 0.35, alpha: 1).cgColor]
        nextLayer.locations = [0, 1]
        nextLayer.frame = nextButton.bounds
        nextLayer.cornerRadius = 24.5
        nextLayer.startPoint = CGPoint(x: 0, y: 0.5)
        nextLayer.endPoint = CGPoint(x: 0.5, y: 0.5)
        nextButton.layer.addSublayer(nextLayer)
        nextButton.addSubview(nextLabel)
        addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(toNext), for: .touchDown)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func toNext() {
        self.delegate?.toPay()
    }
}
