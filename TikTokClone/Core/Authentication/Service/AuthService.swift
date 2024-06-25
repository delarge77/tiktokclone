//
//  AuthService.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-10.
//

import Foundation
import Firebase
import FirebaseAuth

@MainActor
class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    let userService: UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func updateUserSession() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: user is \(result.user.uid)")
        } catch {
            print("DEBUG: failed log in user with error \(error.localizedDescription)")
            throw error
        }
    }
    
    func createUser(withEmail email: String,
                    password: String,
                    userName: String,
                    fullName: String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUserData(withEmail: email, id: result.user.uid, userName: userName, fullName: fullName)
        } catch {
            print("DEBUG: failed create user with error \(error.localizedDescription)")
            throw error
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    private func uploadUserData(withEmail email: String,
                                id: String,
                                userName: String,
                                fullName: String) async throws {
        
        let user = User(id: id, userName: userName, email: email, fullname: fullName)
        try await userService.uploadUserData(user)
    }
}
