import Vapor
import Contacts

@available(OSX 10.11, *)
extension Droplet {
    func setupRoutes() throws {
        
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }
        
        // Add route to connect controller
        if #available(OSX 10.12, *) {
            get("connect", handler: ConnectController().connect)
        } else {
            // Fallback on earlier versions
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)
    }
}
