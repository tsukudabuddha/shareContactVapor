import Vapor
import HTTP

final class ConnectController {
    
    func connect(_ req: Request) throws -> ResponseRepresentable {
        return "connect with me plz"
    }
}

extension ConnectController: EmptyInitializable { }
