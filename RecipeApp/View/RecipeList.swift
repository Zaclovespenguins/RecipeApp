//
//  RecipeList.swift
//  TestApp
//
//  Created by Zachary Reyes on 7/5/23.
//

import SwiftUI

struct RecipeList: View {
    var recipes: [Recipe]
    var body: some View {
        VStack {
            HStack {
                Text("\(recipes.count) \(recipes.count > 1 ? "Recipes" : "Recipe")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            LazyVGrid(columns: [GridItem(.fixed(160), spacing: 15)]) {
                ForEach(recipes) { recipe in
                    NavigationLink(destination: RecipeView(recipe: recipe)) {
                        RecipeCard(recipe: recipe)
                    }
                    .frame(width: 160, height: 217, alignment: .top)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.3), radius: 15, x:0, y:10)
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ScrollView {
        RecipeList(recipes: allRecipes)
    }
}
