//
//  SheetView.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 08/07/22.
//

import SwiftUI

struct PresentView: View {
    var body: some View {
        Text("Hello, World!")
            .navigationTitle("Sheet View")
            .navigationBarHidden(true)
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        PresentView()
    }
}
