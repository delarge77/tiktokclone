//
//  UserCell.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-05.
//

import SwiftUI

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        
        HStack(spacing: 12) {
            AvatarView(user: user, size: .medium)
            
            VStack(alignment: .leading) {
                Text(user.userName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(user.fullname)
                    .font(.footnote)
            }
            .foregroundStyle(.black)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    UserCell(user: DeveloperPreview.user)
}
