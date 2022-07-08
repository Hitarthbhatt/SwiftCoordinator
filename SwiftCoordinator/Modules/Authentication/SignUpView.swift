//
//  SignUpView.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 07/07/22.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var signupViewModel: SignUpViewCoordinator
    @State var emailField: String = ""
    @State var passwordField: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                headerView()
                Spacer()
                credentialField()
                
                signUpButton {
                    signupViewModel.coordinator.changeRootView(view: HomeView())
                }
                
                goBackButton {
                    signupViewModel.popToPrevious()
                }
                
                Spacer()
            } // VStack
        }.navigationBarHidden(true)
    }
    
    func headerView() -> some View {
        HStack {
            Image(systemName: "key.icloud.fill")
            Text("Sign Up")
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
    
    func signUpButton(action: @escaping ()->Void) -> some View {
        Button(action: {
            action()
        }, label: {
            Text("Sign Up")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 120, height: 40)
                .background(Color.black)
                .cornerRadius(6)
                .padding(.top)
        })
    }
    
    func goBackButton(action: @escaping ()->Void) -> some View {
        Button(action: {
            action()
        }, label: {
            Text("Go Back")
                .fontWeight(.semibold)
                .foregroundColor(.blue)
                .padding(.top, 8)
        })
    }
}
