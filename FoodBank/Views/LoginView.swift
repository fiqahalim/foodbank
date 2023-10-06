//
//  LoginView.swift
//  FoodBank
//
//  Created by Fiqahalim on 20/09/2023.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var LoginViewß: String
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showHomeScreen = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.green
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack {
                    Image("Logo2").padding(.bottom, 10)
                    
                    Text("FoodHero connects merchants to consumers to quickly sell fresh surplus food that would otherwise end up in the trash")
                        .font(.body)
                        .fontWeight(.ultraLight)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50.0)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Login") {
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                    
                    Button(action: {
                        withAnimation {
                            self.LoginView = "register"
                        }
                    }) {
                        Text("Don't have an account?")
                            .foregroundColor(.black.opacity(0.7))
                    }
                    
                    NavigationLink(destination: Text("You are logged in @\(username)"), isActive: $showHomeScreen) {
                        EmptyView()
                    }
                }
            }.navigationBarHidden(true)
        }
    }
    
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "mario2021" {
            wrongUsername = 0
            if password.lowercased() == "abc123" {
                wrongPassword = 0
                showHomeScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

#Preview {
    LoginView()
}
