//
//  MainTabView.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-05.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selectedTab = 0
    
    private let authService: AuthService
    private let user: User
    
    init(authService: AuthService, user: User) {
        self.authService = authService
        self.user = user
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                        Text("Home")
                    }
                }
                .onAppear { selectedTab = 0}
                .tag(0)
            
            ExploreView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 1 ? "person.2.fill" : "person.2")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                        Text("Friends")
                    }
                }
                .onAppear { selectedTab = 1}
                .tag(1)
            
            MediaSelectorView()
                .tabItem { Image(systemName: "plus") }
                .onAppear { selectedTab = 2 }
                .tag(2)
            
            NotificationsView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                            .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                        Text("Inbox")
                    }
                }
                .onAppear { selectedTab = 3}
                .tag(3)
            
            CurrentUserProfileView(authService: authService, user: user)
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                            .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                        Text("Profile")
                    }
                }
                .onAppear { selectedTab = 4}
                .tag(4)
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView(authService: AuthService(userService: UserService()), user: DeveloperPreview.user)
}
