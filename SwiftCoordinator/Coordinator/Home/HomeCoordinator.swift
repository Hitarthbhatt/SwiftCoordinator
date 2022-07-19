//
//  HomeCoordinator.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 06/07/22.
//

import SwiftUI
import Combine

class HomeCoordinator: ObservableObject, SwiftUICoordinator {
    
    @Published var popToRootView: Bool?
    
    @Published var firstViewCoordinator: FirstViewCoordinator?
    @Published var secondViewCoordinator: SecondViewCoordinator?
   
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
    
    func openView<T>(coordinator: T.Type) where T : ObservableObject {
        if coordinator == FirstViewCoordinator.self {
            firstViewCoordinator = FirstViewCoordinator(closeView: {
                self.firstViewCoordinator = nil
            })
        }
        if coordinator == SecondViewCoordinator.self {
            secondViewCoordinator = SecondViewCoordinator(closeView: {
                self.secondViewCoordinator = nil
            })
        }
    }
    
}
