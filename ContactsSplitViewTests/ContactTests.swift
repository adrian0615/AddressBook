//
//  ContactTests.swift
//  ContactsSplitView
//
//  Created by Adrian McDaniel on 2/13/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import XCTest
@testable import ContactsSplitView
class ContactTests: XCTestCase {
    
    func sendContactsAndGetThemBack() {
        let contactStore = ContactStore()
        
        let list: [Contact] = [Contact(givenName: "Prince", familyName: "Adam", address: "The Royal Palace of Eternia", emailAddress: "he@man.com", phoneNumber: "12-Grayskull", birthday: "2/1/1983", note: "I have the power!"), Contact(givenName: "Michael", familyName: "Angelo", address: "The Sewers, New York, NY", emailAddress: "pizza@turtle.com", phoneNumber: "555-DUDE", birthday: "5/14/1981", note: "Cowabunga!"), Contact(givenName: "Black", familyName: "Panther", address: "Wakanda", emailAddress: "king@tchalla.com", phoneNumber: "555-Royalty", birthday: "4/19/1975", note: "Vibranium"), Contact(givenName: "Kermit", familyName: "Frog", address: "Swamp", emailAddress: "kermit@mspiggy.com", phoneNumber: "555-GULP", birthday: "1/1/95", note: "Feeling Green")]
        
        contactStore.postContacts(contacts: list)
        
        let result = contactStore.fetchGames()
        
        XCTAssertEqual(list, result)
        
    }
    
    func getcontactInfoSuccess() {
        
        let sample: [String: Any] = ["givenName": "Tom", "familyName": "Tucker", "address": "123 Spooner St", "emailAddress": "tom@tucker.com", "phoneNumber": "1234567890"
            , "birthday": "Everyday", "note": "Quahog"]
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: sample , options: [])
        
        let stringSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        _ = try? stringSample.write(toFile: "/Users/AdrianHome/ContactsTest.txt", atomically: true, encoding: .utf8)
        
        let returnedSample = try! String(contentsOfFile: "/Users/AdrianHome/ContactsTest.txt", encoding: .utf8)
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: Any]
        
        let contact = Contact(jsonObject: jsonObject)!
        
        
        
        let expected = Contact(givenName: "Tom", familyName: "Tucker", address: "123 Spooner St", emailAddress: "tom@tucker.com", phoneNumber: "1234567890", birthday: "Everyday", note: "Quahog")
        
        XCTAssertEqual(contact, expected)
    }
    
    func getcontactInfoFailPhoneNumber() {
        
        let sample: [String: Any] = ["givenName": "Tom", "familyName": "Tucker", "address": "123 Spooner St", "emailAddress": "tom@tucker.com", "phoneNumber": "123456789"
            , "birthday": "Everyday", "note": "Quahog"]
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: sample , options: [])
        
        let stringSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        _ = try? stringSample.write(toFile: "/Users/AdrianHome/ContactsTest.txt", atomically: true, encoding: .utf8)
        
        let returnedSample = try! String(contentsOfFile: "/Users/AdrianHome/ContactsTest.txt", encoding: .utf8)
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: Any]
        
        let contact = Contact(jsonObject: jsonObject)!
        
        
        
        let expected = Contact(givenName: "Tom", familyName: "Tucker", address: "123 Spooner St", emailAddress: "tom@tucker.com", phoneNumber: "1234567890", birthday: "Everyday", note: "Quahog")
        
        XCTAssertNotEqual(contact, expected)
    }
    
}
