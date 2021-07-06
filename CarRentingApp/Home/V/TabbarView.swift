//
//  TabbarView.swift
//  CarRentingApp
//
//  Created by user on 2021/1/30.
//

import UIKit
protocol TabbarViewDelegate:NSObjectProtocol {
    func showRentPage1()
    func showBusPage()
    func showRentPage2()
}

class TabbarView: UIView {
    weak var delegate:TabbarViewDelegate?
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let userPic = UIImageView()
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    
    let barline = UIView()
    
    func initTabbar(controller: UIViewController) {
        backgroundColor = .white
        frame = CGRect(x: 12, y: 46/667*kScreenHeight, width: kScreenWidth-24, height: 48)
        layer.cornerRadius = 30.5
        
        userPic.image = UIImage(named: "userPic")
        userPic.frame = CGRect(x: 4, y: 4, width: 40.5, height: 40.5)
        userPic.layer.cornerRadius = 40.5/2
        addSubview(userPic)
        
        button1.frame = CGRect(x: 71, y: 11, width: (kScreenWidth-99)/3, height: 21)
//        button1.backgroundColor = .black
        let attrString1 = NSMutableAttributedString(string: "信用租车")
        label1.frame = button1.bounds
        label1.numberOfLines = 0
        let attr1: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 15, weight: .medium),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        attrString1.addAttributes(attr1, range: NSRange(location: 0, length: attrString1.length))
        label1.attributedText = attrString1
        button1.addSubview(label1)
        
        button1.addTarget(self, action: #selector(toPage1), for: .touchDown)
        addSubview(button1)
        
        button2.frame = CGRect(x: 71+(kScreenWidth-99)/3, y: 11, width: (kScreenWidth-99)/3, height: 21)
//        button2.backgroundColor = .blue
        let attrString2 = NSMutableAttributedString(string: "共享巴士")
        label2.frame = button2.bounds
        label2.numberOfLines = 0
        let attr2: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 15, weight: .regular),.foregroundColor: UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)]
        attrString2.addAttributes(attr2, range: NSRange(location: 0, length: attrString2.length))
        label2.attributedText = attrString2
        button2.addSubview(label2)
        button2.addTarget(self, action: #selector(toPage2), for: .touchDown)
        addSubview(button2)
        
        button3.frame = CGRect(x: 71+(kScreenWidth-99)/3*2, y: 11, width: (kScreenWidth-99)/3, height: 21)
//        button3.backgroundColor = .yellow
        let attrString3 = NSMutableAttributedString(string: "分时租赁")
        label3.frame = button3.bounds
        label3.numberOfLines = 0
        let attr3: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 15, weight: .regular),.foregroundColor: UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)]
        attrString3.addAttributes(attr3, range: NSRange(location: 0, length: attrString3.length))
        label3.attributedText = attrString3
        button3.addSubview(label3)
        button3.addTarget(self, action: #selector(toPage3), for: .touchDown)
        addSubview(button3)
        
        barline.frame = CGRect(x: 92.5, y: 35.5, width: 19.5, height: 4.5)
        // fillCode
        let bgLayer1 = CAGradientLayer()
        bgLayer1.colors = [UIColor(red: 0.95, green: 0.85, blue: 0.59, alpha: 1).cgColor, UIColor(red: 0.78, green: 0.64, blue: 0.35, alpha: 1).cgColor]
        bgLayer1.locations = [0, 1]
        bgLayer1.frame = barline.bounds
        bgLayer1.startPoint = CGPoint(x: 0, y: 0.5)
        bgLayer1.endPoint = CGPoint(x: 0.5, y: 0.5)
        bgLayer1.cornerRadius = 3.25
        barline.layer.addSublayer(bgLayer1)
        addSubview(barline)
    }
    //信用租车
    @objc func toPage1() {
        label1.font = .systemFont(ofSize: 15, weight: .medium)
        label1.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        label2.font = .systemFont(ofSize: 15, weight: .regular)
        label2.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
        label3.font = .systemFont(ofSize: 15, weight: .regular)
        label3.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
        
        self.delegate?.showRentPage1()
        UIView.animate(withDuration: 0.3) {
            self.barline.frame = CGRect(x: 92.5, y: 35.5, width: 19.5, height: 4.5)
        }
    }
    //共享巴士
    @objc func toPage2() {
        label1.font = .systemFont(ofSize: 15, weight: .regular)
        label1.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
        label2.font = .systemFont(ofSize: 15, weight: .medium)
        label2.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        label3.font = .systemFont(ofSize: 15, weight: .regular)
        label3.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
        
        self.delegate?.showBusPage()
        UIView.animate(withDuration: 0.3) {
            self.barline.frame = CGRect(x: 92.5+(kScreenWidth-99)/3, y: 35.5, width: 19.5, height: 4.5)
        }
    }
    //分时租赁
    @objc func toPage3() {
        label1.font = .systemFont(ofSize: 15, weight: .regular)
        label1.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
        label2.font = .systemFont(ofSize: 15, weight: .regular)
        label2.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
        label3.font = .systemFont(ofSize: 15, weight: .medium)
        label3.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        
        self.delegate?.showRentPage2()
        UIView.animate(withDuration: 0.3) {
            self.barline.frame = CGRect(x: 92.5+(kScreenWidth-99)/3*2, y: 35.5, width: 19.5, height: 4.5)
        }
    }
}
