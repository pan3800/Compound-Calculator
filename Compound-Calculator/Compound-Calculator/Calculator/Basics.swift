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
                Text("기본 계산기")
                    .font(.largeTitle)
                
                TextField("초기 금액 입력", text: Binding(
                        get: { formatNumber(principal) },
                        set: { principal = $0.replacingOccurrences(of: ",",with: "") }
                    ))
                    .keyboardType(.decimalPad)
                    .padding()
                    .border(Color.gray)
                
                TextField("기간 입력 (년)", text: $time)
                    .keyboardType(.numberPad)
                    .padding()
                    .border(Color.gray)
                
                
                ZStack {
                    TextField("수익률 입력 (연 수익률)", text: $rate)
                        .keyboardType(.decimalPad)
                        .padding()
                        .border(Color.gray)
                              
                        // TextField 오른쪽에 % 기호를 추가
                        HStack {
                            Spacer() // 오른쪽에 붙이기 위해 Spacer 사용
                            Text("%")
                                .padding(.trailing, 10) // 적당한 간격을 유지
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                }
                
                Button {
                    calculateCompoundInterest()
                } label: {
                    Text("계산하기")
                        .modifier(CalculatorButton())
                }
                
                Text("최종 금액: \(result, specifier: "%.0f") 원")
                    .font(.title)
                    .padding()
            }
        }
        .padding()
    }
    
    func formatNumber(_ value: String) -> String {
           guard let doubleValue = Double(value) else { return value }
           
           let formatter = NumberFormatter()
           formatter.numberStyle = .decimal
           return formatter.string(from: NSNumber(value: doubleValue)) ?? value
       }
       
       func calculateCompoundInterest() {
           let principalAmount = Double(principal) ?? 0
           let interestRate = (Double(rate) ?? 0) / 100 // 연 이자율
           let timePeriod = Double(time) ?? 0
           
           // 단일 원금 기준 복리 계산 공식: A = P(1 + r)^t
           let amount = principalAmount * pow(1 + interestRate, timePeriod)
           result = amount
       }
}

struct Basics_Previews: PreviewProvider {
    static var previews: some View {
        Basics()
    }
}
