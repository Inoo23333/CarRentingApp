//
//  UserButton.swift
//  CarRentingApp
//
//  Created by user on 2021/2/5.
//

import UIKit

enum UserButtonType {
    case Order,Message,Setting
}

protocol UserButtonDelegate:NSObjectProtocol {
    func toMyOrder()
    func toMessage()
    func toSetting()
}

class UserButton: UIButton {
    weak var delegate: UserButtonDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(type: UserButtonType,frame: CGRect) {
        super.init(frame: frame)
        var labelString = ""
        let icon = UIImageView(frame: CGRect(x: 0, y: 20, width: 24, height: 24))
        var iconImage = UIImage()
        if type == .Order {
//            backgroundColor = .black
            addTarget(self, action: #selector(myOrder), for: .touchDown)
            iconImage = UIImage(named: "我的订单")!
            labelString = "我的订单"
        } else if type == .Message {
//            backgroundColor = .systemPink
            addTarget(self, action: #selector(myMessage), for: .touchDown)
            iconImage = UIImage(named: "我的消息")!
            labelString = "消息中心"
        } else if type == .Setting {
//            backgroundColor = .orange
            addTarget(self, action: #selector(mySettings), for: .touchDown)
            iconImage = UIImage(named: "我的设置")!
            labelString = "设置"
        } else {
            print("UserButtonType Error.")
        }
        icon.image = iconImage
        addSubview(icon)
        
        let label = UILabel(frame: CGRect(x: 32, y: 20, width: 96, height: 24))
        let attrString = NSMutableAttributedString(string: labelString)
        let attr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 16, weight: .regular),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        attrString.addAttributes(attr, range: NSRange(location: 0, length: attrString.length))
        label.attributedText = attrString
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func myOrder() {
        self.delegate?.toMyOrder()
    }
    
    @objc func myMessage() {
        self.delegate?.toMessage()
    }
    
    @objc func mySettings() {
        self.delegate?.toSetting()
    }
}
