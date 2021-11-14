import Vapor

func routes(_ app: Application) throws {
    let routes = app.grouped("api", "v1")
    try routes
        .grouped("auth")
        .register(collection: AuthController())
}
