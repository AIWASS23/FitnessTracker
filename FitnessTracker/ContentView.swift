//
//  ContentView.swift
//  FitnessTracker
//
//  Created by Marcelo de Araújo on 05/07/23
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabCollection()
    }
}

struct TabCollection: View {

    var body: some View {
        TabView {
            WorkoutInputSceneView()
                .tabItem {
                    Label("Workouts", systemImage: "1.circle")
                }
            PersonalInformationSceneView(person: previewExamplePerson)
                .tabItem {
                    Label("Personal Info", systemImage: "2.circle")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "3.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
