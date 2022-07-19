//
//  LoginView.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 07/07/22.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginViewModel = LoginViewCoordinator()
    @State var emailField: String = ""
    @State var passwordField: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                headerView()
                Spacer()
                credentialField()
                
                loginButton {
                    loginViewModel.changeRootView(view: HomeView())
                }
                
                signUpButton {
                    loginViewModel.openView(coordinator: SignUpViewCoordinator.self)
                }
                
                Spacer()
            } // VStack
            .navigation(item: $loginViewModel.signUpViewCoordinator) { viewModel in
                SignUpView(signupViewModel: viewModel)
            }
        }.navigationBarHidden(true)
    }
    
    func headerView() -> some View {
        HStack {
            Image(systemName: "key.icloud.fill")
            Text("Login View")
                .fontWeight(.bold)
        }
        .font(.title)
        .foregroundColor(.orange)
    }
    
    func credentialField() -> some View {
        VStack {
            TextField("Please enter your email", text: $emailField)
                .padding()
                .background(Color.gray.opacity(0.15))
                .cornerRadius(6)
                .padding()
            
            
            SecureField("Please enter your password", text: $passwordField)
                .padding()
                .background(Color.gray.opacity(0.15))
                .cornerRadius(6)
                .padding(.horizontal)
        } // VStack
    }
    
    func loginButton(action: @escaping ()->Void) -> some View {
        Button(action: {
            action()
        }, label: {
            Text("Login")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 120, height: 40)
                .background(Color.black)
                .cornerRadius(6)
                .padding(.top)
        })
    }
    
    func signUpButton(action: @escaping ()->Void) -> some View {
        Button(action: {
            action()
        }, label: {
            Text("Create new account")
                .fontWeight(.semibold)
                .foregroundColor(.blue)
                .padding(.top, 8)
        })
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
