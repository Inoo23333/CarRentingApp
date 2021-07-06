//
//  swift
//  CarRentingApp
//
//  Created by user on 2021/2/5.
//

import UIKit

enum TitleViewType {
    case Order,Message,Setting
}

class TitleView: UIView {
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.shadowColor = UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 0.3).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 1
        layer.shadowRadius = 9
        
        let titleLabel = UILabel()
        let attrString = NSMutableAttributedString(string: title)
        titleLabel.frame = CGRect(x: (kScreenWidth-75)/2, y: frame.height-35, width: 100, height: 25)
        titleLabel.numberOfLines = 0
        let attr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 18, weight: .medium),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        attrString.addAttributes(attr, range: NSRange(location: 0, length: attrString.length))
        titleLabel.attributedText = attrString
        addSubview(titleLabel)
    }
    
    init(frame: CGRect, type:TitleViewType) {
        super.init(frame: frame)
        var title = ""
        if type == .Order {
            title = "我的订单"
        } else if type == .Message {
            title = "消息中心"
            let icon = UIImageView(frame: CGRect(x: self.frame.width-24-12, y: self.frame.height-24-12, width: 24, height: 24))
            icon.image = UIImage(named: "清空图形")
            addSubview(icon)
        } else if type == .Setting {
            title = "设置"
        } else {
            print("TitleViewType Error.")
        }
        
        backgroundColor = .white
        layer.shadowColor = UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 0.3).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 1
        layer.shadowRadius = 9
        
        let titleLabel = UILabel()
        let attrString = NSMutableAttributedString(string: title)
        titleLabel.frame = CGRect(x: (kScreenWidth-75)/2, y: frame.height-35, width: 75, height: 25)
        titleLabel.numberOfLines = 0
        let attr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 18, weight: .medium),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        attrString.addAttributes(attr, range: NSRange(location: 0, length: attrString.length))
        titleLabel.attributedText = attrString
        addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
