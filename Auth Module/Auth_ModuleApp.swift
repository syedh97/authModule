import SwiftUI
import FirebaseCore
import FirebaseAuth
import Firebase
import GoogleSignIn

@main
struct Auth_ModuleApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var authService = AuthService()
    @StateObject var viewModel = SignUpViewModel()
    
    init() {

    }
    
    var body: some Scene {
        WindowGroup {
            
              //  HomeView()
            ContentView()
           .environmentObject(authService)
           .environmentObject(viewModel)
                // Inject the Authentication service into ContentView
                   
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Configure Firebase
        FirebaseApp.configure() // Firebase must be initialized before accessing the options
        return true
    }
}

