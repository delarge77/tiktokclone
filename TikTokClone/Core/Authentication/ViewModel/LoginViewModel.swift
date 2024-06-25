//
//  LoginViewModel.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-10.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func login(withEmail email: String, password: String) async {
        do {
            try await authService.login(withEmail: email, password: password)
        } catch {
            print("DEBUG: Did fail login with error \(error.localizedDescription)")
        }
    }
}
