//
//  ChooseDataEntryView.swift
//  FitnessTracker
//
//  Created by Marcelo de Araújo on 28/07/23
//

import SwiftUI

struct ChooseDataEntryView: View {

    @Binding var existingStrengthEntries: [StrengthWorkoutEntry]
    @Binding var existingEnduranceEntries: [EnduranceWorkoutEntry]
    @Binding var isPresented: Bool
    let settings: Settings

    @State private var entryShown: EntryType = .Strength
    
    // MARK: View

    var body: some View {
        VStack {
            Picker("", selection: $entryShown) {
                ForEach(EntryType.allCases, id: \.self) { entryName in
                    Text("\(entryName.rawValue)")
                }
            }
            .pickerStyle(.segmented)
            .padding(EdgeInsets(top: 16.0, leading: 0.0, bottom: 16.0, trailing: 0.0))
            switch entryShown {
            case .Strength:
                StrengthWorkoutEntryView(
                    existingEntries: $existingStrengthEntries,
                    isPresented: $isPresented,
                    settings: settings
                )
            case .Endurance:
                EnduranceWorkoutEntryView(
                    existingEntries: $existingEnduranceEntries,
                    isPresented: $isPresented,
                    settings: settings
                )
            }
        }
    }
}

// MARK: Preview

struct ChooseDataEntryView_Previews: PreviewProvider {
    
    @State private static var demoStrengthEntries = [StrengthWorkoutEntry]()
    @State private static var demoEnduranceEntries = [EnduranceWorkoutEntry]()
    @State private static var present = true
    
    static var previews: some View {
        ChooseDataEntryView(
            existingStrengthEntries: $demoStrengthEntries,
            existingEnduranceEntries: $demoEnduranceEntries,
            isPresented: $present,
            settings: Settings()
        )
    }
}
