//
//  AuthenticationCoordinator.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 07/07/22.
//

import Combine

class LoginViewCoordinator: ObservableObject, SwiftUICoordinator {
    
    @Published var signUpViewCoordinator: SignUpViewCoordinator?
    
    func openView<T>(coordinator: T.Type) where T : ObservableObject {
        if let viewModel = coordinator as? SignUpViewCoordinator {
            signUpViewCoordinator = viewModel
        }
    }

}
