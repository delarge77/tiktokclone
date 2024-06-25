//
//  ImageUploader.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-12.
//

import UIKit
import FirebaseStorage

struct ImageUploaderService {
    func uploadImage(image: UIImage) async throws -> String? {
        
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Filed upload image with error: \(error.localizedDescription)")
            return nil
        }
    }
}
