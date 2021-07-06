//
//  IDPage1.swift
//  CarRentingApp
//
//  Created by user on 2021/2/9.
//

import UIKit

protocol IDPage1Delegate: NSObjectProtocol {
    func toPage2()
}

class IDPage1View: UIView {
    weak var delegate: IDPage1Delegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //姓名label
        let nameLabel = UILabel(frame: CGRect(x: 18, y: 16, width: 30, height: 20))
        let nameAttrString = NSMutableAttributedString(string: "姓名")
        nameLabel.numberOfLines = 0
        let nameAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .medium),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        nameAttrString.addAttributes(nameAttr, range: NSRange(location: 0, length: nameAttrString.length))
        nameLabel.attributedText = nameAttrString
        addSubview(nameLabel)
        
        //姓名输入框
        let nameText = UITextField(frame: CGRect(x: 50, y: 16, width: kScreenWidth-50-18, height: 23))
        nameText.placeholder = "请填写"
        nameText.textAlignment = .right
        addSubview(nameText)
        
        //分割线1
        let lineView1 = UIView(frame: CGRect(x: 18, y: 52, width: kScreenWidth-36, height: 0.5))
        lineView1.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        addSubview(lineView1)
        
        //ID身份证号label
        let idLabel = UILabel(frame: CGRect(x: 18, y: 68.5, width: 60, height: 20))
        let idAttrString = NSMutableAttributedString(string: "身份证号")
        idLabel.numberOfLines = 0
        let idAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .medium),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        idAttrString.addAttributes(idAttr, range: NSRange(location: 0, length: idAttrString.length))
        idLabel.attributedText = idAttrString
        addSubview(idLabel)
        
        //id输入框
        let idText = UITextField(frame: CGRect(x: 80, y: 68.5, width: kScreenWidth-80-50, height: 23))
        idText.placeholder = "请填写或OCR自动识别"
        idText.textAlignment = .right
        addSubview(idText)
        
        //orc icon
        let orcIcon = UIImageView(frame: CGRect(x: kScreenWidth-40, y: 70, width: 16, height: 16))
        orcIcon.image = UIImage(named: "ORC")
        addSubview(orcIcon)
        
        //分割线2
        let lineView2 = UIView(frame: CGRect(x: 18, y: 105, width: kScreenWidth-36, height: 0.5))
        lineView2.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        addSubview(lineView2)
        
        //身份证照片label
        let photoLabel = UILabel(frame: CGRect(x: 18, y: 121, width: 75, height: 20))
        let photoAttrString = NSMutableAttributedString(string: "身份证照片")
        photoLabel.numberOfLines = 0
        let photoAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .medium),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        photoAttrString.addAttributes(photoAttr, range: NSRange(location: 0, length: photoAttrString.length))
        photoLabel.attributedText = photoAttrString
        addSubview(photoLabel)
        
        //身份证正面BG
        let frontBGView = UIView(frame: CGRect(x: 18, y: 152.5, width: (kScreenWidth-36-12)/2, height: 104.5))
        frontBGView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        frontBGView.layer.cornerRadius = 6
        addSubview(frontBGView)
        //身份证正面label
        let frontLabel = UILabel(frame: CGRect(x: (frontBGView.frame.width-70)/2, y: 33, width: 80, height: 20))
        let frontAttrString = NSMutableAttributedString(string: "身份证正面")
        let frontAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .medium),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        frontAttrString.addAttributes(frontAttr, range: NSRange(location: 0, length: frontAttrString.length))
        frontLabel.attributedText = frontAttrString
        frontBGView.addSubview(frontLabel)
        //点击上传label
        let upLabel1 = UILabel(frame: CGRect(x: (frontBGView.frame.width-48)/2, y: 55.5, width: 60, height: 16.5))
        let upAttrString1 = NSMutableAttributedString(string: "点击上传")
        let upAttr1: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)]
        upAttrString1.addAttributes(upAttr1, range: NSRange(location: 0, length: upAttrString1.length))
        upLabel1.attributedText = upAttrString1
        frontBGView.addSubview(upLabel1)
        
        //身份证反面BG
        let backBGView = UIView(frame: CGRect(x: (kScreenWidth-36-12)/2+30, y: 152.5, width: (kScreenWidth-36-12)/2, height: 104.5))
        backBGView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        backBGView.layer.cornerRadius = 6
        addSubview(backBGView)
        //身份证反面label
        let backLabel = UILabel(frame: CGRect(x: (frontBGView.frame.width-84)/2, y: 33, width: 90, height: 20))
        let backAttrString = NSMutableAttributedString(string: "手持身份证照")
        let backAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .medium),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        backAttrString.addAttributes(backAttr, range: NSRange(location: 0, length: backAttrString.length))
        backLabel.attributedText = backAttrString
        backBGView.addSubview(backLabel)
        //点击上传label2
        let upLabel2 = UILabel(frame: CGRect(x: (frontBGView.frame.width-48)/2, y: 55.5, width: 60, height: 16.5))
        let upAttrString2 = NSMutableAttributedString(string: "点击上传")
        let upAttr2: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)]
        upAttrString2.addAttributes(upAttr2, range: NSRange(location: 0, length: upAttrString2.length))
        upLabel2.attributedText = upAttrString2
        backBGView.addSubview(upLabel2)
        
        //分割线3
        let lineView3 = UIView(frame: CGRect(x: 18, y: 273, width: kScreenWidth-36, height: 0.5))
        lineView3.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        addSubview(lineView3)
        
        //人脸认证facelabel
        let faceLabel = UILabel(frame: CGRect(x: 18, y: 289.5, width: 60, height: 20))
        let faceAttrString = NSMutableAttributedString(string: "人脸认证")
        let faceAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .medium),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        faceAttrString.addAttributes(faceAttr, range: NSRange(location: 0, length: faceAttrString.length))
        faceLabel.attributedText = faceAttrString
        addSubview(faceLabel)
        
        //请认证
        let verifyLabel = UILabel(frame: CGRect(x: kScreenWidth-18-45, y: 289.5, width: 45, height: 20))
        let verifyAttrString = NSMutableAttributedString(string: "请认证")
        let verifyAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .medium),.foregroundColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)]
        verifyAttrString.addAttributes(verifyAttr, range: NSRange(location: 0, length: verifyAttrString.length))
        verifyLabel.attributedText = verifyAttrString
        addSubview(verifyLabel)
        
        //分割线4
        let lineView4 = UIView(frame: CGRect(x: 18, y: 325.5, width: kScreenWidth-36, height: 0.5))
        lineView4.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        addSubview(lineView4)
        
        //tipLabel
        let tipLabel = UILabel()
        let tipAttrString = NSMutableAttributedString(string: "您上传的信息仅限用于身份认证")
        tipLabel.frame = CGRect(x: (kScreenWidth-172)/2, y: self.frame.height-100, width: 180, height: 21)
        tipLabel.numberOfLines = 0
        let tipAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)]
        tipAttrString.addAttributes(tipAttr, range: NSRange(location: 0, length: tipAttrString.length))
        tipLabel.attributedText = tipAttrString
        addSubview(tipLabel)
        
        //下一步button
        let nextButton = UIButton(frame: CGRect(x: 18, y: self.frame.height-70, width: kScreenWidth-36, height: 50))
        let nextLabel = UILabel()
        nextLabel.frame = CGRect(x: 0, y: 0, width: kScreenWidth-36, height: 50)
        nextLabel.text = "保存并去下一步"
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
        self.delegate?.toPage2()
    }
}
