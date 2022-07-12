//
//  SwiftUICoordinator.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 06/07/22.
//

import SwiftUI

protocol SwiftUICoordinator: AnyObject {
    var popToRootView: Bool? { get set }
    
    func openView<T: ObservableObject>(coordinator: T)
    func closeView<T: ObservableObject>(coordinator: T)
    func changeRootView<T: View>(view: T)
}

extension SwiftUICoordinator {
    
    var popToRootView: Bool? {
        get {self.popToRootView}
        set {self.popToRootView = newValue}
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

