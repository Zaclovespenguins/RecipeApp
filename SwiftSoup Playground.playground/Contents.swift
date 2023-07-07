import Foundation
import SwiftSoup


func getRecipeFromHTML(url: String, completion: @escaping (String) -> Void) {
    let headers = [
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36"
    ]
    var request = URLRequest(url: URL(string: url)!)
    request.allHTTPHeaderFields = headers

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: \(error)")
            completion("")
            return
        }

        guard let data = data else {
            print("Data is empty")
            completion("")
            return
        }

        guard let html = String(data: data, encoding: .utf8) else {
            print("Couldn't decode data into UTF-8")
            completion("")
            return
        }

        do {
            let doc: Document = try SwiftSoup.parse(html)
            let jsonLd = try doc.select("script[type=application/ld+json]").first()?.data()
            let recipe = String(jsonLd ?? "")
            completion(recipe)
        } catch Exception.Error(let type, let message) {
            print("\(type): \(message)")
            completion("")
        } catch {
            print("error")
            completion("")
        }
    }

    task.resume()
}


getRecipeFromHTML(url: "https://www.tasteofhome.com/recipes/chimichangas") { recipe in
    print(recipe)
}

