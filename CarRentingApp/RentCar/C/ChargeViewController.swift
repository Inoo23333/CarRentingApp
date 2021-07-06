//
//  ChargeViewController.swift
//  CarRentingApp
//
//  Created by user on 2021/2/6.
//

import UIKit

class ChargeViewController: UIViewController, BackButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //导航栏
        let titleHeight: CGFloat = kScreenWidth == 375 ? 64 : 90
        let titleView = TitleView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: titleHeight),title: "充电桩导览")
        view.addSubview(titleView)
        
        let buttonHeight: CGFloat = kScreenWidth == 375 ? 30 : 50
        //返回按钮
        let backButton = BackButton(frame: CGRect(x: 12, y: buttonHeight, width: 24, height: 24))
        backButton.delegate = self
        view.addSubview(backButton)
    }
    
    func popVC() {
        self.navigationController?.popViewController(animated: true)
    }

}
