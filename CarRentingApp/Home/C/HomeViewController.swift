//
//  ViewController.swift
//  CarRentingApp
//
//  Created by user on 2021/1/19.
//

import UIKit
import WebKit

class HomeViewController: UIViewController,TabbarViewDelegate,RentPage1Delegate,RentPage2Delegate,ReserveHintViewDelegate, RentHintViewDelegate, DatePickerViewDelegate {
    
    let rentPage1 = RentPage1(frame: CGRect(x: 0, y: kScreenHeight-259
                                            , width: kScreenWidth, height: 259))
    let busPage = BusPage(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
    let rentPage2 = RentPage2(frame: CGRect(x: 0, y: kScreenHeight-259
                                            , width: kScreenWidth, height: 259))
    let reserveHintView = ReserveHintView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
    let rentHintView = RentHintView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
    
    let datePickerView1 = DatePickerView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
    let datePickerView2 = DatePickerView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //地图背景图片
        let mapBg = UIImageView(image: UIImage(named: "Map"))
        mapBg.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
        mapBg.contentMode = .scaleAspectFill
        view.addSubview(mapBg);
        
        view.addSubview(rentPage1)
        view.addSubview(busPage)
        view.addSubview(rentPage2)
        busPage.isHidden = true
        rentPage2.isHidden = true
        
        rentPage1.delegate = self
        rentPage2.delegate = self
        reserveHintView.delegate = self
        rentHintView.delegate = self
        
        //tabbar
        let tabbar = TabbarView()
        tabbar.delegate = self
        tabbar.initTabbar(controller: self)
        view.addSubview(tabbar)
        
        let userButton = UIButton(frame: CGRect(x: 4, y: 4, width: 40.5, height: 40.5))
        userButton.addTarget(self, action: #selector(toUser), for: .touchDown)
        tabbar.addSubview(userButton)
        
        view.addSubview(reserveHintView)
        reserveHintView.isHidden = true
        view.addSubview(rentHintView)
        rentHintView.isHidden = true
        
//        let button = UIButton(frame: CGRect(x: 18, y: 450, width: 110.5, height: 25))
//        button.backgroundColor = .systemPink
//        button.addTarget(self, action: #selector(getCar), for: .touchDown)
//        view.addSubview(button)

        datePickerView1.id = 1
        datePickerView2.id = 2
        datePickerView1.isHidden = true
        datePickerView2.isHidden = true
        datePickerView1.delegate = self
        datePickerView2.delegate = self
        view.addSubview(datePickerView1)
        view.addSubview(datePickerView2)
    }
    
    @objc func toUser() {
        let userVC = UserViewController()
        self.navigationController?.pushViewController(userVC, animated: true)
    }
    @objc func getCar() {
        let getLocationVC = GetShopViewController()
        self.navigationController?.pushViewController(getLocationVC, animated: true)
    }
    
    @objc func backCar() {
        let backLocationVC = ReturnShopViewController()
        self.navigationController?.pushViewController(backLocationVC, animated: true)
    }
    
    ///TabbarViewDelegate
    func showRentPage1() {
        print("1")
        rentPage1.isHidden = false
        busPage.isHidden = true
        rentPage2.isHidden = true
    }
    
    func showBusPage() {
        print("2")
        rentPage1.isHidden = true
        busPage.isHidden = false
        rentPage2.isHidden = true
    }
    
    func showRentPage2() {
        print("3")
        rentPage1.isHidden = true
        busPage.isHidden = true
        rentPage2.isHidden = false
    }
    ///RentPage1Delegate
    func toPickCar() {
        let pickCarVC = PickCarViewController()
        self.navigationController?.pushViewController(pickCarVC, animated: true)
    }
    
    func toGetReturnShop() {
        let getReturnVC = GetReturnShopViewController()
        self.navigationController?.pushViewController(getReturnVC, animated: true)
    }
    
    func toGetShop() {
        let getVC = GetShopViewController()
        self.navigationController?.pushViewController(getVC, animated: true)
    }
    
    func toReturnShop() {
        let returnVC = ReturnShopViewController()
        self.navigationController?.pushViewController(returnVC, animated: true)
    }
    
    func toDeliverAddress() {
        let addressVC = DeliverAddressViewController()
        self.navigationController?.pushViewController(addressVC, animated: true)
    }
    
    func showPickDate1() {
        datePickerView1.isHidden = false
    }
    
    func showPickDate2() {
        datePickerView2.isHidden = false
    }
    
    ///RentPage2Delegate
    func showReserveHint() {
        //预约按钮
//        self.view.addSubview(reserveHintView)
        self.reserveHintView.isHidden = false
    }
    
    func showRentHint() {
        //现在租按钮
        self.rentHintView.isHidden = false
    }
    
    ///ReserveHintViewDelegate
    func toReserveCar() {
        let toReserveCarVC = RentCarViewController()
        self.navigationController?.pushViewController(toReserveCarVC, animated: true)
        self.reserveHintView.isHidden = true
        self.rentHintView.isHidden = true
    }
    
    ///RentHintViewDelegate
    func toRentCar() {
        let toReserveCarVC = RentCarViewController()
        self.navigationController?.pushViewController(toReserveCarVC, animated: true)
        self.reserveHintView.isHidden = true
        self.rentHintView.isHidden = true
    }
    
    func cancleReserve() {
        self.reserveHintView.isHidden = true
        self.rentHintView.isHidden = true
    }
    
    ///DatePickerViewDelegate
    func changeDate1() {
        rentPage1.changeDate1(date: datePickerView1.datePicker.date)
    }
    
    func changeDate2() {
        rentPage1.changeDate2(date: datePickerView2.datePicker.date)
    }
}

