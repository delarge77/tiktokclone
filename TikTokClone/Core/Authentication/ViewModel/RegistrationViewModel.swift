//
//  RegistrationViewModel.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-10.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func createUser(withEmail email: String, 
                    password: String,
                    username: String,
                    fullName: String) async {
        
        do {
            try await authService.createUser(withEmail: email, password: password, userName: username, fullName: fullName)
        } catch {
            print("DEBUG: failed creating user with error: \(error.localizedDescription)")
        }
    }
}
