@_exported import Vapor

extension Droplet {
    public func setup() throws {
        if #available(OSX 10.11, *) {
            try setupRoutes()
        } else {
            // Fallback on earlier versions
        }
        // Do any additional droplet setup
    }
}
