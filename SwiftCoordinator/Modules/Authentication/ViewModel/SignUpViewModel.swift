//
//  SignUpViewModel.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 08/07/22.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    
    let coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func popToPrevious() {
        coordinator.closeView(coordinator: self)
    }
    
}
