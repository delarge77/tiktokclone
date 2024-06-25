//
//  EditProfileView.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-12.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @State private var selectedPickerItem: PhotosPickerItem?
    @State private var profileImage: Image?
    @State private var uiImage: UIImage?
    let user: User
    @Environment(\.dismiss) var dismiss
    
    @StateObject var manager = EditProfileManager(imageUploaderService: ImageUploaderService())
    
    var body: some View {
        NavigationStack {
            VStack{
                PhotosPicker(selection: $selectedPickerItem, matching: .images) {
                    VStack {
                        if let image = profileImage {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: avatarSize.dimension, height: avatarSize.dimension)
                                .clipShape(Circle())
                        } else {
                            AvatarView(user: user, size: avatarSize)
                        }
                        
                        Text("Change photo")
                            .foregroundStyle(.black)
                    }
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("About you")
                        .font(.footnote)
                        .foregroundStyle(Color(.systemGray2))
                        .fontWeight(.semibold)
                    
                    EditProfileOptionRowView(option: .name, value: user.fullname)
                    EditProfileOptionRowView(option: .userName, value: user.userName)
                    EditProfileOptionRowView(option: .bio, value: user.bio ?? "Add a bio" )
                }
                .font(.subheadline)
                .padding()
                
                Spacer()
            }
            .task(id: selectedPickerItem) {
                await loadImage(fromItem: selectedPickerItem)
            }
            .navigationDestination(for: EditProfileOptions.self, destination: { option in
                EditProfileEditView(option: option, user: user)
            })
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        onDoneTapped()
                    }
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

private extension EditProfileView {
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func onDoneTapped() {
        Task {
            guard let uiImage else { return }
            try await manager.uploadProfileImage(image: uiImage)
            dismiss()
        }
    }
    
    var avatarSize: AvatarSize {
        return .large
    }
}

#Preview {
    EditProfileView(user: DeveloperPreview.user)
}


