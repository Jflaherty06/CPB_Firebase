//
//  ContentView.swift
//  CPBFirebase
//
//  Created by Jak Flaherty on 11/14/23.
//

import SwiftUI
import FirebaseDatabase
import FirebaseDatabaseSwift

struct ContentView: View {
    @ObservedObject var viewModel = CollegeViewModel()
    @State var alertShowing: Bool = false
    @State var collegeName: String = ""
    @State var collegeLocation: String = ""
    @State var collegePopulation:String = ""
    @State var collegeURL:String = ""
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.colleges, id: \.name){ currentCollege in
                    Text("College Name: \(currentCollege.name)\nCollege Location: \(currentCollege.location)\nNumber of Students: \(currentCollege.numOfStudents)\nColle Link: \(currentCollege.collegeLink)")
//                    Text(currentCollege.location)
//                    Text(currentCollege.numOfStudents)
//                    Text(currentCollege.collegeLink)
                }
            }
            
            Button(action: {
                alertShowing = true
            }, label: {
                Text("Add a College")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
            })
           
            
            .alert("Enter College Info", isPresented: $alertShowing) {
                TextField("Enter college name", text: $collegeName)
                TextField("Enter college location", text: $collegeLocation)
                TextField("Enter college population", text: $collegePopulation)
                TextField("Enter college URL", text: $collegeURL)
                        Button("Ok", role: .cancel) {
                            let newCollege = College(name: collegeName, location: collegeLocation, numOfStudents: collegePopulation, collegeLink: collegeURL)
                            viewModel.AddCollege(currentCollege: newCollege)
                            collegeName = ""
                            collegeLocation = ""
                            collegePopulation = ""
                            collegeURL = ""
                            
                        }
                    }
            
            
           
            
          
            
        }
        .navigationTitle("ToDoFirebase")
    }
}

#Preview {
    ContentView()
}
