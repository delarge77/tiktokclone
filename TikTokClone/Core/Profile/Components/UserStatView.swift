//
//  UserStatView.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-05.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.bold)
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
            
        }
        .frame(width: 80, alignment: .center)
    }
}

#Preview {
    UserStatView(value: 7, title: "Likes")
}
