//
//  Coordinator.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 06/07/22.
//

import Foundation

protocol Coordinator: AnyObject {
    func openView<T: ObservableObject>(viewModel: T)
    func closeView<T: ObservableObject>(viewModel: T)
}
