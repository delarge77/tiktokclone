//
//  UserService.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-11.
//

import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore


protocol UserServiceProtocol {
    func fetchUser() async throws -> [User]
    func fetchCurrentUser() async throws -> User?
    func uploadUserData(_ user: User) async throws
}

struct UserService: UserServiceProtocol {
    
    func fetchCurrentUser() async throws -> User? {
        guard let currentUid = Auth.auth().currentUser?.uid else { return  nil }
        return try await FirestoreConstants.UsersCollection.document(currentUid).getDocument(as: User.self)
    }
    
    func uploadUserData(_ user: User) async throws {
        do {
            let userData = try Firestore.Encoder().encode(user)
            try await FirestoreConstants.UsersCollection.document(user.id).setData(userData)
        } catch {
            throw error
        }
    }
    
    func fetchUser() async throws -> [User] {
        do {
            let snapshot = try await FirestoreConstants.UsersCollection.getDocuments()
            return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        } catch {
            throw error
        }
    }
}

struct MockUserService: UserServiceProtocol {
    func fetchCurrentUser() async throws -> User? {
        return DeveloperPreview.user
    }
    
    func uploadUserData(_ user: User) async throws {}
    
    func fetchUser() async throws -> [User] {
        return DeveloperPreview.users
    }
    
    
}
