import SwiftUI

struct IntroView: View {
    @State private var showViews = false
    @State private var showTexts = false
    @State private var enableNavigationLink = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("> Welcome Agent Binary, you have been tasked by The Monolith Project to recover a stolen AI System. This AI is important for the safety of humanity, but evil people have stolen it from us.")
                .font(.system(size: 22, design: .monospaced))
                .foregroundColor(Color.green)
                .padding(.horizontal)
                .opacity(showTexts ? 1 : 0)
                .animation(.easeInOut(duration: 1).delay(0.2))
            
            Text("> Track down the AI by completing a series of tasks, which give clues that will lead you to find the AI. Along the way, you may make many friends and lots of memories. Remember, the outcome of our society depends on your success.")
                .font(.system(size: 22, design: .monospaced))
                .foregroundColor(Color.green)
                .padding(.horizontal)
                .opacity(showTexts ? 1 : 0)
                .animation(.easeInOut(duration: 1).delay(0.75))
            
            Text("> Now then, are you ready to save the world?")
                .font(.system(size: 22, design: .monospaced))
                .italic()
                .foregroundColor(Color.green)
                .padding(.horizontal)
                .opacity(showTexts ? 1 : 0)
                .animation(.easeInOut(duration: 1).delay(1.25))
            
            Spacer()
            
            NavigationLink(
                destination: BinaryBasicsView(),
                isActive: $showViews,
                label: {
                    Image(systemName: "arrowshape.turn.up.right.circle.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold))
                        .frame(maxWidth: 220, maxHeight: 60)
                        .background(enableNavigationLink ? Color.green.opacity(0.8) : Color.gray.opacity(0.5))
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 200)
                        .animation(.easeInOut(duration: 0.5))
                })
            .disabled(!enableNavigationLink)
        }
        .onAppear {
            withAnimation {
                showTexts = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    enableNavigationLink = true
                }
            }
        }
        .padding(.top, 10)
        .navigationTitle("Mission Debriefing")
    }
}
