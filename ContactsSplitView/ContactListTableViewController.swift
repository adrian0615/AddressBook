//
//  ContactListTableViewController.swift
//  ContactsSplitView
//
//  Created by Adrian McDaniel on 1/24/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class ContactListTableViewController: UITableViewController {

    let dataSource = ContactListDataSource()
    var selectionClosure: (Contact) -> Void = { contact in
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contacts"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContactCell")
        tableView.dataSource = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = dataSource[indexPath.row]
        
        selectionClosure(contact)
    }
}


class ContactListDataSource: NSObject, UITableViewDataSource {
    
    let list: [Contact] = [Contact(givenName: "Prince", familyName: "Adam", address: "The Royal Palace of Eternia", emailAddress: "he@man.com", phoneNumber: "12-Grayskull", birthday: "2/1/1983", note: "I have the power!"), Contact(givenName: "Michael", familyName: "Angelo", address: "The Sewers, New York, NY", emailAddress: "pizza@turtle.com", phoneNumber: "555-DUDE", birthday: "5/14/1981", note: "Cowabunga!"), Contact(givenName: "Black", familyName: "Panther", address: "Wakanda", emailAddress: "king@tchalla.com", phoneNumber: "555-Royalty", birthday: "4/19/1975", note: "Vibranium"), Contact(givenName: "Kermit", familyName: "Frog", address: "Swamp", emailAddress: "kermit@mspiggy.com", phoneNumber: "555-GULP", birthday: "1/1/95", note: "Feeling Green")]
    
    subscript (_ index: Int) -> Contact {
        return list[index]
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") else {
            fatalError("failed to dequeue cell with identifier ContactCell")
        }
        cell.backgroundColor = UIColor.blue
        cell.textLabel?.text = list[indexPath.row].fullName
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.textAlignment = .center
        
        return cell
    }
}


/*
 // 1: try loading the "Edit" view controller and
 typecasting it to be EditingViewController
 if let EditingVC =
 storyboard?.instantiateViewController(withIdentifier: "Edit")
 as? EditingViewController {
 // 2: success! Set its selectedImage property
 vc.selectedImage = pictures[indexPath.row]
 www.hackingwithswift.com 129
 // 3: now push it onto the navigation controller
 navigationController?.pushViewController(vc, animated:
 true)
 } }*/
