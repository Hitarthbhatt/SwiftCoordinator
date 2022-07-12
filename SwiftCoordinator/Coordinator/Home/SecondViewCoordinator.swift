//
//  SecondViewModel.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 06/07/22.
//

import SwiftUI

class SecondViewCoordinator: ObservableObject, SwiftUICoordinator, Identifiable {
    
    private let coordinator: SwiftUICoordinator
    
    init(coordinator: SwiftUICoordinator) {
        self.coordinator = coordinator
    }
    
    func popToPrevious() {
        coordinator.closeView(coordinator: self)
    }
    
    func openView<T>(coordinator: T) where T : ObservableObject {
    }
    
    func closeView<T>(coordinator: T) where T : ObservableObject {
    }
    
}
