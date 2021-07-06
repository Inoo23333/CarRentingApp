//
//  RentPage1.swift
//  CarRentingApp
//
//  Created by user on 2021/1/30.
//

import UIKit
protocol RentPage1Delegate:NSObjectProtocol {
    func toPickCar()
    func toGetReturnShop()
    func toGetShop()
    func toReturnShop()
    func toDeliverAddress()
    func showPickDate1()
    func showPickDate2()
}

class RentPage1: UIView, TimeScaleViewDelegate {
    weak var delegate:RentPage1Delegate?
    var tog = UISwitch(frame: CGRect(x: kScreenWidth-46.5-18, y: 41.5, width: 46.5, height: 27))
    
    //取还车门店
    let label1 = UILabel(frame: CGRect(x: 18, y: 20.5, width: 80, height: 16.5))
    //取还车门店选项
    let label2 = UILabel(frame: CGRect(x: 20, y: 42, width: 115, height: 25))
    
    //分割线1
    let lineView1 = UIView(frame: CGRect(x: 18, y: 74.5, width: kScreenWidth-36, height: 0.5))
    //时间timeScaleView
    let timeScaleView = TimeScaleView(frame: CGRect(x: 0, y: 75, width: kScreenWidth, height: 63))
    //圆点
    let circleView = UIView(frame: CGRect(x: 18, y: 158.5, width: 13.5, height: 13.5))
    //送车上门
    let onDoorLabel = UILabel(frame: CGRect(x: 37.5, y: 155.5, width: 60, height: 20))
    var isOnDoor = false
    //送车上门button
    let onDoorButton = UIButton(frame: CGRect(x: 18, y: 155.5, width: 100, height: 22))
    //去选车button
    let pickCarButton = UIButton(frame: CGRect(x: 18, y: 259-70, width: kScreenWidth-36, height: 50))
    //分割线3
    let lineView3 = UIView(frame: CGRect(x: 18, y: 139, width: kScreenWidth-36, height: 0.5))
    //换车View
    let returnCarView = ReturnCarView(frame: CGRect(x: 0, y: 72, width: kScreenWidth, height: 64))
    
    //取还车button
    let getReturnButton = UIButton(frame: CGRect(x: 18, y: 39, width: 150, height: 28))
    //送车button
    let getAddressButton = UIButton(frame: CGRect(x: 18, y: 39, width: 150, height: 28))
    //取车button
    let getButton = UIButton(frame: CGRect(x: 18, y: 39, width: 150, height: 28))
    //还车button
    let returnButton = UIButton(frame: CGRect(x: 18, y: 103, width: 150, height: 28))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let width = self.frame.width
//        let height = self.frame.height
        
        backgroundColor = .white
        layer.cornerRadius = 20
        // shadowCode
        layer.shadowColor = UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 0.3).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 1
        layer.shadowRadius = 9
    
        tog.onTintColor = UIColor(red: 0.91, green: 0.8, blue: 0.53, alpha: 1)
        tog.addTarget(self, action: #selector(toggle), for: .valueChanged)
        addSubview(tog)
        
        //分割线1
        // fillCode
        let lineLayer1 = CALayer()
        lineLayer1.frame = lineView1.bounds
        lineLayer1.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        lineView1.layer.addSublayer(lineLayer1)
        addSubview(lineView1)
        
        timeScaleView.delegate = self
        addSubview(timeScaleView)
        returnCarView.isHidden = true
        addSubview(returnCarView)
        
        //取还车门店
        let attrString1 = NSMutableAttributedString(string: "取还车门店")
        label1.numberOfLines = 0
        let attr1: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 12, weight: .regular),.foregroundColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)]
        attrString1.addAttributes(attr1, range: NSRange(location: 0, length: attrString1.length))
        label1.attributedText = attrString1
        addSubview(label1)
        //取还车门店选项
        let attrString2 = NSMutableAttributedString(string: "金桥云度4s店")
        label2.numberOfLines = 0
        let attr2: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 18, weight: .medium),.foregroundColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
        attrString2.addAttributes(attr2, range: NSRange(location: 0, length: attrString2.length))
        label2.attributedText = attrString2
        addSubview(label2)
        //箭头1
        let arrow1 = UIImageView(frame: CGRect(x: 135, y: 44, width: 20, height: 20))
        arrow1.image = UIImage(named: "Arrow1")
        addSubview(arrow1)
        
        //取还车button
        getReturnButton.addTarget(self, action: #selector(toGetReturn), for: .touchDown)
//        getReturnButton.backgroundColor = .orange
        addSubview(getReturnButton)
        
        //送车button
        getAddressButton.addTarget(self, action: #selector(toDeliverAddress), for: .touchDown)
//        getAddressButton.backgroundColor = .yellow
        getAddressButton.isHidden = true
        addSubview(getAddressButton)
        
        //取车button
        getButton.addTarget(self, action: #selector(toGet), for: .touchDown)
//        getButton.backgroundColor = .lightGray
        getButton.isHidden = true
        addSubview(getButton)
        
        //还车button
        returnButton.addTarget(self, action: #selector(toReturn), for: .touchDown)
//        returnButton.backgroundColor = .blue
        returnButton.isHidden = true
        addSubview(returnButton)
        
        
        //分割线2
        let lineView2 = UIView()
        lineView2.frame = CGRect(x: 18, y: 139, width: kScreenWidth-36, height: 0.5)
        // fillCode
        let lineLayer2 = CALayer()
        lineLayer2.frame = lineView2.bounds
        lineLayer2.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        lineView2.layer.addSublayer(lineLayer2)
        addSubview(lineView2)
        
        //分割线3
        // fillCode
        let lineLayer3 = CALayer()
        lineLayer3.frame = lineView3.bounds
        lineLayer3.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        lineView3.layer.addSublayer(lineLayer3)
        addSubview(lineView3)
        
        //送车上门
        let onDoorAttrString = NSMutableAttributedString(string: "上门送车")
        onDoorLabel.numberOfLines = 0
        let onDoorAttr: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 14, weight: .regular),.foregroundColor: UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)]
        onDoorAttrString.addAttributes(onDoorAttr, range: NSRange(location: 0, length: onDoorAttrString.length))
        onDoorLabel.attributedText = onDoorAttrString
        addSubview(onDoorLabel)
        
        //圆点
        circleView.backgroundColor = .white
        circleView.layer.cornerRadius = 13.5/2
        circleView.layer.borderWidth = 1
        circleView.layer.borderColor = UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1).cgColor
        addSubview(circleView)
        
        //送车上门button
//        onDoorButton.backgroundColor = .systemPink
        onDoorButton.addTarget(self, action: #selector(onDoor), for: .touchDown)
        addSubview(onDoorButton)
        

        
        //去选车button
        let pickCarLabel = UILabel()
        pickCarLabel.frame = CGRect(x: 0, y: 0, width: width-36, height: 50)
        pickCarLabel.text = "去选车"
        pickCarLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        pickCarLabel.textColor = .white
        pickCarLabel.textAlignment = .center
        // fillCode
        let pickCarLayer = CAGradientLayer()
        pickCarLayer.colors = [UIColor(red: 0.95, green: 0.85, blue: 0.59, alpha: 1).cgColor, UIColor(red: 0.78, green: 0.64, blue: 0.35, alpha: 1).cgColor]
        pickCarLayer.locations = [0, 1]
        pickCarLayer.frame = pickCarButton.bounds
        pickCarLayer.cornerRadius = 24.5
        pickCarLayer.startPoint = CGPoint(x: 0, y: 0.5)
        pickCarLayer.endPoint = CGPoint(x: 0.5, y: 0.5)
        pickCarButton.layer.addSublayer(pickCarLayer)
        pickCarButton.addSubview(pickCarLabel)
        addSubview(pickCarButton)
        pickCarButton.addTarget(self, action: #selector(toPickCar), for: .touchDown)
        
    }
    
    func changeDate1(date: Date) {
        print("changeDate1 from rentPage1")
        timeScaleView.setDate1(date: date)
    }
    
    func changeDate2(date: Date) {
        print("changeDate2 from rentPage1")
        timeScaleView.setDate2(date: date)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func toPickCar() {
        self.delegate?.toPickCar()
    }
    
    @objc func toGetReturn() {
        self.delegate?.toGetReturnShop()
    }
    
    @objc func toGet() {
        self.delegate?.toGetShop()
    }
    
    @objc func toReturn() {
        self.delegate?.toReturnShop()
    }
    
    @objc func toDeliverAddress() {
        self.delegate?.toDeliverAddress()
    }
    
    @objc func toggle() {
        if tog.isOn {
            print("on")
//            320.5
            UIView.animate(withDuration: 0.3) {
                self.label1.text = "取车地址"
                self.frame = CGRect(x: 0, y: kScreenHeight-320.5, width: kScreenWidth, height: 320.5)
                self.timeScaleView.frame = CGRect(x: 0, y: 136, width: kScreenWidth, height: 63)
                self.circleView.frame = CGRect(x: 18, y: 220, width: 13.5, height: 13.5)
                self.onDoorLabel.frame = CGRect(x: 37.5, y: 217, width: 60, height: 20)
                self.pickCarButton.frame = CGRect(x: 18, y: 252.5, width: kScreenWidth-36, height: 50)
                self.lineView3.frame = CGRect(x: 18, y: 200.5, width: kScreenWidth-36, height: 0.5)
                self.returnCarView.isHidden = false
                self.onDoorButton.frame = CGRect(x: 18, y: 217, width: 100, height: 22)
                //button
                self.getReturnButton.isHidden = true
                self.getButton.isHidden = false
                self.returnButton.isHidden = false
                
            }
        } else {
            print("off")
            UIView.animate(withDuration: 0.3) {
                self.label1.text = "取还车地址"
                self.returnCarView.isHidden = true
                self.timeScaleView.frame = CGRect(x: 0, y: 75, width: kScreenWidth, height: 63)
                self.circleView.frame = CGRect(x: 18, y: 158.5, width: 13.5, height: 13.5)
                self.onDoorLabel.frame = CGRect(x: 37.5, y: 155.5, width: 60, height: 20)
                self.pickCarButton.frame = CGRect(x: 18, y: 259-70, width: kScreenWidth-36, height: 50)
                self.lineView3.frame = CGRect(x: 18, y: 139, width: kScreenWidth-36, height: 0.5)
                self.frame = CGRect(x: 0, y: kScreenHeight-259, width: kScreenWidth, height: 259)
                //button
                self.getReturnButton.isHidden = false
                self.getButton.isHidden = true
                self.returnButton.isHidden = true
                
                self.circleView.layer.borderColor = UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1).cgColor
                self.circleView.backgroundColor = .white
                self.onDoorLabel.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
                //送车上门button
                self.onDoorButton.frame = CGRect(x: 18, y: 155.5, width: 100, height: 22)
                self.isOnDoor = !self.isOnDoor
            }
        }
    }
    
    @objc func onDoor() {
        if isOnDoor == false {
            UIView.animate(withDuration: 0.3) {
                self.tog.isHidden = true
                self.label1.text = "送车地址"
                self.label2.text = "协和小区南门"
                self.circleView.layer.borderColor = UIColor(red: 0.91, green: 0.8, blue: 0.53, alpha: 1).cgColor
                self.circleView.backgroundColor = UIColor(red: 0.91, green: 0.8, blue: 0.53, alpha: 1)
                self.onDoorLabel.textColor = UIColor(red: 0.81, green: 0.56, blue: 0, alpha: 1)
                self.frame = CGRect(x: 0, y: kScreenHeight-320.5, width: kScreenWidth, height: 320.5)
                self.timeScaleView.frame = CGRect(x: 0, y: 136, width: kScreenWidth, height: 63)
                self.circleView.frame = CGRect(x: 18, y: 220, width: 13.5, height: 13.5)
                self.onDoorLabel.frame = CGRect(x: 37.5, y: 217, width: 60, height: 20)
                self.pickCarButton.frame = CGRect(x: 18, y: 252.5, width: kScreenWidth-36, height: 50)
                self.lineView3.frame = CGRect(x: 18, y: 200.5, width: kScreenWidth-36, height: 0.5)
                self.returnCarView.isHidden = false
                //送车上门button
                self.onDoorButton.frame = CGRect(x: 18, y: 217, width: 100, height: 22)
                
                //button
                self.getReturnButton.isHidden = true
                self.getButton.isHidden = true
                self.getAddressButton.isHidden = false
                self.returnButton.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.tog.setOn(false, animated: false)
                self.tog.isHidden = false
                self.label1.text = "取还车门店"
                self.label2.text = "金桥云度4s店"
                self.returnCarView.isHidden = true
                self.timeScaleView.frame = CGRect(x: 0, y: 75, width: kScreenWidth, height: 63)
                self.circleView.frame = CGRect(x: 18, y: 158.5, width: 13.5, height: 13.5)
                self.onDoorLabel.frame = CGRect(x: 37.5, y: 155.5, width: 60, height: 20)
                self.pickCarButton.frame = CGRect(x: 18, y: 259-70, width: kScreenWidth-36, height: 50)
                self.lineView3.frame = CGRect(x: 18, y: 139, width: kScreenWidth-36, height: 0.5)
                self.frame = CGRect(x: 0, y: kScreenHeight-259, width: kScreenWidth, height: 259)
                self.circleView.layer.borderColor = UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1).cgColor
                self.circleView.backgroundColor = .white
                self.onDoorLabel.textColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
                //送车上门button
                self.onDoorButton.frame = CGRect(x: 18, y: 155.5, width: 100, height: 22)
                
                //button
                self.getReturnButton.isHidden = false
                self.getAddressButton.isHidden = true
                self.returnButton.isHidden = true
            }
        }
        isOnDoor = !isOnDoor
    }

    
    ///TimeScaleViewDelegate
    func pickDate1(){
        self.delegate?.showPickDate1()
    }
    
    func pickDate2(){
        self.delegate?.showPickDate2()
    }
}
