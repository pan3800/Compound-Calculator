import SwiftUI

struct Accumulation: View {
    @State private var principal: String = ""
    @State private var rate: String = ""
    @State private var time: String = "" // 기간을 년 단위로 입력
    @State private var payment: String = "" // 월별 추가 적립금
    @State private var result: Double = 0.0
    
    var body: some View {
        CommonButtonView {
            VStack(spacing: 20) {
                Text("적립식 계산")
                    .font(.largeTitle)
                    .padding(.bottom, 25)
                
                VStack (alignment: .leading) {
                    Text("시작 금액")
                        .padding(.horizontal)
                    
                    TextField("시작 금액 입력", text: Binding(
                        get: { formatNumber(principal) },
                        set: { principal = $0.replacingOccurrences(of: ",", with: "") }
                    ))
                    .keyboardType(.decimalPad)
                    .modifier(TextFieldModifier())
                }
                
                VStack (alignment: .leading){
                    Text("매월 적립 금액")
                        .padding(.horizontal)
                    
                    TextField("매월 추가 적립금 입력", text: Binding(
                        get: { formatNumber(payment) },
                        set: { payment = $0.replacingOccurrences(of: ",", with: "") }
                    ))
                    .keyboardType(.decimalPad)
                    .modifier(TextFieldModifier())
                }
                
                VStack (alignment: .leading){
                    HStack {
                        Text("투자기간")
                            .padding(.horizontal)
                        
                        
                    }
                    
                    TextField("투자기간 입력", text: $time)
                        .modifier(TextFieldModifier())
                }
                .padding(.top, 5)

                ZStack {
                    VStack (alignment: .leading) {
                        Text("이자율")
                            .padding(.horizontal)
                        
                        TextField("수익률 입력 (연 수익률)", text: $rate)
                            .keyboardType(.decimalPad)
                            .modifier(TextFieldModifier())

                    }
                }
                
                Button {
                    calculateCompoundInterest()
                } label: {
                    Text("계산하기")
                        .modifier(CalculatorButton())
                        .padding(.top, 10)
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
        let interestRate = (Double(rate) ?? 0) / 100 / 12 // 월 이자율
        let timePeriod = (Double(time) ?? 0) * 12 // 총 개월 수
        let paymentAmount = Double(payment) ?? 0 // 매월 추가 적립금

        // 적립식 복리 계산 공식
        let amount = principalAmount * pow(1 + interestRate, timePeriod) +
                     paymentAmount * ((pow(1 + interestRate, timePeriod) - 1) / interestRate)

        result = amount
    }
}

struct Accumulation_Previews: PreviewProvider {
    static var previews: some View {
        Accumulation()
    }
}

