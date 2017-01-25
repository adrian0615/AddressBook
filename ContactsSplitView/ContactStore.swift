//
//  ContactStore.swift
//  ContactsSplitView
//
//  Created by Adrian McDaniel on 1/24/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import Foundation




internal final class ContactStore {
    
    
    internal func fetchContacts() {
        
    }
    
    
    internal func processRecentContactsRequest(jsonData: Data) -> [Contact]? {
        var newContacts = [Contact]()
        
        if let contacts = (try? JSONSerialization.jsonObject(with: jsonData, options: [])) as? [[String: Any]] {
            
             if Contact.array(from: contacts) != nil {
                newContacts = Contact.array(from: contacts)!
            }
            
        } else {
            //this is if there is a system error
            fatalError("Couldn't convert JSON")
        }
        return newContacts
}
    
}
