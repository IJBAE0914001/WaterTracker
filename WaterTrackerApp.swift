import SwiftUI

@main
struct WaterTrackerApp: App {
    @StateObject var viewModel = WaterTrackerViewModel()

    var body: some Scene {
        WindowGroup {
            MainView(viewModel: viewModel)
                .preferredColorScheme(viewModel.settings.themeSetting == 1 ? .light :
                                      viewModel.settings.themeSetting == 2 ? .dark : nil)
        }
    }
}
