//
//  FirstViewModel.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 06/07/22.
//

import SwiftUI

class FirstViewModel: ObservableObject, Coordinator {
    
    @Published var secondViewModel: SecondViewModel?
    
    private unowned let coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func popToPrevious() {
        coordinator.closeView(viewModel: self)
    }
    
    func openView<T>(viewModel: T) where T : ObservableObject {
        if let viewModel = viewModel as? SecondViewModel {
            secondViewModel = viewModel
        }
    }
    
    func closeView<T>(viewModel: T) where T : ObservableObject {
    }
    
}
