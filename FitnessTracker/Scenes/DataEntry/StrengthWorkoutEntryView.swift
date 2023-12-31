//
//  WorkoutEntryView.swift
//  FitnessTracker
//
//  Created by Marcelo de Araújo on 02/07/23
//

import SwiftUI

// MARK: View

struct StrengthWorkoutEntryView: View {

    // References the existing central list of workout entries.
    // This binding is used to manipulate the original source of truth.
    @Binding var existingEntries: [StrengthWorkoutEntry]
    @Binding var isPresented: Bool
    let settings: Settings

    // Form Entry state variables
    @State private var date = Date()
    @State private var name = strengthWorkoutNames[0]
    @State private var reps = 0
    @State private var sets = 0
    @State private var weight: Double = 0.0

    var body: some View {
        VStack {
            Form {
                Section(content: {
                    DatePicker("Date:", selection: $date, displayedComponents: .date)
                        .foregroundColor(settings.textColor)
                }, header: {
                    Text("Date")
                })
                Section(content: {
                    Picker("Name", selection: $name, content: {
                        ForEach(0 ..< strengthWorkoutNames.count, id: \.self) { name in
                            Text(strengthWorkoutNames[name])
                        }
                    })
                    .foregroundColor(settings.textColor)
                    Stepper("Sets: \(sets)", value: $sets, in: 0...Int.max, step: 1)
                        .padding(.top)
                        .padding(.bottom)
                        .foregroundColor(settings.textColor)
                    Stepper("Reps: \(reps)", value: $reps, in: 0...Int.max, step: 1)
                        .padding(.top)
                        .padding(.bottom)
                        .foregroundColor(settings.textColor)
                    Stepper("Weight: \(String(format: "%.1f", weight)) \(settings.weightUnit.rawValue)", value: $weight, in: 0...Double(Int.max), step: 2.5)
                    .padding(.top)
                    .padding(.bottom)
                    .foregroundColor(settings.textColor)
                }, header: {
                    Text("Entry")
                })
            }.navigationTitle("New Workout Entry")
                .fixedSize(horizontal: false, vertical: false)
            Button(action: {
                existingEntries.append(
                    StrengthWorkoutEntry(
                        name: name,
                        timestamp: date,
                        sets: sets,
                        reps: reps,
                        weight: weight,
                        recordedWeightUnit: settings.weightUnit
                    )
                )
                isPresented = false
            }, label: {
                Text("Submit")
                    .foregroundColor(.white)
            })
            .frame(width: 200.0, height: 50.0)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(16.0)
                .padding(.bottom, 16.0)
        }
    }
}

// MARK: Configs

private let weightIncrement: Double = 2.5

// MARK: Preview

struct WorkoutEntryView_Previews: PreviewProvider {
    @State private static var entries = [StrengthWorkoutEntry]()
    @State private static var show = true
    private static let settings = Settings()

    static var previews: some View {
        StrengthWorkoutEntryView(
            existingEntries: $entries,
            isPresented: $show,
            settings: settings
        )
    }
}
