//
//  RegistrationView.swift
//  WAM
//
//  Created by Younuz Bin Noushad on 07/05/24.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var degrees: Double = 0
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
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
        }
        
        VStack(spacing: 24) {
            InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                .autocapitalization(.none)
            InputView(text: $fullname, title: "Full Name", placeholder: "Enter your name")
            
            InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
            
            ZStack (alignment: .trailing) {
                InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
                
                if !password.isEmpty && !confirmPassword.isEmpty {
                    if password == confirmPassword {
                        Image(systemName: "checkmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemGreen))
                    } else {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemRed))
                    }
                }
            }
              
            
        }
        .padding(.horizontal)
        .padding(.top, 12)
        
        
        Button {
            Task {
                try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
            }
        } label: {
            HStack {
                Text("SIGN UP")
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
        
        Button {
            dismiss()
        } label: {
            HStack {
                Text("Already have an account?")
                Text("Sign in")
                    .fontWeight(.bold)
            }
            .font(.system(size: 14)) 
            .foregroundColor(.ybn)
        }

        
    }
}


extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !fullname.isEmpty
    }
    
    
}

#Preview {
    RegistrationView()
}
