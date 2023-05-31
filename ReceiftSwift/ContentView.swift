//
//  ContentView.swift
//  ReceiftSwift
//
//  Created by Oliwier Kasprzak on 30/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        
                            ScrollView(.horizontal) {
                                LazyHGrid(rows: [GridItem(.fixed(120))], spacing: 16) {
                                    ForEach(0...3, id: \.self) { index in
                                        Button(action: {
                                            
                                        }) {
                                            Label("Receipt", systemImage: "bag.badge.questionmark")
                                        }
                                    
                                        .frame(width: 100, height: 100)
                                        .padding()
                                        .background(Color.orange.opacity(0.8))
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                        
                                    }
                                    .navigationTitle("Recent")
                                }
                            
                            
                        }

                        
                    }
                }
                .navigationTitle("ReceiptScanner")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
