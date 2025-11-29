//
//  City.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import Foundation

struct City: Identifiable, Hashable {
    let id: String
    let name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

