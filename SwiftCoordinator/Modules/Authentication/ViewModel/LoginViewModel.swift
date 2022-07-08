//
//  AuthenticationCoordinator.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 07/07/22.
//

import Combine

class LoginViewModel: ObservableObject, Coordinator {
    
    @Published var signUpViewModel: SignUpViewModel?
    
    func openView<T>(coordinator: T) where T : ObservableObject {
        if let viewModel = coordinator as? SignUpViewModel {
            signUpViewModel = viewModel
        }
    }
    
    func closeView<T>(coordinator: T) where T : ObservableObject {
        if coordinator is SignUpViewModel {
            signUpViewModel = nil
        }
    }
    

}
