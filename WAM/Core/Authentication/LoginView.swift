//
//  LoginView.swift
//  WAM
//
//  Created by Younuz Bin Noushad on 07/05/24.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var degrees: Double = 0
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        
        NavigationStack {
            VStack {
                let imageName = colorScheme == .dark ? "logo2" : "logo"
                Image(imageName)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .padding(.vertical, 32)
                                    .rotationEffect(.degrees(degrees))
                                    .onAppear {
                                        withAnimation(Animation.linear(duration: 10).repeatForever(autoreverses: false)) {
                                            self.degrees = 360
                                        }
                                    }
                
                VStack(spacing: 24) {
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                        .autocapitalization(.none)
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                      
                    
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                Button {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.ybn2)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.ybn))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.9 )
                .cornerRadius(10)
                .padding(.top, 24)
                
                
                Spacer()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                    
                } label: {
                    HStack {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.ybn)
                }

            }
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
    
    
}


#Preview {
    LoginView()
}
