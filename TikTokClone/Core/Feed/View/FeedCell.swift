//
//  FeedCell.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-05.
//

import SwiftUI
import AVKit

struct FeedCell: View {
    
    let post: Post
    var player: AVPlayer
    
    init(post: Post, player: AVPlayer) {
        self.post = post
        self.player = player
    }
    
    var body: some View {
        ZStack {
            CustomVideoPlayer(player: player)
                .containerRelativeFrame([.horizontal, .vertical])
            VStack {
                Spacer()
                
                HStack(alignment: .bottom) {
                    
                    VStack(alignment: .leading) {
                        Text("Carlos.sainz")
                            .fontWeight(.semibold)
                        
                        Text("Rocket ship prepare for takeoff!!!")
                        
                    }
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    
                    Spacer()
                    
                    VStack(spacing: 28){
                        
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.gray)
                        
                        Button(action: {
                            
                        }, label: {
                            VStack {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                
                                Text("27")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            VStack {
                                Image(systemName: "ellipsis.bubble.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                
                                Text("27")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .frame(width: 22, height: 28)
                                .foregroundStyle(.white)
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "arrowshape.turn.up.right.fill")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundStyle(.white)
                        })
                    }
                }
                .padding(.bottom, 80)
            }
            .padding()
        }
        .onTapGesture {
            switch player.timeControlStatus {
            case .paused:
                player.play()
            case .waitingToPlayAtSpecifiedRate:
                break
            case .playing:
                player.pause()
            @unknown default:
                break
            }
        }
    }
}

#Preview {
    FeedCell(post: Post(id: UUID().uuidString, videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4"), player: AVPlayer())
}
