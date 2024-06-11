//
//  User.swift
//  WAM
//
//  Created by Younuz Bin Noushad on 07/05/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    
    var initial:String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
            
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Younuz Bin Noushad", email: "test@gmail.com")
}
