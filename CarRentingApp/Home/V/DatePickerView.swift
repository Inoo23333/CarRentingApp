//
//  DatePickerView.swift
//  CarRentingApp
//
//  Created by user on 2021/2/20.
//

import UIKit

protocol DatePickerViewDelegate:NSObjectProtocol {
    func changeDate1()
    func changeDate2()
}

class DatePickerView: UIView {
    
    weak var delegate: DatePickerViewDelegate?
    let datePicker = UIDatePicker()
    var id = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bgView = UIView(frame: CGRect(x: 0, y: kScreenHeight - 250, width: kScreenWidth, height: 250))
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 20
        datePicker.frame = CGRect(x: 20, y: 0, width: kScreenWidth, height: 100)
        datePicker.layer.cornerRadius = 20
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        //datePicker
        let locale = Locale(identifier: "zh_CN")
        datePicker.locale = locale
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.backgroundColor = .white
        addSubview(bgView)
        bgView.addSubview(datePicker)
        
        let label = UILabel(frame: CGRect(x: kScreenWidth-70, y: 90, width: 60, height: 40))
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.text = "OK"
        label.textColor = UIColor(red: 0.91, green: 0.8, blue: 0.53, alpha: 1)
        bgView.addSubview(label)
        
        let button = UIButton()
        button.frame = label.frame
        button.addTarget(self, action: #selector(ok), for: .touchDown)
        bgView.addSubview(button)
        
    }
    
    @objc func ok() {
        if self.id == 1 {
            self.delegate?.changeDate1()
        } else {
            self.delegate?.changeDate2()
        }
        self.isHidden = true
    }
    
    func setDate(date: Date) {
        self.datePicker.date = date
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
