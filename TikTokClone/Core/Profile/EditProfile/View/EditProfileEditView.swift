//
//  EditProfileEditView.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-12.
//

import SwiftUI

struct EditProfileEditView: View {
    @Environment(\.dismiss) var dismiss
    @State private var value = ""
    let option: EditProfileOptions
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Add your bio", text: $value)
                
                Spacer()
                
                if !value.isEmpty {
                    Button(action: {
                        value = ""
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.gray)
                    })
                }
            }
            
            Divider()
            
            Text(subtitle)
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding(.top, 8)
            
            Spacer()
        }
        .padding()
        .navigationTitle(option.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .onAppear { onViewAppear() }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    
                }
                .fontWeight(.semibold)
            }
        }
    }
}

private extension EditProfileEditView {
    var subtitle: String {
        switch option {
        case .name:
            "Your full name can only be changed once every 7 days"
        case .bio:
            "Tell us a bit about yourself"
        case .userName:
            "Usernames can contain only letters, numbers, underscores and periods"
        }
    }
    
    func onViewAppear() {
        switch option {
        case .name:
            value = user.fullname
        case .bio:
            value = user.bio ?? "" 
        case .userName:
            value = user.userName
        }
    }
}

#Preview {
    NavigationStack {
        EditProfileEditView(option: .userName, user: DeveloperPreview.user)
            .tint(.primary)
    }
}
