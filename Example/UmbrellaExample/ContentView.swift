//
//  ContentView.swift
//  UmbrellaExample
//
//  Created by Jeffrey Berthiaume on 5/7/24.
//

import SwiftUI
import Umbrella

// a sample View that has a scrollable, tappable list of symbols. Tapping an item displays the name of the item.

struct ContentView: View {
    @State private var symbols: [SymbolItem] = (0..<20).map { _ in
        let randomSymbol = sfSymbols.randomElement() ?? "star"
        return SymbolItem(symbol: randomSymbol)
    }
    @State private var selectedSymbol: String = ""
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            List(symbols) { item in
                HStack {
                    Image(systemName: item.symbol)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .padding(.trailing, 8)
                    
                    Text(item.symbol)
                        .font(.headline)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedSymbol = item.symbol
                    showAlert = true
                }
            }
            .navigationTitle("Random SF Symbols")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("\(selectedSymbol) has been tapped!"))
            }
        }
    }
}

struct SymbolItem: Identifiable {
    let id = UUID()
    let symbol: String
}

// A list of some SF Symbols (add more if desired)
let sfSymbols = [
    "star", "heart", "circle", "square", "triangle",
    "moon", "sun.max", "bolt", "cloud", "leaf",
    "flame", "tortoise", "hare", "ant", "bell",
    "car", "bus", "bicycle", "airplane", "tram",
    "gear", "globe", "house", "umbrella", "lightbulb"
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
