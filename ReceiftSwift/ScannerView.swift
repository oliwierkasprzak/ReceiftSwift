//
//  ScannerView.swift
//  ReceiftSwift
//
//  Created by Oliwier Kasprzak on 01/06/2023.
//

import SwiftUI

struct ScannerView: View {
    @State private var scannedText: String?
    @State private var showScanner = false
    var body: some View {
        VStack {
            Text("SCAN!")
                .font(.largeTitle.bold())
                .foregroundColor(.red)
            Button {
                showScanner.toggle()
            } label: {
                
                
                Image(systemName: "barcode.viewfinder")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
            }
        }
        .sheet(isPresented: $showScanner) {
            ReceiptScanner(scannedText: $scannedText)
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView()
    }
}
