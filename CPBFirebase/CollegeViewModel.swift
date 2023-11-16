//
//  CollegeViewModel.swift
//  CPBFirebase
//
//  Created by Jak Flaherty on 11/14/23.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class CollegeViewModel:  ObservableObject {
    @Published  var colleges: [College] =  []
    
    init() {
        PullFromFirebase()
    }
    
    func AddCollege(currentCollege: College) {
        colleges.append(currentCollege)
        AddToFirebase(college: currentCollege)
    }
    
    func AddToFirebase(college: College){
        let database = Database.database().reference()
        database.child("Colleges").child(college.name).child("Name").setValue(college.name)
        database.child("Colleges").child(college.name).child("Location").setValue(college.location)
        database.child("Colleges").child(college.name).child("Population").setValue(college.numOfStudents)
        database.child("Colleges").child(college.name).child("URL").setValue(college.collegeLink)
        
        
        
        
//        database.child(college.name).child("Name").setValue(college.name)
//        database.child(college.name).child("Location").setValue(college.location)
//        database.child(college.name).child("Population").setValue(college.numOfStudents)
//        database.child(college.name).child("URL").setValue(college.collegeLink)
       
    }
    
    
    func PullFromFirebase(){
        let databaseRef = Database.database().reference().child("Colleges")
        databaseRef.getData { myError, myDataSnapshot in
            var newList: [College] = []
            for college in myDataSnapshot?.children.allObjects as! [DataSnapshot] {
                let nameOfCollege = college.key
                let dictionary = college.value as! [String: Any]
                let locationOfCollege = dictionary["Location"]
                let populationOfCollege = dictionary["Population"]
                let URLofCollege = dictionary["URL"]
                
                let currentCollege = College(name: nameOfCollege, location: locationOfCollege as! String, numOfStudents: populationOfCollege as! String, collegeLink: URLofCollege as! String)
                newList.append(currentCollege)
            }
            self.colleges = newList
        }
    }
}

