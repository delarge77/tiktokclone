//
//  UploadPostView.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-14.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var caption = ""
    
    var body: some View {
        
        VStack() {
            HStack(alignment: .top) {
                TextField("Enter your caption", text: $caption, axis: .vertical)
                Spacer()
                Image(.tiktok)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 88, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Divider()
            
            Spacer()
            
            Button{
                
            } label: {
                Text("Post")
            }
            .modifier(StandardButtonModifier())
        }
        .padding()
        .navigationTitle("Post")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        UploadPostView()
    }
}
