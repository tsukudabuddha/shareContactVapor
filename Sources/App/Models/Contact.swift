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
    let phoneNumber: String
    let workPhone: String
    let workEmail: String
    let jobTitle: String
    
    // TODO: Create vCard
    func createContactFile() -> Data {
        // Generate Contact
        let contact = CNMutableContact()
        contact.givenName = firstName
        contact.familyName = lastName
        if !email.isEmpty {
            let emailValue = CNLabeledValue(label: CNLabelHome, value: email as NSString)
            contact.emailAddresses.append(emailValue)
        }
        if !workEmail.isEmpty {
            let workEmailValue = CNLabeledValue(label: CNLabelWork, value: workEmail as NSString)
            contact.emailAddresses.append(workEmailValue)
        }
        if !phoneNumber.isEmpty {
            let phoneValue = CNLabeledValue(label: CNLabelHome, value: CNPhoneNumber(stringValue: phoneNumber))
            contact.phoneNumbers.append(phoneValue)
        }
        if !workPhone.isEmpty {
            let workPhoneValue = CNLabeledValue(label: CNLabelWork, value: CNPhoneNumber(stringValue: workPhone))
            contact.phoneNumbers.append(workPhoneValue)
        }
        if !jobTitle.isEmpty {
            contact.jobTitle = jobTitle
        }
        if let vCard = try? CNContactVCardSerialization.data(with: [contact]) {
            return vCard
        }
        return "Err".data(using: .ascii)!
        
    }
}
