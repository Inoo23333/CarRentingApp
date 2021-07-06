//
//  BackLocationViewController.swift
//  CarRentingApp
//
//  Created by user on 2021/1/23.
//

import UIKit
import WebKit

class ReturnShopViewController: UIViewController,WKNavigationDelegate {

    let webview = WKWebView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webview.navigationDelegate = self
        let url = URL(string: "http://dh.ecnucpp.cn:8885/select_address.html")!
        let request = URLRequest(url: url)
        self.webview.load(request)
        view.addSubview(webview)
        let backButton = UIButton(frame: CGRect(x: 12, y: 30, width: 30, height: 30))
        backButton.addTarget(self, action: #selector(back), for: .touchDown)
        view.addSubview(backButton)
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }

}
