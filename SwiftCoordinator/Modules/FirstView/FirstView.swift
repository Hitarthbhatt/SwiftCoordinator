//
//  FirstView.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 06/07/22.
//

import SwiftUI

struct FirstView: View {
    @ObservedObject var firstViewCoordinator: FirstViewCoordinator
    
    var body: some View {
        VStack {
            Button(action: {
                firstViewCoordinator.popToPrevious()
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
                firstViewCoordinator.openView(coordinator: SecondViewCoordinator(coordinator: firstViewCoordinator))
            }, label: {
                Text("Go To Next")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.purple)
                    .buttonStyle(BorderedButtonStyle())
                    .cornerRadius(10)
                    .padding()
            })
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("First Screen")
        .navigation(item: $firstViewCoordinator.secondViewCoordinator) { coordinator in
            SecondView(secondViewCoordinator: coordinator)
        }
    }
}
