//
//  CommonButtonView.swift
//  Compound-Calculator
//
//  Created by 임채성 on 2024/10/23.
//

import SwiftUI

struct CommonButtonView<Content: View>: View{
    @Environment(\.dismiss) var dismiss
    let content: Content

    init(@ViewBuilder content: () -> Content) {
            self.content = content()
    }
    
    var body: some View {
          ZStack {
              content
          }
          .navigationBarBackButtonHidden(true)
          .navigationBarBackButtonHidden(true)
          .navigationBarItems(leading: Button(action: {
              dismiss()
          }) {
              Image(systemName: "chevron.left")
                .foregroundColor(.blue)
          })
      }
}
