//
//  StrengthEntryStatisticsBox.swift
//  FitnessTracker
//
//  Created by Marcelo de Araújo on 27/07/23
//

import SwiftUI

struct StrengthEntryBoxView: View {
    
    let entry: StrengthWorkoutEntry
    let settings: Settings

    var body: some View {
        VStack(spacing: 0) {
            WorkoutEntryHeaderView(entry: entry, settings: settings)
            HStack {
                Spacer()
                    .frame(width: 10)
                VStack (spacing: 0) {
                    HStack(spacing: 0) {
                        Text("Sets: \(entry.sets)")
                            .foregroundColor(settings.textColor)
                            .font(.system(size: 20))
                            .padding(16.0)
                            .frame(maxWidth: .infinity)
                            .overlay(
                                SelectedBorderShape(
                                    sides: [.leading, .trailing, .bottom]
                                )
                                .stroke(settings.textColor, lineWidth: 1.0)
                            )
                        Text("Reps: \(entry.reps)")
                            .foregroundColor(settings.textColor)
                            .font(.system(size: 20))
                            .padding(16.0)
                            .frame(maxWidth: .infinity)
                            .overlay(
                                SelectedBorderShape(
                                    sides: [.trailing, .bottom]
                                )
                                .stroke(settings.textColor, lineWidth: 1.0)
                            )
                    }
                    Text("\(String(format: "%.2f", entry.getConvertedWeightUnit(for: settings.weightUnit))) \(settings.weightUnit.rawValue)")
                        .foregroundColor(settings.textColor)
                        .font(.system(size: 20))
                        .padding(16.0)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            SelectedBorderShape(
                                sides: [.leading, .trailing, .bottom]
                            )
                            .stroke(settings.textColor, lineWidth: 1.0)
                        )
                }
                Spacer()
                    .frame(width: 30)
            }
        }
    }
}

// MARK: Preview

private let demoEntry = StrengthWorkoutEntry(
    name: "Bench Press",
    timestamp: Date(),
    sets: 3,
    reps: 8,
    weight: 30.0,
    recordedWeightUnit: .kg
)

private let demoSettings = Settings(
    weightUnit: .kg,
    distanceUnit: .km
)

struct StrengthEntryStatisticsBox_Previews: PreviewProvider {

    static var previews: some View {
        HStack {
            Spacer()
                .frame(width: 20)
            StrengthEntryBoxView(
                entry: demoEntry,
                settings: demoSettings
            )
            Spacer()
                .frame(width: 20)
        }
    }
}
