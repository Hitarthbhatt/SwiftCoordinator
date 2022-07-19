//
//  SecondViewModel.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 06/07/22.
//

import SwiftUI

class SecondViewCoordinator: ObservableObject, SwiftUICoordinator, Identifiable {
    
    var closeView: CompletionAction
    
    init(closeView: @escaping CompletionAction) {
        self.closeView = closeView
    }
    
    func openView<T>(coordinator: T.Type) where T : ObservableObject {
    }

}
