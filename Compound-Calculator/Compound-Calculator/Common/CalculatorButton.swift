//
//  CalculatorButton.swift
//  Compound-Calculator
//
//  Created by 임채성 on 2024/10/26.
//

import SwiftUI

struct CalculatorButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .frame(width: 300)
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 1)
            }
            .padding(.horizontal)
    }
}
