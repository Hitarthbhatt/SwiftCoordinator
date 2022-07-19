//
//  SignUpViewCoordinator.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 08/07/22.
//

import SwiftUI

class SignUpViewCoordinator: ObservableObject, SwiftUICoordinator {
    
    var closeView: CompletionAction
    
    init(closeView: @escaping CompletionAction) {
        self.closeView = closeView
    }
    
    func openView<T>(coordinator: T.Type) where T : ObservableObject {
        
    }
    
}
