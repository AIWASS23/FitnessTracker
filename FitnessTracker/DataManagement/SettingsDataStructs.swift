//
//  SettingsDataStructs.swift
//  FitnessTracker
//
//  Created by Marcelo de Araújo on 28/07/23
//

import Foundation
import SwiftUI

struct Settings {
    var weightUnit: WeightUnit = .kg
    var distanceUnit: DistanceUnit = .km
    let strWorkouts = strengthWorkoutNames
    let endWorkouts = enduranceWorkoutNames
    let textColor = Color("TextColor")
    let headerTextColor = Color("HeaderText")
    let headerBackgroundColor = Color("HeaderBackground")
}

var strengthWorkoutNames = [
    "Bench Press",
    "Deadlift",
    "Bicep Curl",
    "Overhead Press",
    "Hammercurl",
    "Pull-up"
]

var enduranceWorkoutNames = [
    "Jogging",
    "Cycling",
    "Swimming"
]

enum WeightUnit: String, CaseIterable {
    case kg
    case lbs
}

enum DistanceUnit: String, CaseIterable {
    case km
    case mile
}
