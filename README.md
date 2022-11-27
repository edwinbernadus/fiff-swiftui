# starter-template-swift-ui

## Getting Started
** read this first **  
https://github.com/edwinbernadus/starter-template-frontend-framework


## Snippet List
- hint_create_button
````swift
// hint_create_button
Text("Go To Next Page")
````
- hint_open_new_page
````swift
// hint_open_new_page
NavigationLink(destination: ListView()) {
    Text("Go To Next Page")
}
````
- hint_loading_webservice
````swift
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
````
- hint_show_loading_indicator
````swift
print("loading page")
// hint_show_loading_indicator
self.isLoading = true
print("isLoading",isLoading)
````
- hint_show_webservice_result_on_list
````swift
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
````
- hint_button_on_list
````swift
// hint_button_on_list
Button("Show Info Detail") {
    self.infoDialog = String(index.id) + " - " + index.title
    presentAlert = true
}
````
- hint_show_detail_item_on_alert
````swift
// hint_show_detail_item_on_alert
self.infoDialog = String(index.id) + " - " + index.title
presentAlert = true
````