//
//  SettingsView.swift
//  ScoreKeeper
//
//  Created by Jesslyn Trixie Edvilie on 13/04/26.
//

import SwiftUI

struct SettingsView: View {
    @Binding var doesHighestScoreWin: Bool
    
    @Binding var startingPoints: Int
    @Binding var numberOfRounds: Int
    @Environment(\.isEnabled) private var isEnabled
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Rules")
                .font(.headline)
            Divider()
            Picker("Win condition", selection: $doesHighestScoreWin) {
                Text("Highest score wins")
                    .tag(true)
                Text("Lowest score wins")
                    .tag(false)
            }
            Picker("Starting points", selection: $startingPoints) {
                Text("0 starting points")
                    .tag(0)
                Text("10 starting points")
                    .tag(10)
                Text("20 starting points")
                    .tag(20)
            }
            
      
            Stepper("Number of rounds: \(numberOfRounds)", value: $numberOfRounds, in: 1...10)
                .disabled(!isEnabled)
            .padding(.leading, 12)
            .foregroundStyle(isEnabled ? Color.blue : Color.secondary)
            .opacity(isEnabled ? 1.0 : 0.5)
            
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 10.0))
    }
}


#Preview {
    @Previewable @State var doesHighestScoreWin: Bool = true

    @Previewable @State var startingPoints = 10
    @Previewable @State var numberOfRounds: Int = 3
    
        SettingsView(doesHighestScoreWin: $doesHighestScoreWin, startingPoints: $startingPoints, numberOfRounds: $numberOfRounds)
}
