//
//  Basics.swift
//  Compound-Calculator
//
//  Created by 임채성 on 2024/10/23.
//

import SwiftUI

struct Basics: View {
    @State private var principal: String = ""
    @State private var rate: String = ""
    @State private var time: String = ""
    @State private var result: Double = 0.0
    
    var body: some View {
        CommonButtonView {
            
            VStack(spacing: 20) {
                Text("복리 계산기")
                    .font(.largeTitle)
        
                TextField("초기 금액", text: $principal)
                    .keyboardType(.decimalPad)
                    .padding()
                    .border(Color.gray)
                
                TextField("기간 입력 (년)", text: $time)
                    .keyboardType(.numberPad)
                    .padding()
                    .border(Color.gray)
                
                HStack {
                    TextField("수익률 입력 (연 수익률 %)", text: $rate)
                        .keyboardType(.decimalPad)
                        .padding()
                        .border(Color.gray)
                }
                
                Button(action: calculateCompoundInterest) {
                    Text("계산하기")
                        .frame(width: 150)
                        .foregroundColor(.gray)
                        .padding()
                        .background(Color.white)
                        .border(Color.gray)
                        .cornerRadius(1)
                        .padding(.top, 15)
                }
                
                Text("최종 금액: \(result, specifier: "%.0f") 원")
                    .font(.title)
                    .padding()
            }
        }
        .padding()
    }
    
    func calculateCompoundInterest() {
         let principalAmount = Double(principal) ?? 0
         let interestRate = Double(rate) ?? 0
         let timePeriod = Double(time) ?? 0
         
         // 복리 계산 공식: A = P(1 + r/n)^(nt)
         // 여기서 n은 1 (연 복리)로 가정
         let amount = principalAmount * pow(1 + interestRate / 100, timePeriod)
         result = amount
     }
}

struct Basics_Previews: PreviewProvider {
    static var previews: some View {
        Basics()
    }
}
