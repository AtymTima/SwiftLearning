//
//  PaymenType.swift
//  SpaceAdventure
//
//  Created by Timur on 26.06.2018.
//  Copyright © 2018 Tim K13V. All rights reserved.
//

import Foundation
enum PaymentType: String {
    case cash,card,gold
    func simpleDescription() -> String {
        switch self {
        case .cash:
            return "You decided to use cash"
        case .card:
            return "You decided to use card"
        case .gold:
            return "You decided to use gold"
        }
    }
}
