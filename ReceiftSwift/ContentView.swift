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
            VStack {
                RecentButtonView()
                    .padding()
                HistoryView()
                    .background(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
