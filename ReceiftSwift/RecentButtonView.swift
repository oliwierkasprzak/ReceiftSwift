//
//  RecentButtonView.swift
//  ReceiftSwift
//
//  Created by Oliwier Kasprzak on 01/06/2023.
//

import SwiftUI

struct RecentButtonView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                    HStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: [GridItem(.fixed(120))], spacing: 16) {
                                ForEach(0...3, id: \.self) { _ in
                                    Button {

                                    } label: {
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
        }
    }
}

struct RecentButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RecentButtonView()
    }
}
