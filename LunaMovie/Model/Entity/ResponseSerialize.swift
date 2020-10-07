//
//  ResponseSerialize.swift
//  LunaMovie
//
//  Created by Muhammad Iksanul on 07/10/20.
//

struct ResponseSerialize<T: Codable>: Codable {
    let page, totalResults, totalPages, statusCode: Int?
    let statusMessage: String?
    let success: Bool?
    let results: T?

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case success
    }
}
