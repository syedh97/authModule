import SwiftUI


struct ContentView: View {
    @State private var isSplashActive = true
    
    var body: some View {
        VStack {
            if isSplashActive {
                SplashScreen()
            } else {
                MainView() // Your main view goes here
            }
        }
        .onAppear {
            // Delay for a few seconds to show the splash screen
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // 3 seconds
                withAnimation {
                    isSplashActive = false
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

