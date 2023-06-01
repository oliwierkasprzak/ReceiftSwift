//
//  HistoryView.swift
//  ReceiftSwift
//
//  Created by Oliwier Kasprzak on 01/06/2023.
//
import SwiftUI

struct HistoryView: View {
    let receipts = Receipt.receipts
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.red.edgesIgnoringSafeArea(.all) // Set the desired background color here
                
                VStack {
                    List(receipts) { receipt in
                        NavigationLink {
                            ReceiptDetailView()
                        } label: {
                            VStack(alignment: .leading) {
                                Text(receipt.merchant)
                                    .font(.headline)
                                Text("Date: \(formattedDate(receipt.date))")
                                Text("Total Amount: $\(receipt.totalAmount, specifier: "%.2f")")
                            }
                        }
                    }
                }
                .background(.pink)
                .scrollContentBackground(.hidden)
            }
            .navigationBarTitle("History")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
