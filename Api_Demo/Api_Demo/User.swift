//
//  User.swift
//  Api_Demo
//
//  Created by Anant Prajapati on 22/11/24.
//

import Foundation


struct User : Codable {
    var name : String
    var job : String
    var id : String?

    var dateCreated : Date?
    
    
    var modifiedId : String {
        if let newId = id {
            return newId
        }else {
            return "****"
        }
    }
    
    var modifiedDateCreated : String {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .medium
        if let newDate = dateCreated {
            return dateformatter.string(from: newDate)
        }else {
            return "****"
        }
    }
    
    enum Codingkeys : String,CodingKey {
        case name
        case job
        case id
        case dateCreated = "CreatedAt"
    }
}
