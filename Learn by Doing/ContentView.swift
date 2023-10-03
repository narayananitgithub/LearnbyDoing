//
//  ContentView.swift
//  Learn by Doing
//
//  Created by Narayanasamy on 02/10/23.
//

import SwiftUI

struct ContentView: View {
   // MARK: - PROPERTIES
    var cards: [Card] = cardData
   
    // MARK: - body
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(alignment: .center,spacing: 20) {
                ForEach(cards) { item in
                    CardView(card: item)
                    
                }
            }
            .padding(20)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cards: cardData)
            .previewDevice("iPhone 11 pro")
    }
}
