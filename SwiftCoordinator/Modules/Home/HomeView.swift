//
//  ContentView.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 06/07/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeCoordinator = HomeCoordinator()
    
    var body: some View {
        NavigationView {
            homeView()
                .navigation(item: $homeCoordinator.firstViewCoordinator) { coordinator in
                    FirstView(firstViewCoordinator: coordinator)
                }
                .sheet(item: $homeCoordinator.secondViewCoordinator) { coordinator in
                    SecondView(secondViewCoordinator: coordinator)
                }
        }.environmentObject(homeCoordinator)
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
            
            HStack(spacing: 50) {
                boxView(name: "Navigation", color: .purple) {
                    homeCoordinator.openView(coordinator: FirstViewCoordinator.self)
                }
                
                boxView(name: "Sheet", color: .orange) {
                    homeCoordinator.openView(coordinator: SecondViewCoordinator.self)
                }
            }
            
            boxView(name: "Log Out", color: .indigo) {
                homeCoordinator.changeRootView(view: LoginView())
            }.padding()
            
            Spacer()
        }
    }
    
    func boxView(name: String, color: Color, action: @escaping ()->Void) -> some View {
        Button(action: {
            action()
        }, label: {
            Text(name)
                .frame(width: 150, height: 150)
                .foregroundColor(.white)
                .background(color)
                .cornerRadius(10)
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
