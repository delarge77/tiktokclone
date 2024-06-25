//
//  StandardButtonModifier.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-14.
//

import SwiftUI

struct StandardButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundColor(.white)
            .frame(width: 352, height: 44)
            .background(Color(.systemPink))
            .cornerRadius(8)
    }
}
