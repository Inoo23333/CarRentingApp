//
//  TokenManager.swift
//  CarRentingApp
//
//  Created by user on 2021/7/11.
//

import UIKit

class TokenManager: NSObject {
    static let userDefault = UserDefaults.standard
    static var lastDate = CFAbsoluteTimeGetCurrent()
    static func saveToken(token: String, seconds: Int) {
        print(token)
        print(seconds)
        let data = token.data(using: .utf8)
        lastDate = CFAbsoluteTimeGetCurrent()
        userDefault.set(data, forKey: "UserToken")
        userDefault.set(data, forKey: "Seconds")
    }

    static func getToken() -> String? {
        // TODO: 算时间
        print(lastDate)
        guard let sec = userDefault.object(forKey: "Seconds") as? Double else {
            return nil
        }
        let dateNow = CFAbsoluteTimeGetCurrent()
        if (dateNow - lastDate) >= (sec/1000) {
            return nil
        }
        guard let data = userDefault.data(forKey: "UserToken") else {
            return nil
        }
        let token = String(data: data, encoding: .utf8)
        return token
    }
}
