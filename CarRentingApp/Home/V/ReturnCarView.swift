//
//  ReturnCarView.swift
//  CarRentingApp
//
//  Created by user on 2021/2/9.
//

import UIKit

class ReturnCarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        //还车门店Label
        let returnCarLabel = UILabel(frame: CGRect(x: 18, y: 10, width: 50, height: 16.5))
        let returnCarAttrString = NSMutableAttributedString(string: "还车门店")
        returnCarLabel.numberOfLines = 0
        let returnCarAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)]
        returnCarAttrString.addAttributes(returnCarAttr, range: NSRange(location: 0, length: returnCarAttrString.length))
        returnCarLabel.attributedText = returnCarAttrString
        addSubview(returnCarLabel)
        
        //请选择
        let pickLabel = UILabel(frame: CGRect(x: 18, y: 31.5, width: 60, height: 25))
        let pickAttrString = NSMutableAttributedString(string: "请选择")
        pickLabel.numberOfLines = 0
        let pickAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 18, weight: .medium),.foregroundColor: UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1)]
        pickAttrString.addAttributes(pickAttr, range: NSRange(location: 0, length: pickAttrString.length))
        pickLabel.attributedText = pickAttrString
        addSubview(pickLabel)
        
        //箭头1
        let arrow1 = UIImageView(frame: CGRect(x: 80, y: 32, width: 20, height: 20))
        arrow1.image = UIImage(named: "Arrow1")
        addSubview(arrow1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
