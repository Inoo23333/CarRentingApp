//
//  RentTabView.swift
//  CarRentingApp
//
//  Created by user on 2021/2/6.
//

import UIKit

protocol RentTabViewDelegate: NSObjectProtocol {
    func toPos()
    func toGuide()
    func toCharge()
}

class RentTabView: UIView {
    
    weak var delegate: RentTabViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        //RentTabView背景view
        let cHeight = 60/339*(kScreenWidth-36)
        let creditBGView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth-36, height: cHeight))
        creditBGView.backgroundColor = .white
        // shadowCode
        creditBGView.layer.shadowColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 0.5).cgColor
        creditBGView.layer.shadowOffset = CGSize(width: 0, height: 3)
        creditBGView.layer.shadowOpacity = 1
        creditBGView.layer.shadowRadius = 12
        creditBGView.layer.cornerRadius = 6
        addSubview(creditBGView)
        
        let blockWidth = creditBGView.frame.width/3
        
        //车辆位置icon
        let posIcon = UIImageView(frame: CGRect(x: (blockWidth-24)/2, y: 7.5, width: 24, height: 24))
        posIcon.image = UIImage(named: "位置")
        creditBGView.addSubview(posIcon)
        //车辆位置label
        let posLabel = UILabel(frame: CGRect(x: (blockWidth-48)/2, y: 34, width: 50, height: 20))
        let posAttrString = NSMutableAttributedString(string: "车辆位置")
        let posAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        posAttrString.addAttributes(posAttr, range: NSRange(location: 0, length: posAttrString.length))
        posLabel.attributedText = posAttrString
        creditBGView.addSubview(posLabel)
        //车辆位置button
        let posButton = UIButton(frame: CGRect(x: 0, y: 0, width: blockWidth, height: cHeight))
//        posButton.backgroundColor = .systemPink
        posButton.addTarget(self, action: #selector(pos), for: .touchDown)
        creditBGView.addSubview(posButton)
        
        //还车导览icon
        let guideIcon = UIImageView(frame: CGRect(x: blockWidth+(blockWidth-20)/2, y: 10, width: 24, height: 24))
        guideIcon.image = UIImage(named: "Car")
        creditBGView.addSubview(guideIcon)
        //还车导览label
        let guideLabel = UILabel(frame: CGRect(x: blockWidth+(blockWidth-48)/2, y: 34, width: 50, height: 20))
        let guideAttrString = NSMutableAttributedString(string: "还车导览")
        let guideAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        guideAttrString.addAttributes(guideAttr, range: NSRange(location: 0, length: guideAttrString.length))
        guideLabel.attributedText = guideAttrString
        creditBGView.addSubview(guideLabel)
        //还车导览button
        let guideButton = UIButton(frame: CGRect(x: blockWidth, y: 0, width: blockWidth, height: cHeight))
//        guideButton.backgroundColor = .purple
        guideButton.addTarget(self, action: #selector(guide), for: .touchDown)
        creditBGView.addSubview(guideButton)
        
        //充电桩导览icon
        let chargeIcon = UIImageView(frame: CGRect(x: 2*blockWidth+(blockWidth-24)/2, y: 12, width: 24, height: 24))
        chargeIcon.image = UIImage(named: "充电")
        creditBGView.addSubview(chargeIcon)
        //充电桩导览label
        let chargeLabel = UILabel(frame: CGRect(x: 2*blockWidth+(blockWidth-60)/2, y: 34, width: 65, height: 20))
        let chargeAttrString = NSMutableAttributedString(string: "充电桩导览")
        let chargeAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        chargeAttrString.addAttributes(chargeAttr, range: NSRange(location: 0, length: chargeAttrString.length))
        chargeLabel.attributedText = chargeAttrString
        creditBGView.addSubview(chargeLabel)
        //充电桩导览button
        let chargeButton = UIButton(frame: CGRect(x: 2*blockWidth, y: 0, width: blockWidth, height: cHeight))
//        chargeButton.backgroundColor = .black
//        chargeButton.addTarget(self, action: #selector(charge), for: .touchDown)
        creditBGView.addSubview(chargeButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func pos() {
        self.delegate?.toPos()
    }
    
    @objc func guide() {
        self.delegate?.toGuide()
    }
    
//    @objc func charge() {
//        self.delegate?.toCharge()
//    }
}
