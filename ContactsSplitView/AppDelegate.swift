//
//  AppDelegate.swift
//  ContactsSplitView
//
//  Created by Adrian McDaniel on 1/24/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let splitVC = window?.rootViewController as! ContainerViewController
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: .main)
        
        let contactListVC = mainStoryboard.instantiateViewController(withIdentifier: "ContactsList") as! ContactListTableViewController
        
        let contactVC = mainStoryboard.instantiateViewController(withIdentifier: "ContactDetails") as! ContactViewController
        
        
        contactListVC.selectionClosure = { contact in
            contactVC.contact = contact
            splitVC.showDetailViewController(contactVC, sender: nil)
        }
        
        let masterNav = UINavigationController(rootViewController: contactListVC)
        
        masterNav.navigationBar.backgroundColor = UIColor.cyan
        
    
        
        splitVC.viewControllers = [masterNav, contactVC]
        
        return true
    }
}



