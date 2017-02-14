//
//  ContactStoreTests.swift
//  ContactsSplitView
//
//  Created by Adrian McDaniel on 1/24/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import XCTest
@testable import ContactsSplitView
class ContactStoreTests: XCTestCase {
    
    func sendContactsAndGetThemBack() {
        let contactStore = ContactStore()
        
        let list: [Contact] = [Contact(givenName: "Prince", familyName: "Adam", address: "The Royal Palace of Eternia", emailAddress: "he@man.com", phoneNumber: "12-Grayskull", birthday: "2/1/1983", note: "I have the power!"), Contact(givenName: "Michael", familyName: "Angelo", address: "The Sewers, New York, NY", emailAddress: "pizza@turtle.com", phoneNumber: "555-DUDE", birthday: "5/14/1981", note: "Cowabunga!"), Contact(givenName: "Black", familyName: "Panther", address: "Wakanda", emailAddress: "king@tchalla.com", phoneNumber: "555-Royalty", birthday: "4/19/1975", note: "Vibranium"), Contact(givenName: "Kermit", familyName: "Frog", address: "Swamp", emailAddress: "kermit@mspiggy.com", phoneNumber: "555-GULP", birthday: "1/1/95", note: "Feeling Green")]

        contactStore.postContacts(contacts: list)
        
        let result = contactStore.fetchContacts()
        
        XCTAssertEqual(list, result)
        
    }
    
}
