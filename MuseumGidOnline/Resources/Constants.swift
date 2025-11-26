//
//  Constants.swift
//  MuseumGidOnline
//
//  Created by andrew on 26.11.25.
//

import Foundation

enum Constants {
    static let apiEndPoint = "http://"
    static let app = "MuseumGidOnline"
    static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    static let bundleId = Bundle.main.bundleIdentifier
    static let linkTerms = "https://policies.google.com/terms?hl=en-US"
    static let linkConditions = "https://policies.google.com/terms?hl=en-US"
}
