//
//  MyBackButton.swift
//  CarRentingApp
//
//  Created by user on 2021/2/9.
//

import UIKit
import WebKit

class MyBackButton: UIButton {
    var webview: WKWebView = WKWebView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        print("hitTest1")
//        let view = super.hitTest(point, with: event)
//        let _ = webview.hitTest(point, with: event)
//        return view
//    }

}
