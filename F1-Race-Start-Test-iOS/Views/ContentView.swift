//
//  ContentView.swift
//  F1-Race-Start-Test-iOS
//
//  Created by Florian DAVID on 23/11/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = UserViewModel()
    @State private var buttonHidden = false
    @State private var profileOn = false
    
    var body: some View {
        NavigationView {
            VStack {
                LightsView(buttonHidden: $buttonHidden)
                    /*.onChange(of: profileOn, perform: { value in
                        if value {
                            Task.init {
                                await viewModel.signGoogle()
                            }
                        }
                    })*/
                
                Spacer()
                
                if !buttonHidden {
                    HStack {
                        Button(action: {
                            profileOn.toggle()
                        }, label: {
                            Image(systemName: "line.horizontal.3")
                                .imageScale(.large)
                        })
                        
                        Spacer()
                        
                        
                        Button {
                            buttonHidden.toggle()
                        } label: {
                            Text("START")
                                .frame(width: 100, height: 40)
                                .background(.green)
                                .foregroundColor(.white)
                                .bold()
                                .cornerRadius(10)
                        }
                        
                        
                        Spacer()
                        
                        NavigationLink(destination: EmptyView()) {
                            Image(systemName: "person.circle.fill")
                                .imageScale(.large)
                        }
                    }
                    .padding(.horizontal)
                    .frame(height: 50)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
