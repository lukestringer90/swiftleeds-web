import Vapor
import Fluent
import FluentPostgresDriver
import Foundation

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    app.migrations.add(AppUser.Migrations())
    app.migrations.add(UserToken.Migrations())
    try app.databases.use(.postgres(url: Application.db), as: .psql)
    try routes(app)
}

extension Application {
    static let db = Environment.get("DB_URL")!
}
