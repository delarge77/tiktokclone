//
//  LoginView.swift
//  TikTokClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-07.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @StateObject var viewModel: LoginViewModel
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
        self._viewModel = StateObject(wrappedValue: LoginViewModel(authService: authService))
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Spacer()
                
                Image("tiktok")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .padding()
                
                VStack{
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.never)
                        .modifier(StandardTextFieldModifier())
                    
                    SecureField("Enter your password", text: $password)
                        .modifier(StandardTextFieldModifier())
                }
                
                NavigationLink {
                    Text("Forgot password?")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button {
                    Task { await viewModel.login(withEmail: email, password: password) }
                } label: {
                    Text("Login")
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
                
                NavigationLink {
                    RegistrationView(authService: authService)
                } label: {
                    HStack(spacing: 3) {
                        Text("Dont have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .padding(.vertical)
                }

            }
        }
    }
}

// MARK: - AuthenticationFormProtocol

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
    }
}

#Preview {
    LoginView(authService: AuthService(userService: UserService()))
}
