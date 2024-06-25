//
//  RegistrationView.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-07.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var username = ""
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: RegistrationViewModel
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
        self._viewModel = StateObject(wrappedValue: RegistrationViewModel(authService: authService))
    }
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Image("tiktok")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 140)
            VStack {
                TextField("Enter your email", text: $email)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
                
                SecureField("Enter your password", text: $password)
                    .modifier(StandardTextFieldModifier())
                
                TextField("Enter your full name", text: $fullName)
                    .modifier(StandardTextFieldModifier())
                
                TextField("Enter your username", text: $username)
                    .modifier(StandardTextFieldModifier())
            }
            
            Button {
                Task {
                    await viewModel.createUser(withEmail:email,
                                               password: password,
                                               username:username,
                                               fullName:fullName)
                }
            } label: {
                Text("Sign up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(minWidth: 350, minHeight: 44)
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.vertical)
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.7)
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .padding(.vertical)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

// MARK: - AuthenticationFormProtocol

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && !fullName.isEmpty
        && !username.isEmpty
    }
}

#Preview {
    RegistrationView(authService: AuthService(userService: UserService()))
}
