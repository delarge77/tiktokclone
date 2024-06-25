//
//  PreviewProvider.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-11.
//

import Foundation

struct DeveloperPreview {
    
    static var user = User(id: NSUUID().uuidString,
                           userName: "John Reese",
                           email: "johnreese@gmail.com",
                           fullname: "John Reese")
    
    static var users: [User] = [
        .init(id: NSUUID().uuidString, userName: "Arnold", email: "arnold@gmail.com", fullname: "Arnold"),
        .init(id: NSUUID().uuidString, userName: "Summer", email: "summer@gmail.com", fullname: "Summer Sinn"),
        .init(id: NSUUID().uuidString, userName: "Harmony", email: "harmony@gmail.com", fullname: "Harmony Sinn"),
        .init(id: NSUUID().uuidString, userName: "Karen", email: "karen@gmail.com", fullname: "Karen Fisher")
    ]
}
