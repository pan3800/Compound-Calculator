//
//  Currency.swift
//  Compound-Calculator
//
//  Created by 임채성 on 2024/10/26.
//

import SwiftUI

struct SettingView: View {
    @State private var isDarkMode: Bool = false // 다크 모드 상태
    
    var body: some View {
        CommonButtonView {
            
            HStack {
                Button {
                    UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .light
                } label: {
                    Image(systemName: "cloud.sun")
                        .font(.largeTitle)
                }
                
                Button {
                    UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .dark
                } label: {
                    Image(systemName: "moon.stars")
                        .font(.largeTitle)
                }
            }
        }
    }
}

struct Currency_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
