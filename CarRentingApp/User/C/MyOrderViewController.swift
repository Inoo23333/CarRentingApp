//
//  MyOrderViewController.swift
//  CarRentingApp
//
//  Created by user on 2021/2/9.
//

import UIKit
import WebKit

class MyOrderViewController: UIViewController,WKNavigationDelegate {

    let webview = WKWebView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webview.navigationDelegate = self
        let url = URL(string: "http://dh.ecnucpp.cn:8885/my_orders.html")!
        let request = URLRequest(url: url)
        self.webview.load(request)
        view.addSubview(webview)
        let buttonHeight: CGFloat = kScreenWidth == 375 ? 30 : 42
        let backButton = MyBackButton(frame: CGRect(x: 12, y: buttonHeight, width: 30, height: 30))
        backButton.webview = webview
        backButton.addTarget(self, action: #selector(back), for: .touchDown)
        view.addSubview(backButton)
    }
    
    @objc func back() {
        if webview.url?.absoluteString == "http://dh.ecnucpp.cn:8885/my_orders.html" {
            self.navigationController?.popViewController(animated: true)
        } else {
            print("no")
        }
    }

}

