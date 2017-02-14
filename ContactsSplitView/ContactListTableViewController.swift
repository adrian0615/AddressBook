//
//  ContactListTableViewController.swift
//  ContactsSplitView
//
//  Created by Adrian McDaniel on 1/24/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class ContactListTableViewController: UITableViewController {

    var contacts: [Contact] = [] {
        didSet {
            update()
        }
    }
    var contactStore = ContactStore()
    
    
    
    var selectionClosure: (Contact) -> Void = { contact in
        
    }
    
    weak var detailViewController: UIViewController?
    
    @IBAction func addContact(_ sender: Any) {
        let editVC = self.storyboard!.instantiateViewController(withIdentifier: "EditView") as! EditingViewController
        editVC.delegate = self
        detailViewController?.show(editVC, sender: nil)
        
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contacts"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContactCell")
        
        contacts = contactStore.fetchContacts()
        
        update()
    }
    
    func update() {
        OperationQueue.main.addOperation {
            
            self.tableView.reloadData()
            return
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") else {
            fatalError("failed to dequeue cell with identifier ContactCell")
        }
        cell.backgroundColor = UIColor.blue
        cell.textLabel?.text = contacts[indexPath.row].fullName
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.textAlignment = .center
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contacts[indexPath.row]
        
        selectionClosure(contact)
    }
}



extension ContactListTableViewController : EditingViewControllerDelegate {
    func editingViewController(viewController: EditingViewController, didFinishEditing contact: Contact) {
        if contacts.contains(contact) == false{
            contacts.append(contact)
            contactStore.postContacts(contacts: contacts)
            tableView.reloadData()
        }
        //asking the ContactListTableViewController to dismiss me
        viewController.navigationController?.popViewController(animated: true)
    }
}



