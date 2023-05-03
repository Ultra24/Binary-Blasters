import SwiftUI

struct ContentView: View {
    @State private var isAboutViewPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                VStack {
                    Image("appicon")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(50)
                        .padding(.top, -250)
                    
                    NavigationLink(
                        destination: IntroView(),
                        label: {
                            Text("Mission Debriefing")
                                .foregroundColor(.white)
                                .font(.title3.bold())
                                .frame(maxWidth: 350, maxHeight: 60)
                                .background(Color.green.opacity(0.8))
                                .cornerRadius(20)
                                .padding(.horizontal, 20)
                                .padding(.top)
                        })
                    
                    Text("About Binary Blasters")
                        .foregroundColor(.green)
                        .padding(.top)
                        .font(.title3)
                        .onTapGesture {
                            self.isAboutViewPresented = true
                        }
                        .sheet(isPresented: $isAboutViewPresented, content: {
                            AboutPopupView()
                        })
                }
                
                Spacer()
                
                Text("Made with ❤️ by Umer Rizwan")
                    .font(.callout)
                    .foregroundColor(.green)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
            }
            .navigationBarTitle(Text("Binary Blasters"))
            .padding(40)
            .accentColor(.green)
        }
    }
}


struct AboutPopupView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("00110101010101101\n")
                .font(.system(size: 28    , design: .monospaced))
                .foregroundColor(.green)
                
            Text("Welcome to Binary Blasters!")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            Text("Binary Blasters is my submission for WWDC '23.\n")
                .font(.title3)
            
            Text("Binary Blasters is an iOS puzzle game designed to teach people about binary in a fun and interactive manner. Play as Agent Binary on his quest to recover an important AI system, while simultaneously learning about the wonders of Binary and applying them in tricky challenges! \n")
                .font(.title3)
            
            Button(action: 
                    {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Let's Begin!")
                    .fontWeight(.semibold)
                    .padding(.all, 15)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            })
        }
        .padding(40)
    }
}

