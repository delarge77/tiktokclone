//
//  NotificationsView.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-05.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(1 ..< 24) { notification in
                    NotificationCell()
                        .padding(.top)
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top)
        }
    }
}

#Preview {
    NotificationsView()
}
