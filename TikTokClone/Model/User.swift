//
//  User.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-11.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    let id: String
    let userName: String
    let email: String
    let fullname: String
    var bio: String?
    var profileImageUrl: String?
}
