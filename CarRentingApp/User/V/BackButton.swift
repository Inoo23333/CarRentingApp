//
//  BackButton.swift
//  CarRentingApp
//
//  Created by user on 2021/2/5.
//

import UIKit
protocol BackButtonDelegate: NSObjectProtocol {
    func popVC()
}

class BackButton: UIButton {
    weak var delegate: BackButtonDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        let backIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        backIcon.image = UIImage(named: "Back")
        addSubview(backIcon)
        addTarget(self, action: #selector(back), for: .touchDown)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func back() {
        self.delegate?.popVC()
    }
}
