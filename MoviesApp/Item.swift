//
//  Item.swift
//  MoviesApp
//
//  Created by Lucas Pedroso on 29/04/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
