import UIKit
import PlaygroundSupport

// Part One: HTTP, URLs, and URL Session

PlaygroundPage.current.needsIndefiniteExecution = true
// JSON
// {
//    "appName": "facebook",
//    "downloads": 25,
//    ...
// }

// Swift Object (Codable)
struct StoreItems: Codable {
    var results: [StoreItem]
}

struct StoreItem: Codable {
    var name: String
    var artist: String
    var kind: String
    var artworkUrl: String
    
    enum CodingKeys: String, CodingKey {
        case name = "trackName"
        case artist = "artistName"
        case kind = "kind"
        case artworkUrl = "artworkUrl100"
    }
}

// url: https://itunes.apple.com/search?<query-parameters>
// <query-parameters>: key=taylor&current=23

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.0, value: $0.1)}
        return components?.url
    }
    
}
    



//let query: [String: String] = ["term": "Inside Out 2015", "media": "movie", "lang": "en_us", "limit": "10"]

func fetchItems(matching query: [String: String], completion: @escaping ([StoreItem]?) -> Void) {
    let bassURL = URL(string: "https://itunes.apple.com/search?")!
    
    guard let searchURL = bassURL.withQueries(query) else {
        completion(nil)
        print("Unable to build URL with supplied queries")
        return
}


let task = URLSession.shared.dataTask(with: searchURL) {(data, response, error) in
        let decoder = JSONDecoder()
        if let data = data {
            if let storeItems = try? decoder.decode(StoreItems.self, from: data) {
                completion(storeItems.results)
            } else {
                print("Either no data was returned, or data was not serialized")
                completion(nil)
                return
            }
    }
}
    task.resume()
}

let query: [String: String] = ["term": "Inside Out 2015", "media": "movie", "lang": "en_us", "limit": "10"]

fetchItems(matching: query) { (storeItems) in
    if let items = storeItems {
        print(items)
    }
}
