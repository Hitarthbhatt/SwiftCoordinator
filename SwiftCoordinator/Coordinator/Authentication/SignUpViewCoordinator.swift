//
//  SignUpViewCoordinator.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 08/07/22.
//

import SwiftUI

class SignUpViewCoordinator: ObservableObject {
    
    let coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func popToPrevious() {
        coordinator.closeView(coordinator: self)
    }
    
}
