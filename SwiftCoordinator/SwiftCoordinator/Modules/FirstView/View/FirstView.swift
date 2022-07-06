//
//  FirstView.swift
//  SwiftCoordinator
//
//  Created by Hitarth on 06/07/22.
//

import SwiftUI

struct FirstView: View {
    @ObservedObject var firstViewModel: FirstViewModel
    
    var body: some View {
        VStack {
            Text("First Screen")
            
            Button(action: {
                firstViewModel.popToPrevious()
            }, label: {
                Text("Go Back")
                    .padding(10)
            })
            .foregroundColor(.white)
            .background(Color.purple)
            .buttonStyle(BorderedButtonStyle())
            .cornerRadius(10)
            .padding()
            
            Button(action: {
                firstViewModel.openView(viewModel: SecondViewModel())
            }, label: {
                Text("Go To Next")
                    .padding(10)
            })
            .foregroundColor(.white)
            .background(Color.purple)
            .buttonStyle(BorderedButtonStyle())
            .cornerRadius(10)
            .padding()
            
        }
        .navigation(item: $firstViewModel.secondViewModel) { viewModel in
            SecondView()
        }
    }
}

//struct FirstView_Previews: PreviewProvider {
//    static var previews: some View {
//        FirstView()
//    }
//}
