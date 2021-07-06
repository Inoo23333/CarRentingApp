//
//  GuideViewController.swift
//  CarRentingApp
//
//  Created by user on 2021/2/6.
//

import UIKit

class GuideViewController: UIViewController, BackButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //导航栏
        let titleHeight: CGFloat = kScreenWidth == 375 ? 64 : 90
        let titleView = TitleView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: titleHeight),title: "换车导览")
        view.addSubview(titleView)
        
        let buttonHeight: CGFloat = kScreenWidth == 375 ? 30 : 50
        //返回按钮
        let backButton = BackButton(frame: CGRect(x: 12, y: buttonHeight, width: 24, height: 24))
        backButton.delegate = self
        view.addSubview(backButton)
        
        //bg1
        let bg = UIImageView(frame: CGRect(x: 0, y: titleHeight, width: kScreenWidth, height: 603/375*kScreenWidth))
        bg.image = UIImage(named: "Guide")
        view.addSubview(bg)
        
        //bg2
        let bg1 = UIImageView(frame: CGRect(x: 0, y: bg.frame.height+titleHeight, width: kScreenWidth, height: 603/375*kScreenWidth))
        bg1.image = UIImage(named: "Guide")
        view.addSubview(bg1)
    }
    
    func popVC() {
        self.navigationController?.popViewController(animated: true)
    }

}
