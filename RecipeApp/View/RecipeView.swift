//
//  RecipeView.swift
//  TestApp
//
//  Created by Zachary Reyes on 7/5/23.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView{
            VStack{
                if recipe.imageURL != "" {
                    AsyncImage(url: URL(string: recipe.imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(.circle)
                    } placeholder: {
                        ProgressView()
                            .foregroundColor(.white.opacity(0.7))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                } else {
                    Image(systemName: "photo.fill.on.rectangle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .frame(height: 300)
            .ignoresSafeArea(.container, edges: .top)
            Spacer()
            VStack(spacing: 30){
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                VStack(alignment: .leading, spacing: 30) {
                    Text(recipe.recipeDesc)
                }
                VStack {
                    ForEach(recipe.ingredients, id: \.self) {ingredient in
                        Text("\(ingredient)")
                    }
                }
                VStack {
                    ForEach(Array(recipe.steps.enumerated()), id: \.1) { index, step in
                        HStack {
                            Text("\(index + 1).")
                                .padding(.horizontal)
                            Text(step)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    RecipeView(recipe: allRecipes[1])
}

/*
 ForEach(recipe.steps, id: \.self) { step in
     Text("\(stepNumber). \(step)")
 */
