//
//  GraphQLClient.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-11.
//

import Foundation
import Apollo
import ApolloSQLite

final class GraphQLClient {
    static let shared = GraphQLClient()
    
    private(set) lazy var apollo = ApolloClient(networkTransport: networkTransport, store: store)
    private lazy var networkTransport: HTTPNetworkTransport = {
        let transport = HTTPNetworkTransport(url: URL(string: "https://api.github.com/graphql")!)
        transport.delegate = self
        return transport
    }()
    
    var cacheUrl: URL!
    let cache: SQLiteNormalizedCache!
    let configuration = URLSessionConfiguration.default
    let store: ApolloStore!
    
    private init() {
        let applicationSupportPath = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first!
        let dbPath = applicationSupportPath + "/com.apollochamath.cache"
        
        if !FileManager.default.fileExists(atPath: dbPath) {
            try? FileManager.default.createDirectory(atPath: dbPath, withIntermediateDirectories: true, attributes: nil)
        }
        
        let url = URL(fileURLWithPath: dbPath)
        cacheUrl =  url.appendingPathComponent("apollogithubdata.sqlite3")
        cache = try? SQLiteNormalizedCache(fileURL: cacheUrl)
        configuration.timeoutIntervalForRequest = 10
        store = ApolloStore(cache: cache ?? InMemoryNormalizedCache())
    }
    
}

extension GraphQLClient: HTTPNetworkTransportPreflightDelegate {
    func networkTransport(_ networkTransport: HTTPNetworkTransport, shouldSend request: URLRequest) -> Bool {
        return true
    }
    
    func networkTransport(_ networkTransport: HTTPNetworkTransport, willSend request: inout URLRequest) {
        var headers = request.allHTTPHeaderFields ?? [String: String]()
        headers["Authorization"] = "Bearer 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"
        request.allHTTPHeaderFields = headers
    }
}
