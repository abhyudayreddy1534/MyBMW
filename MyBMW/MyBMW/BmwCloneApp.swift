import SwiftUI

@main
struct BmwCloneApp: App {
    @State private var isReady = false
    
    init() {
        TranslucentTabBar.apply()
    }

    var body: some Scene {
        WindowGroup {
            ZStack {
                if isReady {
                    RootTabView()
                        .transition(.opacity)
                } else {
                    SplashScreen()
                }
            }
            .task {
                await bootstrap()
            }
        }
    }
    
    @MainActor
    private func bootstrap() async {
        // Simulate loading: API calls, auth, cache, etc.
        try? await Task.sleep(nanoseconds: 2_000_000_000)

        withAnimation(.easeInOut(duration: 0.35)) {
            isReady = true
        }
    }
}

struct SplashScreen: View {
    @State private var rotate = false

    var body: some View {
        ZStack {
            // Full-screen background color
            Color(ARNColor.bmwBlue) // or ARNColor.background
                .ignoresSafeArea()

            Image("logo") // your asset
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
//                .scaleEffect(1.5)
//                .rotationEffect(.degrees(rotate ? 360 : 0))
                .animation(
                    .linear(duration: 1.0)
                        .repeatForever(autoreverses: false),
                    value: rotate
                )
        }
        .onAppear {
            rotate = true
        }
    }
}
