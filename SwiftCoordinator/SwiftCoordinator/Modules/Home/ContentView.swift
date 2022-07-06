//
//  ContentView.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 06/07/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var homeCoordinator = HomeCoordinator()
    
    var body: some View {
        NavigationView {
            homeView()
                .navigation(item: $homeCoordinator.firstViewModel) { viewModel in
                    FirstView(firstViewModel: viewModel)
                }
        }
    }
    
    func homeView() -> some View {
        VStack {
            Image(systemName: "flame.fill")
                .resizable()
                .frame(width: 110, height: 150)
                .foregroundColor(.orange)
            Text("Let's Go")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            Button(action: {
                homeCoordinator.openView(viewModel: FirstViewModel(coordinator: homeCoordinator.self))
            }, label: {
                Text("First Screen")
                    .padding(10)
            })
            .foregroundColor(.white)
            .background(Color.purple)
            .buttonStyle(BorderedButtonStyle())
            .cornerRadius(10)
            .padding()
            
            Button(action: {
                
            }, label: {
                Text("Second Screen")
                    .padding(10)
            })
            .foregroundColor(.white)
            .background(Color.orange)
            .buttonStyle(BorderedButtonStyle())
            .cornerRadius(10)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
