//
//  ContentView.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-05.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ContentViewModel
    private let authService: AuthService
    private let userService: UserService
    
    init(authService: AuthService, userService: UserService) {
        self.authService = authService
        self.userService = userService
        self._viewModel = StateObject(wrappedValue: ContentViewModel(authService: authService,
                                                                     userService: userService))
    }
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                if let user = viewModel.currentUser {
                    MainTabView(authService: authService, user: user)
                }
            } else {
                LoginView(authService: authService)
            }
        }
    }
}

#Preview {
    ContentView(authService: AuthService(userService: UserService()), userService: UserService())
}
