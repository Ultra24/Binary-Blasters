import SwiftUI

struct BinaryBasicsView: View {
    @State private var bitsVisible = Array(repeating: false, count: 8)
    @State private var showViews = false
    @State private var bits = Array(repeating: "", count: 8)
    
    var binaryRepresentation: String {
        bitsVisible.map { $0 ? "1" : "0" }.joined()
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Binary Basics")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding(.bottom, 20)
                
                Text("We know it's been a while since you've worked with Binary. Here's a refresher:")
                    .font(.title)
                    .padding()
                
                HStack(alignment: .center, spacing: 10) {
                    Image("computer")
                        .resizable()
                        .frame(width: 250, height: 250)
                    
                    Text("Unlike us humans who speak complex languages, computers only speak in 1's and 0's.")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .padding()
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("These 1's and 0's are called ") + Text("binary").bold().foregroundColor(.green) +
                    Text(". Each binary digit, a 1 or a 0, represents a ") + Text("bit").bold().foregroundColor(.green) +
                    Text(". Bits are pieces of data, which form even larger clumps of data. There are 8 bits in a byte, 1000 bytes in a kilobyte (KB), 1000 kilobytes in a megabyte (MB), and so on.")
                }
                .padding()
                .padding(.bottom, 20)
                
                HStack(spacing: 10) {
                    ForEach(0..<8) { index in
                        ZStack {
                            Rectangle()
                                .foregroundColor(bitsVisible[index] ? .green : .gray)
                                .frame(width: 25, height: 50)
                            
                            Text(bits[index])
                                .foregroundColor(.white)
                                .font(.title2)
                        }
                        .onTapGesture {
                            withAnimation {
                                bitsVisible[index].toggle()
                            }
                        }
                    }
                }
                VStack {
                    Text("Tap on the blocks, a green block represents a 1 and a gray block represents a 0").foregroundColor(.green)
                    
                    Text("Binary representation: \(binaryRepresentation)").foregroundColor(.green).padding(.top)
                }
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.5).delay(0.5)) {
                        bitsVisible = Array(repeating: true, count: 8)
                    }
                }
                .padding(.bottom, 20)
                
            }
            .padding()
            .font(.title2)
            
            NavigationLink(
                destination: BinaryConversionView(),
                isActive: $showViews,
                label: {
                    Image(systemName: "arrowshape.turn.up.right.circle.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold))
                        .frame(maxWidth: 220, maxHeight: 60)
                        .background(Color.green.opacity(0.8))
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 180)
                })
            
            

            
        }
        .frame(maxWidth: .infinity, alignment: .top)
        .accentColor(.green)
    }
}
