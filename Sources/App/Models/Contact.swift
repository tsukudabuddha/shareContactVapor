//
//  Contact.swift
//  shareContactVaporPackageDescription
//
//  Created by Andrew Tsukuda on 4/30/18.
//

import Contacts

@available(OSX 10.11, *)
struct Contact {
    let firstName: String
    let lastName: String
    let email: String
    let workPhone: String
    let workEmail: String
    let jobTitle: String
    
    // TODO: Create vCard
    func createContactFile() {
        // Generate Contact
        let contact = CNMutableContact()
        contact.givenName = "toggle.firstName"
        contact.familyName = "toggle.lastName"
        let mainEmail = CNLabeledValue(label: CNLabelWork, value: "andrew@test.com" as NSString)
        contact.emailAddresses = [mainEmail]
        
        
    }
}
