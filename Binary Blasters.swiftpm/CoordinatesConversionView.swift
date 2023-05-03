import SwiftUI

struct CoordinatesConversionView: View {
    @State private var latitudeInput: String = ""
    @State private var longitudeInput: String = ""
    @State private var latitudeOutput: String = ""
    @State private var longitudeOutput: String = ""
    @State private var showAlert = false
    
    private func convertToBinaryString(_ decimal: Double) -> String {
        let int = Int(decimal * 100)
        let binary = String(int, radix: 2)
        return binary
    }
    
    private func checkConversion() {
        let correctLatitudeBinary = "1101000010"
        let correctLongitudeBinary = "111001000011"
        if latitudeOutput == correctLatitudeBinary && longitudeOutput == correctLongitudeBinary {
            showAlert = true
        } 
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Encrypt your location!")
                .font(.title)
                .padding(.top, -150)
            
            Text("> Hey, Agent Binary. Unfortunately, your location has a great risk of being compromised. Encrypt it by converting it into binary. Hurry along!")
                .font(.system(size: 22, design: .monospaced))
                .foregroundColor(Color.green)
                .padding(.horizontal)
                .padding(.top, 80)
            
            Text("Please enter the latitude and longitude coordinates in decimal format and convert them to binary (Ignore decimals).")
                .multilineTextAlignment(.center)
            
            HStack(spacing: 20) {
                Text("Latitude (decimal):")
                Text("8.34")
            }
            
            HStack(spacing: 20) {
                Text("Longitude (decimal):")
                Text("36.51")
            }
            
            HStack(spacing: 20) {
                Text("Latitude (binary):")
                TextField("Enter binary latitude", text: $latitudeOutput)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack(spacing: 20) {
                Text("Longitude (binary):")
                TextField("Enter binary longitude", text: $longitudeOutput)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
            }
            
            Button("Check Conversion") {
                checkConversion()
            }
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("🥳 Thanks for playing Binary Blasters!"), message: Text("You successfully encrypted your location."), dismissButton: .default(Text("OK")))
        }
    }
}
