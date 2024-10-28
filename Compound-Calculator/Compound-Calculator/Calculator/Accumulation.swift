import SwiftUI

struct Accumulation: View {
    @State private var principal: String = ""
    @State private var rate: String = ""
    @State private var time: String = ""
    @State private var payment: String = ""
    @State private var result: Double = 0.0
    @State private var selectedPeriod: String = "년" // 초기 선택값

    var body: some View {
        CommonButtonView {
            VStack(spacing: 20) {
                Text("적립식 복리 계산기")
                    .font(.largeTitle)
                    .padding(.bottom, 25)

                // 시작 금액
                VStack(alignment: .leading) {
                    Text("시작 금액")
                        .padding(.horizontal)

                    TextField("시작 금액 입력", text: Binding(
                        get: { formatNumber(principal) },
                        set: { principal = $0.replacingOccurrences(of: ",", with: "") }
                    ))
                    .keyboardType(.decimalPad)
                    .modifier(TextFieldModifier())
                }

                // 매월 적립 금액
                VStack(alignment: .leading) {
                    Text("매월 적립 금액")
                        .padding(.horizontal)

                    TextField("매월 추가 적립금 입력", text: Binding(
                        get: { formatNumber(payment) },
                        set: { payment = $0.replacingOccurrences(of: ",", with: "") }
                    ))
                    .keyboardType(.decimalPad)
                    .modifier(TextFieldModifier())
                }

                // 투자기간 입력
                VStack(alignment: .leading) {
                    HStack {
                        Text("투자기간")
                            
                        Button(action: {
                            selectedPeriod = "년"
                        }) {
                            HStack {
                                Image(systemName: selectedPeriod == "년" ? "largecircle.fill.circle" : "circle")
                                Text("년")
                            }
                        }
                        .buttonStyle(PlainButtonStyle()) // 기본 버튼 스타일 제거
                        
                        Button(action: {
                            selectedPeriod = "월"
                        }) {
                            HStack {
                                Image(systemName: selectedPeriod == "월" ? "largecircle.fill.circle" : "circle")
                                Text("월")
                            }
                        }
                        .buttonStyle(PlainButtonStyle()) // 기본 버튼 스타일 제거
                    }
                    .padding(.horizontal)
                    
                    TextField("투자기간 입력 (\(selectedPeriod))", text: $time)
                        .modifier(TextFieldModifier())
                }
                .padding(.top, 5)
                
                // 이자율 입력 (추가)
                VStack(alignment: .leading) {
                    Text("이자율")
                        .padding(.horizontal)

                    TextField("수익률 입력 (연 수익률)", text: $rate)
                        .keyboardType(.decimalPad)
                        .modifier(TextFieldModifier())
                }

                // 계산 버튼
                Button {
                    calculateCompoundInterest()
                } label: {
                    Text("계산하기")
                        .modifier(CalculatorButton())
                        .padding(.top, 10)
                }

                // 최종 금액 표시
                Text("최종 금액: \(result, specifier: "%.0f") 원")
                    .font(.title)
                    .padding()
            }
        }
        .padding()
    }

    // 숫자 포맷팅 함수
    func formatNumber(_ value: String) -> String {
        guard let doubleValue = Double(value) else { return value }

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: doubleValue)) ?? value
    }

    // 복리 계산 함수
    func calculateCompoundInterest() {
        let principalAmount = Double(principal) ?? 0
        let annualRate = (Double(rate) ?? 0) / 100 // 연 이자율
        let paymentAmount = Double(payment) ?? 0 // 매월 추가 적립금

        // 시간 변환 및 이자율 결정
        let timePeriod: Double
        if selectedPeriod == "년" {
            timePeriod = Double(time) ?? 0 // 연 단위
        } else {
            timePeriod = (Double(time) ?? 0) / 12 // 월 단위로 변환
        }

        // 적립식 복리 계산 공식
        let amount = principalAmount * pow(1 + annualRate, timePeriod) +
                     paymentAmount * ((pow(1 + annualRate, timePeriod) - 1) / annualRate)

        result = amount
    }
}

struct Accumulation_Previews: PreviewProvider {
    static var previews: some View {
        Accumulation()
    }
}

