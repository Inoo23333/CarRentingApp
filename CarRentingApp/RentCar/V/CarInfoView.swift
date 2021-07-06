//
//  CarInfoView.swift
//  CarRentingApp
//
//  Created by user on 2021/2/6.
//

import UIKit

class CarInfoView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        //别克GL8豪华版
        let carLabel = UILabel(frame: CGRect(x: 12, y: 10, width: 120, height: 22.5))
        let carAttrString = NSMutableAttributedString(string: "别克GL8豪华版")
        let carAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 16, weight: .medium),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        carAttrString.addAttributes(carAttr, range: NSRange(location: 0, length: carAttrString.length))
        carLabel.attributedText = carAttrString
        addSubview(carLabel)
        
        //微型轿车
        let sizeLabel = UILabel(frame: CGRect(x: 12, y: 37, width: 50, height: 16.5))
        let sizeAttrString = NSMutableAttributedString(string: "微型轿车")
        let sizeAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        sizeAttrString.addAttributes(sizeAttr, range: NSRange(location: 0, length: sizeAttrString.length))
        sizeLabel.attributedText = sizeAttrString
        addSubview(sizeLabel)
        
        //自动 2.0T
        let engineLabel = UILabel(frame: CGRect(x: 84.5, y: 37, width: 55, height: 16.5))
        let engineAttrString = NSMutableAttributedString(string: "自动 2.0T")
        let engineAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        engineAttrString.addAttributes(engineAttr, range: NSRange(location: 0, length: engineAttrString.length))
        engineLabel.attributedText = engineAttrString
        addSubview(engineLabel)
        
        //5座
        let seatLabel = UILabel(frame: CGRect(x: 162.5, y: 37, width: 25, height: 16.5))
        let seatAttrString = NSMutableAttributedString(string: "5座")
        let seatAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        seatAttrString.addAttributes(seatAttr, range: NSRange(location: 0, length: seatAttrString.length))
        seatLabel.attributedText = seatAttrString
        addSubview(seatLabel)
        
        self.layer.cornerRadius = 6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
