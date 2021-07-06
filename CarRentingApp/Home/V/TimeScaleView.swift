//
//  TimeScaleView.swift
//  CarRentingApp
//
//  Created by user on 2021/2/9.
//

import UIKit

protocol TimeScaleViewDelegate: NSObjectProtocol {
    func pickDate1()
    func pickDate2()
}

class TimeScaleView: UIView {
    
    weak var delegate: TimeScaleViewDelegate?
    let datePicker = UIDatePicker(frame: CGRect(x: 0, y: -50, width: kScreenWidth, height: 63))
    let timelabel1 = UILabel()
    let timelabel2 = UILabel()
    let dateLabel1 = UILabel()
    let dateLabel2 = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        //时间条
        let timelineView = UIView()
        timelineView.frame = CGRect(x: 120.5, y: 41, width: kScreenWidth-241, height: 6)
        // fillCode
        let timelineLayer1 = CAGradientLayer()
        timelineLayer1.colors = [UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1).cgColor, UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1).cgColor, UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 0).cgColor]
        timelineLayer1.locations = [0, 0, 1]
        timelineLayer1.frame = timelineView.bounds
        timelineLayer1.startPoint = CGPoint(x: 1, y: 0.5)
        timelineLayer1.endPoint = CGPoint(x: 0.2, y: 0.8)
        timelineView.layer.addSublayer(timelineLayer1)
        addSubview(timelineView)
        
        //周二10:00
        let timeattrString1 = NSMutableAttributedString(string: "周二10:00")
        timelabel1.frame = CGRect(x: 18, y: 10, width: 80, height: 16.5)
        timelabel1.numberOfLines = 0
        let timeattr1: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)]
        timeattrString1.addAttributes(timeattr1, range: NSRange(location: 0, length: timeattrString1.length))
        timelabel1.attributedText = timeattrString1
        addSubview(timelabel1)
        
        //周四10:00
        let timeattrString2 = NSMutableAttributedString(string: "周四10:00")
        timelabel2.frame = CGRect(x: kScreenWidth-18-54, y: 10, width: 80, height: 16.5)
        timelabel2.numberOfLines = 0
        let timeattr2: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)]
        timeattrString2.addAttributes(timeattr2, range: NSRange(location: 0, length: timeattrString2.length))
        timelabel2.attributedText = timeattrString2
        addSubview(timelabel2)
        
        //duration
        let durationLabel = UILabel()
        let durationAttrString = NSMutableAttributedString(string: "租2天")
        durationLabel.frame = CGRect(x: (kScreenWidth-36)/2, y: 10, width: 40, height: 20)
        durationLabel.numberOfLines = 0
        let durationAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .regular),.foregroundColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)]
        durationAttrString.addAttributes(durationAttr, range: NSRange(location: 0, length: durationAttrString.length))
        durationLabel.attributedText = durationAttrString
        addSubview(durationLabel)
        
        //date1
        let dateAttrString1 = NSMutableAttributedString(string: "12月08日")
        dateLabel1.frame = CGRect(x: 18, y: 31.5, width: 100, height: 25)
        dateLabel1.numberOfLines = 0
        let dateAttr1: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 18, weight: .medium),.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1)]
        dateAttrString1.addAttributes(dateAttr1, range: NSRange(location: 0, length: dateAttrString1.length))
        dateLabel1.attributedText = dateAttrString1
        addSubview(dateLabel1)
        //date2
        let dateAttrString2 = NSMutableAttributedString(string: "12月10日")
        dateLabel2.frame = CGRect(x: kScreenWidth-18-72.5, y: 31.5, width: 100, height: 25)
        dateLabel2.numberOfLines = 0
        let dateAttr2: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 18, weight: .medium),.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1)]
        dateAttrString2.addAttributes(dateAttr2, range: NSRange(location: 0, length: dateAttrString2.length))
        dateLabel2.attributedText = dateAttrString2
        addSubview(dateLabel2)
   
        
        let button1 = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
//        button1.backgroundColor = .orange
        button1.addTarget(self, action: #selector(pickDate1), for: .touchDown)
        addSubview(button1)
        
        let button2 = UIButton(frame: CGRect(x: kScreenWidth-100, y: 0, width: 100, height: 60))
//        button2.backgroundColor = .orange
        button2.addTarget(self, action: #selector(pickDate2), for: .touchDown)
        addSubview(button2)
    }
    
    func setDate1(date: Date) {
//        let format = "EEEE-dd-MM-yyyy-HH:mm:ss"
        let format1 = "EEEE"
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = format1
        let weekday = dateFormatter1.string(from: date)
        let weekStr = weekdayFrom(eng: weekday)

        let format2 = "HH:mm"
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = format2
        let timeStr = dateFormatter2.string(from: date)
        
        let timeString = weekStr + timeStr
        
        let format3 = "MM月dd日"
        let dateFormatter3 = DateFormatter()
        dateFormatter3.dateFormat = format3
        let dateStr = dateFormatter3.string(from: date)
        
        timelabel1.text = timeString
        dateLabel1.text = dateStr
    }
    
    func setDate2(date: Date) {
        let format1 = "EEEE"
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = format1
        let weekday = dateFormatter1.string(from: date)
        let weekStr = weekdayFrom(eng: weekday)

        let format2 = "HH:mm"
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = format2
        let timeStr = dateFormatter2.string(from: date)
        
        let timeString = weekStr + timeStr
        
        let format3 = "MM月dd日"
        let dateFormatter3 = DateFormatter()
        dateFormatter3.dateFormat = format3
        let dateStr = dateFormatter3.string(from: date)
        
        timelabel2.text = timeString
        dateLabel2.text = dateStr
    }
    
    func weekdayFrom(eng: String) -> String {
        if eng == "Monday" {
            return "周一"
        } else if eng == "Tuesday" {
            return "周二"
        } else if eng == "Wednesday" {
            return "周三"
        } else if eng == "Thursday" {
            return "周四"
        } else if eng == "Friday" {
            return "周五"
        } else if eng == "Saturday" {
            return "周六"
        } else {
            return "周日"
        }
    }
    
    @objc func pickDate1() {
        self.delegate?.pickDate1()
    }
    
    @objc func pickDate2() {
        self.delegate?.pickDate2()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
