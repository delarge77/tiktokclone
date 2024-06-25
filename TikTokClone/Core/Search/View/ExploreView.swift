//
//  ExploreView.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-05.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var viewModel = ExploreViewModel(service: UserService())
    
    var body: some View {
        
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            UserCell(user: user)
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                UserProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top)
        }
    }
}

#Preview {
    ExploreView()
}
