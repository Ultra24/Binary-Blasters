import SwiftUI

struct DecimalConversionView: View {
    @State private var showViews = false
    @State private var value: String = ""
    
    var body: some View {
        VStack{
            Text("As you previously learnt, computers store data in 1's and 0's called Binary. Let's take a look at how to convert from Binary to Decimal Numbers.")
                .font(.title3)
                .padding(.horizontal, 20)
                .padding(.top, 30)
            
            Text("\n1. Starting from the last digit of the Binary, each digit is worth 2ⁱ, where i starts at 0 and increases by 1 for each digit to the left of the last digit.\n2. If the binary digit is a 0, then ignore it and do not assign it a 2ⁱ value \n3. Find the sum of these 2ⁱ's together to get the decimal equivalent")
                .font(.title3)
                .padding(.horizontal, 20)
            
            Text("\n Example - Converting 10101 \n")
                .font(.title3)
                .padding(.horizontal, 20)
            
            Text("2⁰ + 0 + 2² + 0 + 2⁴ = 21")
                .font(.system(size: 20, design: .monospaced))
                .foregroundColor(.green)
            
            Text("Decimal = 21")
                .font(.system(size: 20, design: .monospaced))
                .foregroundColor(.green)
            
            Text("Convert Binary to Decimal")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.green)
                .padding(.top, 30)
            
            if UIScreen.main.bounds.width > 375 {
                TextField("Enter a binary number", text: $value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 180)
                    .padding(.top, 30)
                    .keyboardType(.numberPad)
                    .animation(.easeInOut(duration: 0.3))
            } else {
                TextField("Enter a binary number", text: $value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                    .padding(.top, 30)
                    .keyboardType(.numberPad)
                    .animation(.easeInOut(duration: 0.3))
            }
            
            if !value.isEmpty {
                if let decimalValue = Int(value, radix: 2) {
                    Text("\(value) in binary is equivalent to \(decimalValue) in decimal.")
                        .foregroundColor(.gray)
                        .padding(.top, 30)
                        .animation(.easeInOut(duration: 0.3))
                } else {
                    Text("Invalid binary number.")
                        .foregroundColor(.red)
                        .padding(.top, 30)
                        .animation(.easeInOut(duration: 0.3))
                }
            }
            NavigationLink(
                destination: CoordinatesConversionView(),
                isActive: $showViews,
                label: {
                    Image(systemName: "arrowshape.turn.up.right.circle.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold))
                        .frame(maxWidth: 220, maxHeight: 60)
                        .background(Color.green.opacity(0.8))
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                })
            .padding(.top, 30)
            .opacity(value.isEmpty ? 0.5 : 1)
            .disabled(value.isEmpty)
            .animation(.easeInOut(duration: 0.3))
                
            Spacer() 
                
        }
        .navigationTitle("Decimal Conversion")
    }
}
