//
//  SecondView.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 06/07/22.
//

import SwiftUI

struct SecondView: View {
    
    @ObservedObject var secondViewCoordinator: SecondViewCoordinator
    @EnvironmentObject var homeCoordinator: HomeCoordinator
    
    var body: some View {
        
        VStack {
            Button(action: {
                secondViewCoordinator.popToPrevious()
            }, label: {
                Text("Go Back")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.purple)
                    .buttonStyle(BorderedButtonStyle())
                    .cornerRadius(10)
                    .padding()
            })
            
            Button(action: {
                homeCoordinator.popToRootView = true
            }, label: {
                Text("Go To Root")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.purple)
                    .buttonStyle(BorderedButtonStyle())
                    .cornerRadius(10)
                    .padding()
            })
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Second Screen")
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(secondViewCoordinator: SecondViewCoordinator(coordinator: HomeCoordinator()))
    }
}
