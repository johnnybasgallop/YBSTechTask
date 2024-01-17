//
//  ContentView.swift
//  YBSTechChallenge
//
//  Created by johnny basgallop on 16/01/2024.
//

import SwiftUI

let screenHeight = UIScreen.main.bounds.height
let screenWidth = UIScreen.main.bounds.width


struct ContentView: View {
    @StateObject var searchBarViewModel = SearchBarViewModel()
    var body: some View {
        
        VStack {
            SearchBarView().environmentObject(searchBarViewModel)
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
