//
//  CarDetailView.swift
//  CarRentingApp
//
//  Created by user on 2021/2/6.
//

import UIKit

class CarDetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let carDetailView = UIView()
        carDetailView.frame = self.bounds
        carDetailView.backgroundColor = .white
        carDetailView.layer.cornerRadius = 6
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
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
