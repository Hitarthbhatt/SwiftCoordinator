//
//  SwiftUICoordinator.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 06/07/22.
//

import SwiftUI

typealias CompletionAction = ()->Void

protocol SwiftUICoordinator: AnyObject {
    var popToRootView: Bool? { get set }
    var closeView: CompletionAction { get set }
    
    func openView<T: ObservableObject>(coordinator: T.Type)
    func changeRootView<T: View>(view: T)
}

extension SwiftUICoordinator {
    
    var popToRootView: Bool? {
        get {self.popToRootView}
        set {self.popToRootView = newValue}
    }
    
    var closeView: CompletionAction {
        get {self.closeView}
        set {self.closeView = newValue}
    }

    func changeRootView<T: View>(view: T) {
        let window = UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }
        
        window?.rootViewController = UIHostingController(rootView: view)
        window?.makeKeyAndVisible()
        
        guard let window = window else { return }
        UIView.transition(with: window, duration: 1, options: .transitionCrossDissolve, animations: {})
    }
}

