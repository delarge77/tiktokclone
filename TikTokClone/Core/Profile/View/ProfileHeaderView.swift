//
//  ProfileHeaderView.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-05.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @State private var showEditProfile = false
    let user: User
    
    var body: some View {
        
        VStack(spacing: 16) {
            VStack(spacing: 8) {                
                AvatarView(user: user, size: .xLarge)
                
                Text("@\(user.userName)")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            
            HStack(spacing: 16) {
                UserStatView(value: 5, title: "Followings")
                
                UserStatView(value: 1, title: "Followers")
                
                UserStatView(value: 7, title: "Likes")
            }
            
            Button {
                showEditProfile.toggle()
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(.black)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: DeveloperPreview.user)
}
