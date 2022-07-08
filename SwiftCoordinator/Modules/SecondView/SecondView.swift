//
//  SecondView.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 06/07/22.
//

import SwiftUI

struct SecondView: View {
    
    @ObservedObject var secondViewModel: SecondViewCoordinator
    @EnvironmentObject var homeCoordinator: HomeCoordinator
    
    var body: some View {
        Button(action: {
            secondViewModel.popToRootView = true
        }, label: {
            Text("Go To Root")
                .padding(10)
        })
        .foregroundColor(.white)
        .background(Color.purple)
        .buttonStyle(BorderedButtonStyle())
        .cornerRadius(10)
        .padding()
        .navigationBarHidden(true)
        .navigationTitle("Second Screen")
    }
}

//struct SecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondView()
//    }
//}
