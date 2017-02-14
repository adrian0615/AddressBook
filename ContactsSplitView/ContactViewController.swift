//
//  ContactViewController.swift
//  ContactsSplitView
//
//  Created by Adrian McDaniel on 1/24/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    var contact: Contact? {
        didSet {
            update()
        }
    }
    
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var emailAddressLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var noteLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contact"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fullNameLabel.isHidden = true
        phoneNumberLabel.isHidden = true
        emailAddressLabel.isHidden = true
        addressLabel.isHidden = true
        birthdayLabel.isHidden = true
        noteLabel.isHidden = true
        
    }
    
    func update() {
        fullNameLabel.isHidden = false
        phoneNumberLabel.isHidden = false
        emailAddressLabel.isHidden = false
        addressLabel.isHidden = false
        birthdayLabel.isHidden = false
        noteLabel.isHidden = false
        
        
        fullNameLabel.text = contact?.fullName ?? "Name"
        phoneNumberLabel.text = contact?.phoneNumber ?? "Phone"
        emailAddressLabel.text = contact?.emailAddress ?? "Email"
        addressLabel.text = contact?.address ?? "Address"
        birthdayLabel.text = contact?.birthday ?? "Birthday"
        noteLabel.text = contact?.note ?? "Note"
        
    }

}
