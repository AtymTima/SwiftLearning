//
//  PayCard.swift
//  ShopList2
//
//  Created by  Тима on 27.06.2018.
//  Copyright © 2018  Тима. All rights reserved.
//

import Foundation

enum PaymentType: String {
    case cash,card,bitcoin
    func simpleDescription() -> String {
        switch self {
        case .cash:
            return "you choose purchasing by cash"
        case .card:
            return "you choose purchasing by card"
        case .bitcoin:
            return "you choose purchasing by bitcoin"
        }
    }
}
