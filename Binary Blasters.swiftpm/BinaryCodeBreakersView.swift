import SwiftUI

struct BinaryCodeBreakersView: View {
    @State private var binaryCode = ""
    @State private var guess = ""
    @State private var feedback = ""
    @State private var gameOver = false
    
    let binaryAnswer = "101001"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Binary Code Breaker")
                .font(.title)
                .bold()
            
            Text("> We meet again, Agent Binary. Your first task is to decode the number of evil people there are at the Monolith Project. This will help us in dealing with them when we find them!")
                .font(.system(size: 22, design: .monospaced))
                .foregroundColor(Color.green)
                .padding(.horizontal)
            
            Text("Enter a binary number:")
            TextField("Binary code", text: $guess)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)
            Button("Check") {
                checkGuess()
            }
            if gameOver {
                Text(feedback)
                    .font(.title2)
                    .foregroundColor(Color.green)
                NavigationLink(destination: DecimalConversionView()) {
                    Text("Continue")
                }
            } else {
                Text(feedback)
                    .font(.title2)
                    .foregroundColor(Color.red)
            }
            Spacer()
        }
        .padding()
    }
    
    func checkGuess() {
        if guess.count != binaryAnswer.count {
            feedback = "Incorrect number of digits."
            return
        }
        var correctCount = 0
        for (index, char) in guess.enumerated() {
            if String(char) == String(binaryAnswer[binaryAnswer.index(binaryAnswer.startIndex, offsetBy: index)]) {
                correctCount += 1
            }
        }
        if correctCount == binaryAnswer.count {
            feedback = "Correct! The code was \(binaryAnswer) which is 41 in decimal. \nThis means that there are 41 members of The Monolith Project."
            gameOver = true
        } else {
            feedback = "\(correctCount) of \(binaryAnswer.count) digits correct."
        }
    }
}
