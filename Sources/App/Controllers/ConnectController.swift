import Vapor
import HTTP
import Contacts

@available(OSX 10.11, *)
final class ConnectController {
    
    @available(OSX 10.12, *)
    func connect(_ req: Request) throws -> ResponseRepresentable {
        // TODO: Strip info from query
        let firstName = req.query?["firstName"]?.string ?? ""
        let lastName = req.query?["lastName"]?.string ?? ""
        let email = req.query?["email"]?.string ?? ""
        let phoneNumber = req.query?["phoneNumber"]?.string ?? ""
        let workPhone = req.query?["workPhone"]?.string ?? ""
        let workEmail = req.query?["workEmail"]?.string ?? ""
        let jobTitle = req.query?["jobTitle"]?.string ?? ""
        
        let contact = Contact(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber, workPhone: workPhone, workEmail: workEmail, jobTitle: jobTitle)
        
        let returnResponse = try Response(filePath: contact.createContactFile())
        returnResponse.headers = [
            HeaderKey.contentDisposition : "attachment; filename=\"newContact.vCard\""
        ]
        return returnResponse
    }
    
}

@available(OSX 10.11, *)
extension ConnectController: EmptyInitializable { }
