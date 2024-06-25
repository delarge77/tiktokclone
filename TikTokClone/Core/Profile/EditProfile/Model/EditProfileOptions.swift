//
//  EditProfileOptions.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-12.
//

import Foundation

enum EditProfileOptions: Hashable {
    case name
    case userName
    case bio
    
    var title: String {
        switch self {
        case .name:
            return "Name"
        case .userName:
            return "Username"
        case .bio:
            return "Bio"
        }
    }
}
