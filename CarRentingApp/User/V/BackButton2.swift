//
//  BackButton2.swift
//  CarRentingApp
//
//  Created by user on 2021/2/9.
//

import UIKit
protocol BackButton2Delegate: NSObjectProtocol {
    func popVC2()
}

class BackButton2: UIButton {
    weak var delegate: BackButton2Delegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        let backIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        backIcon.image = UIImage(named: "Back2")
        addSubview(backIcon)
        addTarget(self, action: #selector(back), for: .touchDown)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func back() {
        self.delegate?.popVC2()
    }
}
