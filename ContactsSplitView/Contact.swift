//
//  Contact.swift
//  ContactsSplitView
//
//  Created by Adrian McDaniel on 1/24/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import Foundation



@objc class Contact : NSObject {
    
    
    var givenName: String
    var familyName: String
    var address: String
    var emailAddress: String
    var phoneNumber: String
    var birthday: String
    var note: String
    
    init(givenName: String, familyName: String, address: String, emailAddress: String, phoneNumber: String, birthday: String, note: String) {
        self.givenName = givenName
        self.familyName = familyName
        self.address = address
        self.emailAddress = emailAddress
        self.phoneNumber = phoneNumber
        self.birthday = birthday
        self.note = note
    }
    
    convenience init?(jsonObject: [String: Any]) {
        
        
        guard let firstName = jsonObject["givenName"] as? String,
            let lastName = jsonObject["familyName"] as? String,
            let location = jsonObject["address"] as? String,
            let email = jsonObject["emailAddress"] as? String,
            let number = jsonObject["phoneNumber"] as? String,
            let bDay = jsonObject["birthday"] as? String,
            let theNote = jsonObject["note"] as? String else {
                
                return nil
        }
        
        self.init(givenName: firstName, familyName: lastName, address: location, emailAddress: email, phoneNumber: number, birthday: bDay, note: theNote)
    }
}

extension Contact {
    
    var nameComponents: PersonNameComponents {
        var comps = PersonNameComponents()
        comps.givenName = givenName
        comps.familyName = familyName
        return comps
    }
    var fullName: String {
        let formatter = PersonNameComponentsFormatter()
        return formatter.string(from: nameComponents)
    }
}


extension Contact {
    internal static func array(from jsonObjects: [[String: Any]]) -> [Contact]? {
        let contactArray = jsonObjects.flatMap(Contact.init(jsonObject:))
        
        if jsonObjects.count != contactArray.count {
            return nil
        }
        
        return contactArray
    }
}
