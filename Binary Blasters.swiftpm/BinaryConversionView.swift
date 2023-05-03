import SwiftUI

struct BinaryConversionView: View {
    @State private var showViews = false
    @State private var value: String = ""
    
    var body: some View {
        VStack{
            Text("The counting system that we usually use is called the decimal system. It consists of positive and negative integers using the numbers 0 to 9. A simple way to convert from decimal values to binary values is:")
                .font(.title3)
                .padding(.horizontal, 20)
                .padding(.top, 30)
            
            Text("\n1. Divide the decimal number by 2, keep track of the quotient and the remainder (HINT: The remainder is always 0 or 1)\n2. Repeat this process until the quotient is 0.\n3. Write the remainders in reverse order, this is the binary equivalent of the decimal number!")
                .font(.title3)
                .padding(.horizontal, 20)
            
            Text("\n Example - Converting 13 into binary\n")
                .font(.title3)
                .padding(.horizontal, 20)
            
            Text("13 / 2 = 6, Remainder = 1 \n6 / 2 = 3, Remainder = 0 \n3 / 2 = 1, Remainder = 1 \n1 / 2 = 0, Remainder = 1")
                .font(.system(size: 20, design: .monospaced))
                .foregroundColor(.green)
            
            Text("Binary = 1101")
                .font(.system(size: 20, design: .monospaced))
                .foregroundColor(.green)
            
            Text("Convert Decimal to Binary")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.green)
                .padding(.top, 30)
            
            if UIScreen.main.bounds.width > 375 {
                TextField("Enter a decimal number", text: $value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 180)
                    .padding(.top, 30)
                    .keyboardType(.numberPad)
                    .animation(.easeInOut(duration: 0.3))
            } else {
                TextField("Enter a decimal number", text: $value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                    .padding(.top, 30)
                    .keyboardType(.numberPad)
                    .animation(.easeInOut(duration: 0.3))
            }
            
            if !value.isEmpty {
                // Creates a new integer value from the given string and radix.
                Text("\(value) in decimal is equivalent to \(String(Int(value)! , radix: 2)) in binary.")
                    .foregroundColor(.gray)
                    .padding(.top, 30)
                    .animation(.easeInOut(duration: 0.3))
            }
            
            NavigationLink(
                destination: BinaryCodeBreakersView(),
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
        .padding(.vertical, 20)
        .padding(.bottom, -20) 
        .navigationTitle("Binary Conversion")
    }
}

struct Binary_Previews: PreviewProvider {
    static var previews: some View {
       BinaryConversionView()
    }
}
