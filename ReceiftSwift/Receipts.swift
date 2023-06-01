//
//  Receipts.swift
//  ReceiftSwift
//
//  Created by Oliwier Kasprzak on 01/06/2023.
//

import Foundation

struct Receipt: Identifiable {
    let id = UUID()
    let merchant: String
    let date: Date
    let totalAmount: Double

   static let receipts: [Receipt] = [
        Receipt(merchant: "Ikea", date: Date(), totalAmount: 29.99),
        Receipt(merchant: "Nike", date: Date().addingTimeInterval(-86400), totalAmount: 150),
        Receipt(merchant: "iSpot", date: Date().addingTimeInterval(-172800), totalAmount: 4999),
        Receipt(merchant: "Ikea", date: Date(), totalAmount: 29.99),
        Receipt(merchant: "Nike", date: Date().addingTimeInterval(-86400), totalAmount: 150),
        Receipt(merchant: "iSpot", date: Date().addingTimeInterval(-172800), totalAmount: 4999)
    ]
}
