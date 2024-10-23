//
//  ContentView.swift
//  Compound-Calculator
//
//  Created by 임채성 on 2024/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                NavigationLink(destination: Basics()) {
                    Text("Basics")
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
           
                NavigationLink(destination: Accumulation()) {
                    Text("Accumulation")
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
