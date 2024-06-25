//
//  EditProfileOptionRowView.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-12.
//

import SwiftUI

struct EditProfileOptionRowView: View {
    
    let option: EditProfileOptions
    let value: String
    
    var body: some View {
        NavigationLink(value: option) {
            Text(option.title)
            Spacer()
            Text(value)
        }
        .foregroundStyle(.primary)
    }
}

#Preview {
    EditProfileOptionRowView(option: .userName, value: "Username")
}
