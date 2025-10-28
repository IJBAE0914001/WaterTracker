import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: WaterTrackerViewModel

    var body: some View {
        Form {
            Section(header: Text("목표 섭취량")) {
                Picker("설정", selection: $viewModel.settings.dailyGoal) {
                    Text("1,500ml").tag(1500)
                    Text("2,000ml").tag(2000)
                    Text("2,500ml").tag(2500)
                }
                .pickerStyle(SegmentedPickerStyle())
                Button("저장") {
                    viewModel.saveSettings()
                }
            }

            Section(header: Text("알림 설정")) {
                Toggle("정기적으로 알림", isOn: $viewModel.settings.notificationsEnabled)
                Picker("간격", selection: $viewModel.settings.notificationInterval) {
                    Text("1시간").tag(60)
                    Text("2시간").tag(120)
                }
            }

            Section(header: Text("테마")) {
                Picker("모드", selection: $viewModel.settings.themeSetting) {
                    Text("시스템").tag(0)
                    Text("라이트").tag(1)
                    Text("다크").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            Section {
                Button("설정 초기화") {
                    viewModel.settings = AppSettings()
                    viewModel.saveSettings()
                }
            }
        }
        .onDisappear {
            viewModel.saveSettings()
        }
    }
}
