//
//  FirstViewModel.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 06/07/22.
//

import SwiftUI

class FirstViewCoordinator: ObservableObject, SwiftUICoordinator {
    
    @Published var secondViewCoordinator: SecondViewCoordinator?
    
    private let coordinator: SwiftUICoordinator
    
    init(coordinator: SwiftUICoordinator) {
        self.coordinator = coordinator
    }
    
    func popToPrevious() {
        coordinator.closeView(coordinator: self)
    }
    
    func openView<T>(coordinator: T) where T : ObservableObject {
        if let viewModel = coordinator as? SecondViewCoordinator {
            secondViewCoordinator = viewModel
        }
    }
    
    func closeView<T>(coordinator: T) where T : ObservableObject {
        if coordinator is SecondViewCoordinator {
            secondViewCoordinator = nil
        }
    }
    
}
