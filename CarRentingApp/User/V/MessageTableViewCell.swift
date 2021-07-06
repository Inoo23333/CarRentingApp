//
//  MessageTableViewCell.swift
//  CarRentingApp
//
//  Created by user on 2021/2/6.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        let bgView = UIView(frame: CGRect(x: 1, y: 2, width: kScreenWidth-2, height: 70))
        bgView.backgroundColor = .white
        
        //支付通知-消息标题
        let subTitleLabel = UILabel(frame: CGRect(x: 18, y: 10, width: 209, height: 22.5))
        let subTitleAttrString = NSMutableAttributedString(string: "支付通知")
        let subTitleAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .medium),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        subTitleAttrString.addAttributes(subTitleAttr, range: NSRange(location: 0, length: subTitleAttrString.length))
        subTitleLabel.attributedText = subTitleAttrString
        bgView.addSubview(subTitleLabel)
        
        //消息内容
        let contentLabel = UILabel(frame: CGRect(x: 18, y: 37.5, width: bgView.frame.width-30, height: 16.5))
        let contentAttrString = NSMutableAttributedString(string: "您有一个订单待支付￥2800，请在15分钟内尽快完成支付，否…")
        contentLabel.numberOfLines = 1
        let contentAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)]
        contentAttrString.addAttributes(contentAttr, range: NSRange(location: 0, length: contentAttrString.length))
        contentLabel.attributedText = contentAttrString
        bgView.addSubview(contentLabel)

        //通知时间
        let timeLabel = UILabel(frame: CGRect(x: bgView.frame.width-82-12, y: 12, width: 82, height: 15))
        let timeAttrString = NSMutableAttributedString(string: "12-04 14:03:32")
        timeLabel.numberOfLines = 0
        let timeAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 11, weight: .regular),.foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)]
        timeAttrString.addAttributes(timeAttr, range: NSRange(location: 0, length: timeAttrString.length))
        timeLabel.attributedText = timeAttrString
        bgView.addSubview(timeLabel)
        
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
