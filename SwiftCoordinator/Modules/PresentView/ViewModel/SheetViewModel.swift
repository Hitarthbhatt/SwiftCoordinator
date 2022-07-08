//
//  SheetViewModel.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 08/07/22.
//

import SwiftUI

class SheetViewModel: ObservableObject, Coordinator, Identifiable {
    func closeView<T>(coordinator: T) where T : ObservableObject {
    }
    
    func openView<T>(coordinator: T) where T : ObservableObject {
    }
}
