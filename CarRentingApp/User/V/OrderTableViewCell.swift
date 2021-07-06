//
//  OrderTableViewCell.swift
//  CarRentingApp
//
//  Created by user on 2021/2/5.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        let bgView = UIView(frame: CGRect(x: 12, y: 5, width: kScreenWidth-24, height: 90))
        bgView.backgroundColor = .white
        
        //别克GL8豪华版
        let carLabel = UILabel(frame: CGRect(x: 12, y: 10, width: 120, height: 22.5))
        let carAttrString = NSMutableAttributedString(string: "别克GL8豪华版")
        let carAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 16, weight: .medium),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        carAttrString.addAttributes(carAttr, range: NSRange(location: 0, length: carAttrString.length))
        carLabel.attributedText = carAttrString
        bgView.addSubview(carLabel)
        
        //微型轿车
        let sizeLabel = UILabel(frame: CGRect(x: 12, y: 37, width: 50, height: 16.5))
        let sizeAttrString = NSMutableAttributedString(string: "微型轿车")
        let sizeAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        sizeAttrString.addAttributes(sizeAttr, range: NSRange(location: 0, length: sizeAttrString.length))
        sizeLabel.attributedText = sizeAttrString
        bgView.addSubview(sizeLabel)
        
        //自动 2.0T
        let engineLabel = UILabel(frame: CGRect(x: 84.5, y: 37, width: 55, height: 16.5))
        let engineAttrString = NSMutableAttributedString(string: "自动 2.0T")
        let engineAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        engineAttrString.addAttributes(engineAttr, range: NSRange(location: 0, length: engineAttrString.length))
        engineLabel.attributedText = engineAttrString
        bgView.addSubview(engineLabel)
        
        //5座
        let seatLabel = UILabel(frame: CGRect(x: 162.5, y: 37, width: 25, height: 16.5))
        let seatAttrString = NSMutableAttributedString(string: "5座")
        let seatAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        seatAttrString.addAttributes(seatAttr, range: NSRange(location: 0, length: seatAttrString.length))
        seatLabel.attributedText = seatAttrString
        bgView.addSubview(seatLabel)
        
        //取车时间：2020-12-08  12:03:40
        let timeLabel = UILabel(frame: CGRect(x: 12, y: 61.5, width: 190, height: 16.5))
        let timeAttrString = NSMutableAttributedString(string: "取车时间：2020-12-08  12:03:40")
        let timeAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)]
        timeAttrString.addAttributes(timeAttr, range: NSRange(location: 0, length: timeAttrString.length))
        timeLabel.attributedText = timeAttrString
        bgView.addSubview(timeLabel)
        
        //订单状态
        let stateLabel = UILabel(frame: CGRect(x: bgView.frame.width-72, y: 10, width: 60, height: 20))
        let stateAttrString = NSMutableAttributedString(string: "等待取车")
        let stateAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .regular),.foregroundColor: UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)]
        stateAttrString.addAttributes(stateAttr, range: NSRange(location: 0, length: stateAttrString.length))
        stateLabel.attributedText = stateAttrString
        bgView.addSubview(stateLabel)
        
        contentView.addSubview(bgView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
