//
//  ContentView.swift
//  fiff-swiftui
//
//  Created by edwin on 08/11/22.
//

import SwiftUI

struct ListView: View {
    @State private var isLoading: Bool
    @State private var presentAlert = false
    @State private var infoDialog = "";
    @State private var albumCollection : Album
    
    init() {
        self.isLoading = true;
        self.albumCollection = Album()
    }
    
    func loadingPage(){
        print("loading page")
        // hint_show_loading_indicator
        self.isLoading = true
        print("isLoading",isLoading)
        Task {
            await loadHttp()
            self.isLoading = false
            print("isLoading",isLoading)
        }
        //        async (){
        //            await loadHttp()
        //            self.isLoading = false
        //            print("isLoading",isLoading)
        //        }
    }
    
    
    var body: some View {
        VStack {
            if (self.isLoading) {
                Text("loading")
            }
            else {
                // hint_show_webservice_result_on_list
                List {
                    ForEach(self.albumCollection) { index in
                        Text(index.title)
                        // hint_button_on_list
                        Button("Show Info Detail") {
                            // hint_show_detail_item_on_alert
                            self.infoDialog = String(index.id) + " - " + index.title
                            presentAlert = true
                        }
                        Spacer()
                    }
                }
            }
            
        }
        .alert(infoDialog, isPresented: $presentAlert, actions: {})
        .onAppear()
        {
            self.loadingPage()
        }
    }
    
    func loadHttp() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums") else {
            print("Invalid URL")
            return
        }
        do {
            // hint_loading_webservice
            let (data, _) = try await URLSession.shared.data(from: url)
            let album = try? JSONDecoder().decode(Album.self, from: data)
            self.albumCollection = album ?? Album()
        } catch {
            print("Invalid data")
        }
    }
}

struct ContentViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}



