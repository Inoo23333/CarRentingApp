//
//  UserInfoView.swift
//  CarRentingApp
//
//  Created by user on 2021/2/5.
//

import UIKit

class UserInfoView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //用户头像
        let userPic = UIImageView(frame: CGRect(x: 0, y: 0 , width: 65, height: 65))
        userPic.image = UIImage(named: "未认证头像")
        addSubview(userPic)
        //用户ID
        let userID = UILabel(frame: CGRect(x: 18+65, y: userPic.frame.origin.y, width: 150, height: 28))
        let userIDAttrString = NSMutableAttributedString(string: "用户ASOWLSP")
        let userIDAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 20, weight: .medium),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        userIDAttrString.addAttributes(userIDAttr, range: NSRange(location: 0, length: userIDAttrString.length))
        userID.attributedText = userIDAttrString
        addSubview(userID)
        //用户手机号
        let phoneNum = UILabel(frame: CGRect(x: userID.frame.origin.x, y: userID.frame.origin.y+28, width: 89, height: 21))
        let phoneNumAttrString = NSMutableAttributedString(string: "150***13029")
        let phoneNumAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 15, weight: .regular),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        phoneNumAttrString.addAttributes(phoneNumAttr, range: NSRange(location: 0, length: phoneNumAttrString.length))
        phoneNum.attributedText = phoneNumAttrString
        addSubview(phoneNum)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
