//
//  ContentView.swift
//  fiff-swiftui
//
//  Created by edwin on 08/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello World")
                // hint_open_new_page
                NavigationLink(destination: ListView()) {
                    // hint_create_button
                    Text("Go To Next Page")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
