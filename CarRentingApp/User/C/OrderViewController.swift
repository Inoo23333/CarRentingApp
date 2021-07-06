//
//  MyOrderViewController.swift
//  CarRentingApp
//
//  Created by user on 2021/1/30.
//

import UIKit

class OrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, BackButtonDelegate {
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        
        let titleHeight: CGFloat = kScreenWidth == 375 ? 64 : 90
        let titleView = TitleView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: titleHeight),type: .Order)
        view.addSubview(titleView)
        
        tableView.frame = CGRect(x: 0, y: titleView.frame.height, width: kScreenWidth, height: kScreenHeight)
        tableView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
        let backButton = BackButton(frame: CGRect(x: 12, y: titleView.frame.height-30, width: 24, height: 24))
        backButton.delegate = self
        view.addSubview(backButton)
    }

    ///UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    ///UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = OrderTableViewCell(style: .default, reuseIdentifier: "cell")
        }
        return cell!
    }
    
    ///BackButtonDelegate
    func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
}
