//
//  PickCarViewController.swift
//  CarRentingApp
//
//  Created by user on 2021/2/9.
//

import UIKit
import WebKit

class PickCarViewController: UIViewController,WKNavigationDelegate {

    let webview = WKWebView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
    let myUrl = URL(string: "http://dh.ecnucpp.cn:8885/select_car.html")!
    let backButton = MyBackButton(frame: CGRect(x: 12, y: (kScreenWidth == 375 ? 30 : 42), width: 30, height: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webview.navigationDelegate = self
        let request = URLRequest(url: myUrl)
        self.webview.load(request)
        view.addSubview(webview)
//        backButton.webview = webview
//        backButton.backgroundColor = .orange
        backButton.addTarget(self, action: #selector(back), for: .touchDown)
        view.addSubview(backButton)
    }
    
    @objc func back() {
        print(webview.url?.absoluteString)
        print(self.myUrl.absoluteString)
        if webview.url?.absoluteString == self.myUrl.absoluteString {
            self.navigationController?.popViewController(animated: true)
            self.backButton.isHidden = false
            print("yes")
        } else {
            self.backButton.isHidden = true
            self.view.hitTest(CGPoint(x: 14, y: 60), with: nil)
            print("PickCarViewController no")
        }
    }

}
