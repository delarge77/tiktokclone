//
//  EditProfileManager.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-12.
//

import UIKit
import FirebaseAuth

class EditProfileManager: ObservableObject {
    
    private let imageUploaderService: ImageUploaderService
    
    init(imageUploaderService: ImageUploaderService) {
        self.imageUploaderService = imageUploaderService
    }
    
    func uploadProfileImage(image: UIImage) async throws {
        do {
            let profileImageUrl = try await ImageUploaderService().uploadImage(image: image)
            try await uploadUserProfileImageUrl(profileImageUrl)
        } catch {
            print("DEBUG: Handle image uploader error ...")
        }
    }
    
    private func uploadUserProfileImageUrl(_ imageUrl: String?) async throws {
        guard let imageUrl else { return }
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        try await FirestoreConstants.UsersCollection.document(currentUid).updateData([
            "profileImageUrl": imageUrl
        ])
    }
}
