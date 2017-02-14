//
//  EditingViewController.swift
//  ContactsSplitView
//
//  Created by Adrian McDaniel on 1/24/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit


protocol EditingViewControllerDelegate: class {
    func editingViewController(viewController: EditingViewController, didFinishEditing contact: Contact)
}


class EditingViewController: UIViewController, UITextFieldDelegate {
    
    
    var contact: Contact? = nil
    weak var delegate: EditingViewControllerDelegate?
    
    
    
    
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var addressField: UITextField!
    @IBOutlet var birthdayField: UITextField!
    @IBOutlet var noteField: UITextField!
    
    
    
    @IBAction func endEditing(_ sender: UIButton) {
        
        contact = Contact(givenName: firstNameField.text!, familyName: lastNameField.text!, address: addressField.text!, emailAddress: emailField.text!, phoneNumber: phoneField.text!, birthday: birthdayField.text!, note: noteField.text!)
        
        
        delegate?.editingViewController(viewController: self, didFinishEditing: contact!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameField.delegate = self
        lastNameField.delegate = self
        phoneField.delegate = self
        emailField.delegate = self
        addressField.delegate = self
        birthdayField.delegate = self
        noteField.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if textField == firstNameField {
            if textField.text?.isEmpty ?? true {
                return false
            } else {
                
                print(textField.text!)
                return true
            }
        }
        if textField == lastNameField {
            if textField.text?.isEmpty ?? true {
                return false
            } else {
                
                print(textField.text!)
                return true
            }
        }
        if textField == phoneField {
            if textField.text?.isEmpty ?? true {
                return false
            } else {
                
                print(textField.text!)
                return true
            }
        }
        if textField == emailField {
            if textField.text?.isEmpty ?? true {
                return false
            } else {
                
                print(textField.text!)
                return true
            }
        }
        if textField == addressField {
            if textField.text?.isEmpty ?? true {
                return false
            } else {
                
                print(textField.text!)
                return true
            }
        }
        if textField == birthdayField {
            if textField.text?.isEmpty ?? true {
                return false
            } else {
                
                print(textField.text!)
                return true
            }
        }
        if textField == noteField {
            if textField.text?.isEmpty ?? true {
                return false
            } else {
                
                print(textField.text!)
                return true
            }
        }
        return false
    }
    
    
}
