//
//  FirstViewModel.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 06/07/22.
//

import SwiftUI

class FirstViewCoordinator: ObservableObject, SwiftUICoordinator {
    
    @Published var secondViewCoordinator: SecondViewCoordinator?
    
    var closeView: CompletionAction
    
    init(closeView: @escaping CompletionAction) {
        self.closeView = closeView
    }
    
    func openView<T>(coordinator: T.Type) where T : ObservableObject {
        if coordinator == SecondViewCoordinator.self {
            secondViewCoordinator = SecondViewCoordinator(closeView: {
                self.secondViewCoordinator = nil
            })
        }
    }
    
}
