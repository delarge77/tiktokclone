//
//  Firestore+Constants.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-11.
//

import FirebaseFirestore

struct FirestoreConstants {
    static let Root = Firestore.firestore()
    static let UsersCollection = Root.collection("users")
}
