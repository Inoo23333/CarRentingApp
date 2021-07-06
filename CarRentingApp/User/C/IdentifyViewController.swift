//
//  IdentifyViewController.swift
//  CarRentingApp
//
//  Created by user on 2021/2/6.
//

import UIKit

class IdentifyViewController: UIViewController, BackButton2Delegate, IDPage1Delegate, IDPage2Delegate, IDPage3Delegate{
    func toIdFrontPic() {
        let imageVC = UIImagePickerController()
        self.navigationController?.pushViewController(imageVC, animated: true)
    }
    
    func toIdBackPic() {
        let imageVC = UIImagePickerController()
        self.navigationController?.pushViewController(imageVC, animated: true)
    }
    
    
    let page1 = IDPage1View(frame: CGRect(x: 0, y: kScreenWidth == 375 ? 183 : 200, width: kScreenWidth, height: kScreenHeight-(kScreenWidth == 375 ? 183 : 200)))
    
    let page2 = IDPage2View(frame: CGRect(x: 0, y: kScreenWidth == 375 ? 183 : 200, width: kScreenWidth, height: kScreenHeight-(kScreenWidth == 375 ? 183 : 200)))
    let page3 = IDPage3View(frame: CGRect(x: 0, y: kScreenWidth == 375 ? 183 : 200, width: kScreenWidth, height: kScreenHeight-(kScreenWidth == 375 ? 183 : 200)))
    
    let triangle1 = UIImageView()
    let triangle2 = UIImageView()
    let triangle3 = UIImageView()
    
    let card1 = UIImageView()
    let card2 = UIImageView()
    let card3 = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)

        let bgHeight: CGFloat = kScreenWidth == 375 ? 183 : 200
        let bg = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: bgHeight))
        bg.image = UIImage(named: "身份认证背景")
        view.addSubview(bg)
        
        let buttonHeight: CGFloat = kScreenWidth == 375 ? 30 : 50
        //返回按钮
        let backButton = BackButton2(frame: CGRect(x: 12, y: buttonHeight, width: 24, height: 24))
        backButton.delegate = self
        view.addSubview(backButton)
        
        let cardWidth = (kScreenWidth-36-22)/3
        let cardHeight = 82/106*cardWidth
        
        card1.frame = CGRect(x: 18, y: bgHeight-16-cardHeight, width: cardWidth, height: cardHeight)
        card1.image = UIImage(named: "id1-1")
        bg.addSubview(card1)
        
        card2.frame = CGRect(x: 18+cardWidth+11, y: bgHeight-16-cardHeight, width: cardWidth, height: cardHeight)
        card2.image = UIImage(named: "id2-1")
        bg.addSubview(card2)
        
        card3.frame = CGRect(x: 18+cardWidth*2+11*2, y: bgHeight-16-cardHeight, width: cardWidth, height: cardHeight)
        card3.image = UIImage(named: "id3-1")
        bg.addSubview(card3)
        
        triangle1.frame = CGRect(x: card1.frame.origin.x+cardWidth/2-12, y: bgHeight-12, width: 24, height: 12)
        triangle1.image = UIImage(named: "小三角")
        view.addSubview(triangle1)
        
        triangle2.frame = CGRect(x: card2.frame.origin.x+cardWidth/2-12, y: bgHeight-12, width: 24, height: 12)
        triangle2.image = UIImage(named: "小三角")
        triangle2.isHidden = true
        view.addSubview(triangle2)
        
        triangle3.frame = CGRect(x: card3.frame.origin.x+cardWidth/2-12, y: bgHeight-12, width: 24, height: 12)
        triangle3.image = UIImage(named: "小三角2")
        triangle3.isHidden = true
        view.addSubview(triangle3)
        
        page1.delegate = self
        view.addSubview(page1)
        
        page2.isHidden = true
        page2.delegate = self
        view.addSubview(page2)
        
        page3.isHidden = true
        page3.delegate = self
        view.addSubview(page3)
    }
    
    func popVC2() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func toPage2() {
        card1.image = UIImage(named: "id1-2")
        card2.image = UIImage(named: "id2-2")
        card3.image = UIImage(named: "id3-2")
        self.triangle1.isHidden = true
        self.triangle2.isHidden = false
        self.triangle3.isHidden = true
        self.page2.isHidden = false
        self.page1.isHidden = true
        self.page3.isHidden = true
    }
    
    func toPage3() {
        card1.image = UIImage(named: "id1-3")
        card2.image = UIImage(named: "id2-3")
        card3.image = UIImage(named: "id3-3")
        self.triangle1.isHidden = true
        self.triangle2.isHidden = true
        self.triangle3.isHidden = false
        self.page2.isHidden = true
        self.page1.isHidden = true
        self.page3.isHidden = false
    }
    
    func toPay() {
        self.navigationController?.popViewController(animated: true)
    }
}
