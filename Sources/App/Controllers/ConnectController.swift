import Vapor
import HTTP
import Contacts

@available(OSX 10.11, *)
final class ConnectController {
    
    func connect(_ req: Request) throws -> ResponseRepresentable {
        // TODO: Strip info from query
        let firstName = req.query?["firstName"]?.string ?? ""
        let lastName = req.query?["lastName"]?.string ?? ""
        let email = req.query?["email"]?.string ?? ""
        let workPhone = req.query?["workPhone"]?.string ?? ""
        let workEmail = req.query?["workEmail"]?.string ?? ""
        let jobTitle = req.query?["jobTitle"]?.string ?? ""
        
        let contact = Contact(firstName: firstName, lastName: lastName, email: email, workPhone: workPhone, workEmail: workEmail, jobTitle: jobTitle)
        contact.createContactFile()
        
        return "connect with me plz"
    }
}

@available(OSX 10.11, *)
extension ConnectController: EmptyInitializable { }
