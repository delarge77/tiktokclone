//
//  CurrentUserProfileView.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-05.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let authService: AuthService
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 2) {
                    // Profile Header
                    ProfileHeaderView(user: user)
                    
                    // post grid view
                    PostGridView()
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Sign Out") {
                        self.authService.signOut()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(authService: AuthService(userService: UserService()), user: DeveloperPreview.user)
}
