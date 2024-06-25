//
//  FeedViewModel.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-06.
//

import Foundation

class FeedViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    let videosUrls = [
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4"
    ]
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        self.posts = [
            .init(id: UUID().uuidString, videoUrl: videosUrls[0]),
            .init(id: UUID().uuidString, videoUrl: videosUrls[1]),
            .init(id: UUID().uuidString, videoUrl: videosUrls[2]),
            .init(id: UUID().uuidString, videoUrl: videosUrls[3]),
        ]
    }
}
