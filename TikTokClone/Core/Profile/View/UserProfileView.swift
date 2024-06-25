//
//  UserProfileView.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-11.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 2) {
                // Profile Header
                ProfileHeaderView(user: user)
               
                //post grid view
                PostGridView()
            }
            .padding(.top)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UserProfileView(user: DeveloperPreview.user)
}
