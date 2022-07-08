//
//  AuthenticationCoordinator.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 07/07/22.
//

import Combine

class LoginViewCoordinator: ObservableObject, Coordinator {
    
    @Published var signUpViewCoordinator: SignUpViewCoordinator?
    
    func openView<T>(coordinator: T) where T : ObservableObject {
        if let viewModel = coordinator as? SignUpViewCoordinator {
            signUpViewCoordinator = viewModel
        }
    }
    
    func closeView<T>(coordinator: T) where T : ObservableObject {
        if coordinator is SignUpViewCoordinator {
            signUpViewCoordinator = nil
        }
    }
    

}
