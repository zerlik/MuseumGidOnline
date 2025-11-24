//
//  RestAPIError.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 13/10/2024.
//

import Foundation

struct ApplicationError: Error, CustomStringConvertible, Equatable, Decodable {

    var description: String {
        if statusCode == 401 {
            return NSLocalizedString("LoginPassword.Email.AuthError401", comment: "")
        }
        if statusCode == 400 {
            return NSLocalizedString("Error.IncorrectLoginCredentials", comment: "")
        }
        if statusCode == 502 {
            return "Server responds with 502 error"
        }
        return nativeErrorDescription ?? ""
    }
    var statusCode: Int?
    var nativeErrorDescription: String?
}
