//
//  User.swift
//  TutorMe
//
//  Created by Zoe on 12/22/16.
//  Copyright © 2016 CosmicMind. All rights reserved.
//

import Foundation
import FirebaseAuth

struct User {
    let uid:String
    let email:String
    let address:String
    let name:String
    let age: Int
    let school: String
    let description: String
    let isTutor: Bool
    let languages: [String]
    let availableDays: [Bool]
    
    init(userData:FIRUser) {
        uid = userData.uid
        name = ""
        age = 10
        description = userData.description
        isTutor = false
        languages = [""]
        address = ""
        availableDays = [false]
        school = ""
        
        if let mail = userData.providerData.first?.email {
            email = mail
        } else {
            email = ""
        }
        
        
    }
    
    init (uid: String, email: String, name: String, school: String, isTutor: Bool, address: String, age: Int, description: String, languages: [String], availableDays: [Bool]) {
        self.uid = uid
        self.email = email
        self.address = address
        self.name = name
        self.age = age
        self.description = description
        self.isTutor = isTutor
        self.languages = languages
        self.availableDays = availableDays
        self.school = school
    }
}
