//
//  Recipe.swift
//  TestApp
//
//  Created by Zachary Reyes on 7/5/23.
//

import Foundation
import SwiftData

struct Recipe: Identifiable {
    let id = UUID()
    var name: String
    var recipeDesc: String
    var type: String
    var ingredients: [String]
    var steps: [String]
    var imageURL: String
    
    var numIngredients: Int {
        return self.ingredients.count
    }
    
    var stepsDict: [Int:String] {
        return Dictionary(uniqueKeysWithValues: zip(1..., self.steps))
    }
    
    init(name: String, description: String, type: String, ingredients: [String], steps: [String], imageURL: String) {
        self.name = name
        self.recipeDesc = description
        self.type = type
        self.ingredients = ingredients
        self.steps = steps
        self.imageURL = imageURL
    }
}

func recipeHTML(from urlString: String, completion: @escaping (String?) -> Void) {
    if let url = URL(string: urlString) {
        var request = URLRequest(url: url)
        request.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Safari/604.1.38", forHTTPHeaderField: "User-Agent")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let html = String(data: data, encoding: .utf8) {
                    completion(html)
                }
            } else {
                completion(nil)
            }
        }

        task.resume()
    } else {
        completion(nil)
    }
}


let allRecipes: [Recipe] = [
Recipe(name: "PB and J",
       description: "A delicious childhood classic",
       type: "Sandwich",
       ingredients: ["Peanut Butter", "Jelly", "Sliced Bread"],
       steps: ["Place 2 slices of bread on a plate", "Spread peanut butter on one", "Spread jelly on the other", "Put both pieces together" , "Enjoy!"],
       imageURL: "https://th.bing.com/th/id/R.9bb3fa5845bbc5da5fddc8e336c01c0f?rik=f9tCsunKmGkSdw&pid=ImgRaw&r=0"),

Recipe(name: "Grilled Cheese",
       description: "Bread with cheese, what could be better?",
       type: "Sandwich",
       ingredients: ["Cheese Slices", "Sliced Bread"],
       steps: ["Place 2 slices of bread on a plate", "Place cheese slices on one piece", "Place second piece of bread on top", "Toast the sandwich until the cheese is melted" , "Enjoy!"],
       imageURL: "https://square-production.s3.amazonaws.com/files/7f8c4b4ab41da873f635f7e22e3a9f50/original.jpeg"),
Recipe(name: "Chicken Wings",
       description: "Chicken wings, baby",
       type: "Entree",
       ingredients: ["Chicken"],
       steps: ["1. Place 2 slices of bread on a plate", "Place cheese slices on one piece", "Place second piece of bread on top", "Toast the sandwich until the cheese is melted" , "Enjoy!"],
       imageURL: "")
]
