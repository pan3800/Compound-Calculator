//
//  TextFieldModifier.swift
//  Compound-Calculator
//
//  Created by 임채성 on 2024/10/25.
//

import SwiftUI

struct TextFieldModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 1)
            }
            .padding(.horizontal)
    }
}
