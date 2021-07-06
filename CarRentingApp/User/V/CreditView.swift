//
//  CreditView.swift
//  CarRentingApp
//
//  Created by user on 2021/2/5.
//

import UIKit

protocol CreditViewDelegate: NSObjectProtocol {
    func toIdentify()
    func toCredit()
}

class CreditView: UIView {
    
    weak var delegate: CreditViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        //信用积分背景view
        let cHeight = 66/339*(kScreenWidth-36)
        let creditBGView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth-36, height: cHeight))
        creditBGView.backgroundColor = .white
        // shadowCode
        creditBGView.layer.shadowColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 0.5).cgColor
        creditBGView.layer.shadowOffset = CGSize(width: 0, height: 3)
        creditBGView.layer.shadowOpacity = 1
        creditBGView.layer.shadowRadius = 12
        addSubview(creditBGView)
        let blockWidth = creditBGView.frame.width/3
        //信用积分creditLabel
        let creditLabel = UILabel(frame: CGRect(x: (blockWidth-40)/2, y: 13.5, width: 40, height: 16.5))
        let creditAttrString = NSMutableAttributedString(string: "信用分")
        let creditAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)]
        creditAttrString.addAttributes(creditAttr, range: NSRange(location: 0, length: creditAttrString.length))
        creditLabel.attributedText = creditAttrString
        creditBGView.addSubview(creditLabel)
        //信用积分值creditNum
        let creditNum = UILabel(frame: CGRect(x: (blockWidth-37)/2, y: 34, width: 40, height: 20))
        let creditNumAttrString = NSMutableAttributedString(string: "1000")
        let creditNumAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .medium),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        creditNumAttrString.addAttributes(creditNumAttr, range: NSRange(location: 0, length: creditNumAttrString.length))
        creditNum.attributedText = creditNumAttrString
        creditBGView.addSubview(creditNum)
        
        //信用积分button
        let posButton = UIButton(frame: CGRect(x: 0, y: 0, width: blockWidth, height: cHeight))
        posButton.addTarget(self, action: #selector(credit), for: .touchDown)
        creditBGView.addSubview(posButton)
        
        //积分pointLabel
        let pointLabel = UILabel(frame: CGRect(x: blockWidth+(blockWidth-30)/2, y: 13.5, width: 30, height: 16.5))
        let pointAttrString = NSMutableAttributedString(string: "积分")
        pointLabel.numberOfLines = 0
        let pointAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)]
        pointAttrString.addAttributes(pointAttr, range: NSRange(location: 0, length: pointAttrString.length))
        pointLabel.attributedText = pointAttrString
        creditBGView.addSubview(pointLabel)
        //积分值pointNum
        let pointNum = UILabel(frame: CGRect(x: blockWidth+(blockWidth-30)/2, y: 34, width: 30, height: 20))
        let pointNumAttrString = NSMutableAttributedString(string: "200")
        let pointNumAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .medium),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        pointNumAttrString.addAttributes(pointNumAttr, range: NSRange(location: 0, length: pointNumAttrString.length))
        pointNum.attributedText = pointNumAttrString
        creditBGView.addSubview(pointNum)
        
        //认证identifyLabel
        let identifyLabel = UILabel(frame: CGRect(x: 2*blockWidth+(blockWidth-30)/2, y: 13.5, width: 30, height: 16.5))
        let identifyAttrString = NSMutableAttributedString(string: "认证")
        identifyLabel.numberOfLines = 0
        let identifyAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)]
        identifyAttrString.addAttributes(identifyAttr, range: NSRange(location: 0, length: identifyAttrString.length))
        identifyLabel.attributedText = identifyAttrString
        creditBGView.addSubview(identifyLabel)
        //认证isIdentified
        let isIdentified = UILabel(frame: CGRect(x: 2*blockWidth+(blockWidth-45)/2, y: 34, width: 45, height: 20))
        let isIdentifiedAttrString = NSMutableAttributedString(string: "未认证")
        let isIdentifiedAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .medium),.foregroundColor: UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)]
        isIdentifiedAttrString.addAttributes(isIdentifiedAttr, range: NSRange(location: 0, length: isIdentifiedAttrString.length))
        isIdentified.attributedText = isIdentifiedAttrString
        creditBGView.addSubview(isIdentified)
        //认证button
        let identifyButton = UIButton(frame: CGRect(x: 2*blockWidth, y: 0, width: blockWidth, height: cHeight))
        identifyButton.addTarget(self, action: #selector(identify), for: .touchDown)
        creditBGView.addSubview(identifyButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func credit() {
        self.delegate?.toCredit()
        print(1)
    }
    
    @objc func identify() {
        self.delegate?.toIdentify()
        print(3)
    }
}
