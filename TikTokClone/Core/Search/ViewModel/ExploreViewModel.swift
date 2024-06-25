//
//  ExploreViewModel.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-11.
//

import Foundation

@MainActor
class ExploreViewModel: ObservableObject {
    
    @Published var users = [User]()
    private let service: UserServiceProtocol
    
    init(service: UserServiceProtocol) {
        self.service = service
        Task { await fetchUsers() }
    }
    
    
    func fetchUsers() async {
        do {
            self.users = try await self.service.fetchUser()
        } catch {
            print("DEBUG: failed to fecth users with error: \(error.localizedDescription)")
        }
    }
}
