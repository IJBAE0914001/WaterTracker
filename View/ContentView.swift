import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: WaterTrackerViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Text("물 마시기 트래커")
                    .font(.title2)

                Text("일일 목표: \(viewModel.settings.dailyGoal)ml")
                    .foregroundColor(.gray)

                ProgressView(value: viewModel.progress)
                    .padding()

                Text("\(viewModel.todayIntake) ml")
                    .font(.largeTitle)

                HStack {
                    ForEach([100, 250, 500], id: \.self) { amount in
                        Button("+\(amount)ml") {
                            viewModel.add(amount: amount)
                        }
                        .buttonStyle(.bordered)
                    }
                }

                HStack {
                    ForEach([100, 250, 500], id: \.self) { amount in
                        Button("-\(amount)ml") {
                            viewModel.add(amount: -amount)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }

                Button("오늘 초기화") {
                    viewModel.resetToday()
                }

                NavigationLink("설정으로 이동", destination: SettingsView(viewModel: viewModel))

                Spacer()
            }
            .padding()
        }
    }
}
