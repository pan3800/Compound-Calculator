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
                    Text("기본")
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 10)
                
           
                NavigationLink(destination: Accumulation()) {
                    Text("적립식")
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 10)
                
                NavigationLink {
                    SettingView()
                } label: {
                    HStack {
                        Spacer()
                        Text("설정")
                            .padding(.leading, 40)
                        Spacer()
                        
                        Image(systemName: "gearshape")
                            .padding()
                            
                    }
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.top, 10)
                
             
                
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
