//
//  HomeCoordinator.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 06/07/22.
//

import SwiftUI
import Combine

class HomeCoordinator: ObservableObject, Coordinator {
    // Declared from 'Coordinator' protocol.
    @Published var popToRootView: Bool?
    
    @Published var firstViewCoordinator: FirstViewCoordinator?
    @Published var secondViewCoordinator: SecondViewCoordinator?
    
    @Published var showFirstViewSheet: Bool = false
    @Published var showFirstViewPopover: Bool = false
    
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        $popToRootView
            .sink { [weak self] shouldPop in
                guard let `self` = self else {return}
                if shouldPop ?? true {
                    self.popToRoot()
                }
            }
            .store(in: &cancellables)
    }
    
    private func popToRoot() {
        firstViewCoordinator = nil
        secondViewCoordinator = nil
    }
    
    func openView<T>(coordinator: T) where T : ObservableObject {
        if let viewModel = coordinator as? FirstViewCoordinator {
            firstViewCoordinator = viewModel
        }
        if let viewModel = coordinator as? SecondViewCoordinator {
            secondViewCoordinator = viewModel
        }
    }
    
    func closeView<T>(coordinator: T) where T : ObservableObject {
        if coordinator is FirstViewCoordinator {
            firstViewCoordinator = nil
        }
        if coordinator is SecondViewCoordinator {
            secondViewCoordinator = nil
        }
    }
    
}