//
//  SignUpViewCoordinator.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 08/07/22.
//

import SwiftUI

class SignUpViewCoordinator: ObservableObject {
    
    let coordinator: SwiftUICoordinator
    
    init(coordinator: SwiftUICoordinator) {
        self.coordinator = coordinator
    }
    
    func popToPrevious() {
        coordinator.closeView(coordinator: self)
    }
    
}
