//
//  ProfileView.swift
//  WAM
//
//  Created by Younuz Bin Noushad on 07/05/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel:AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initial)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.ybn2)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        
                        VStack (alignment: .leading, spacing: 4) {
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            Text(user.email)
                            .font(.footnote)
                            .foregroundColor(.gray)
                        }
                    }
                    
                }
                Section ("General") {
                    HStack {
                        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                }
                Section ("Account") {
                    
                    Button {
                        viewModel.signOut()
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                    }
                    Button {
                        print("Delete account...")
                    } label: {
                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                    }

                    
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
