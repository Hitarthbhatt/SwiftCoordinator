//
//  HomeCoordinator.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 06/07/22.
//

import SwiftUI

class HomeCoordinator: ObservableObject, Coordinator {
    
    @Published var firstViewModel: FirstViewModel?
    @Published var secondViewModel: SecondViewModel?
    
    func openView<T>(viewModel: T) where T : ObservableObject {
        if let viewModel = viewModel as? FirstViewModel {
            firstViewModel = viewModel
        }
        if let viewModel = viewModel as? SecondViewModel {
            secondViewModel = viewModel
        }
    }
    
    func closeView<T>(viewModel: T) where T : ObservableObject {
        if viewModel is FirstViewModel {
            firstViewModel = nil
        }
        if viewModel is SecondViewModel {
            secondViewModel = nil
        }
    }
    
}
