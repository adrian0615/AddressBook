//
//  ContactStore.swift
//  ContactsSplitView
//
//  Created by Adrian McDaniel on 1/24/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import Foundation




internal final class ContactStore {
    
    
    func postContacts(contacts: [Contact]) {
        var dictionaryArray: [[String: Any]] = []
        
        
        for contact in contacts {
            
            let contactDictionary: [String: Any] = ["givenName": contact.givenName, "familyName": contact.familyName, "address": contact.address, "emailAddress": contact.emailAddress, "phoneNumber": contact.phoneNumber
                , "birthday": contact.birthday, "note": contact.note]
            
            dictionaryArray.append(contactDictionary)
        }
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: dictionaryArray, options: [])
        
        let stringSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        _ = try? stringSample.write(toFile: "/Users/AdrianHome/Contacts.txt", atomically: true, encoding: .utf8)
    }
    
    
    func fetchContacts() -> [Contact] {
        
        let returnedSample = try! String(contentsOfFile: "/Users/AdrianHome/Contacts.txt", encoding: .utf8)
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [[String: Any]]
        
        let returnedGames = Contact.array(from: jsonObject)!
        
        return returnedGames
    }
    
}
