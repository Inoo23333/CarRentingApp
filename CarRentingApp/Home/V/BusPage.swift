//
//  BusPage.swift
//  CarRentingApp
//
//  Created by user on 2021/1/30.
//

import UIKit

class BusPage: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
        let bgLayer = CALayer()
        bgLayer.frame = bounds
        bgLayer.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.95, alpha: 1).cgColor
        layer.addSublayer(bgLayer)
        
        //乘车码label背景
        let textBgView = UIView()
        textBgView.frame = CGRect(x: (kScreenWidth-120)/2, y: 166, width: 120, height: 40)
        // strokeCode
        let textBorderLayer1 = CALayer()
        textBorderLayer1.frame = textBgView.bounds
        textBorderLayer1.backgroundColor = UIColor(red: 0.91, green: 0.8, blue: 0.53, alpha: 1).cgColor
        textBorderLayer1.cornerRadius = 25.75
        textBgView.layer.addSublayer(textBorderLayer1)
        // fillCode
        let textBgLayer1 = CALayer()
        textBgLayer1.frame = CGRect(x: 0.5, y: 0.5, width: 119, height: 39)
        textBgLayer1.backgroundColor = UIColor(red: 0.95, green: 0.89, blue: 0.77, alpha: 1).cgColor
        textBgLayer1.cornerRadius = 20
        textBgView.layer.addSublayer(textBgLayer1)
        //乘车码label
        let textLabel = UILabel()
        let attrString1 = NSMutableAttributedString(string: "乘车码")
        textLabel.frame = CGRect(x: 29.5, y: 6, width: 70, height: 28)
        textLabel.numberOfLines = 0
        let attr2: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 20, weight: .medium) ,.foregroundColor: UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)]
        attrString1.addAttributes(attr2, range: NSRange(location: 0, length: attrString1.length))
        textLabel.attributedText = attrString1
        textBgView.addSubview(textLabel)
        addSubview(textBgView)
        
        //二维码背景
        let qrLayerView = UIView()
        qrLayerView.frame = CGRect(x: 49.5, y: 240.5, width: kScreenWidth-99, height: kScreenWidth-99)
        // strokeCode
        let qrBorderLayer1 = CALayer()
        qrBorderLayer1.frame = qrLayerView.bounds
        qrBorderLayer1.backgroundColor = UIColor(red: 0.91, green: 0.8, blue: 0.53, alpha: 1).cgColor
        qrLayerView.layer.addSublayer(qrBorderLayer1)
        //fillCode
        let qrBgLayer1 = CALayer()
        qrBgLayer1.frame = CGRect(x: 0.5, y: 0.5, width: kScreenWidth-100, height: kScreenWidth-100)
        qrBgLayer1.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        qrLayerView.layer.addSublayer(qrBgLayer1)
        
        //二维码图片
        let qrCodeView = UIImageView(frame: CGRect(x: 14, y: 14, width: kScreenWidth-99-28, height: kScreenWidth-99-28))
        qrCodeView.image = UIImage(named: "QRCode")
        qrLayerView.addSubview(qrCodeView)
        addSubview(qrLayerView)
        
        //有效期文字
        let label = UILabel()
        let attrString = NSMutableAttributedString(string: "有效期至：2020-12-30 20:00")
        label.frame = CGRect(x: (kScreenWidth-170)/2, y: 534.5+50, width: 170, height: 16.5)
        label.numberOfLines = 0
        let attr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)]
        attrString.addAttributes(attr, range: NSRange(location: 0, length: attrString.length))
        label.attributedText = attrString
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
