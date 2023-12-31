//
//  PersonalInformationSceneView.swift
//  FitnessTracker
//
//  Created by Marcelo de Araújo on 23/07/23
//

import SwiftUI

struct PersonalInformationSceneView: View {
    @State var person: Person
    @State private var showingAlert = false

    var body: some View {
        ZStack {
            // Data Overview
            VStack {
                Image(uiImage: person.foto)
                    .padding()
                HStack {
                    Text(person.firstName)
                    Text(person.lastName)
                }
                .padding()
                HStack {
                    Text("Born: ")
                        .bold()
                    Text(person.birthdate.formatted())
                }
            }.padding(16)
            // Edit button
            VStack {
                Spacer()
                    Button("Edit", action: {
                        showingAlert = !showingAlert
                    })
                    .frame(width: 200.0, height: 50.0)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(16.0)
                        .padding(.bottom, 16.0)
            }
        }
    }
}

// MARK: Data Input Alert

struct DataInputAlert: View {
    var body: some View {
        Text("Hello World")
    }
}
 
// MARK: Data Representation

struct Person {
    let foto: UIImage
    let firstName: String
    let lastName: String
    let birthdate: Date
}

// MARK: Preview

let previewExamplePerson = Person(
    foto: UIImage(imageLiteralResourceName: "person_icon"),
    firstName: "Marcelo",
    lastName: "De Araújo",
    birthdate: Date.now
)

struct PersonalInformationSceneView_Previews: PreviewProvider {
    static var previews: some View {
        
        PersonalInformationSceneView(person: previewExamplePerson)
    }
}

