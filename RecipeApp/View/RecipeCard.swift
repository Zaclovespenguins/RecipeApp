//
//  RecipeCard.swift
//  TestApp
//
//  Created by Zachary Reyes on 7/5/23.
//

import SwiftUI

struct RecipeCard: View {
    var recipe: Recipe
    var body: some View {
        VStack{
            if recipe.imageURL != "" {
                AsyncImage(url: URL(string: recipe.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(alignment: .bottom) {
                            Text(recipe.name)
                                .font(.headline)
                                .foregroundColor(.white)
                                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 0.3)
                                .frame(maxWidth: 136)
                                .padding()
                        }
                } placeholder: {
                    ProgressView()
                        .foregroundColor(.white.opacity(0.7))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .overlay(alignment: .bottom) {
                            Text(recipe.name)
                                .font(.headline)
                                .foregroundColor(.white)
                                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 0.3)
                                .frame(maxWidth: 136)
                                .padding()
                        }
                }
            } else {
                Image(systemName: "photo.fill.on.rectangle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(alignment: .bottom) {
                        Text(recipe.name)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 0.3)
                            .frame(maxWidth: 136)
                            .padding()
                    }
                    
            }
        }
        .frame(width: 160, height: 217, alignment: .top)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.3), radius: 15, x:0, y:10)
    }
}
#Preview {
    RecipeCard(recipe: allRecipes[1])
}

/*
 VStack{
     AsyncImage(url: URL(string: recipe.imageURL), scale: 1.0) { phase in
         if let image = phase.image {
             image
                 .resizable()
                 .aspectRatio(contentMode: .fill)
                 .overlay(alignment: .bottom) {
                     Text(recipe.name)
                         .font(.headline)
                         .foregroundColor(.white)
                         .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 0.3)
                         .frame(maxWidth: 136)
                         .padding()
                 }
         } else if phase.error != nil {
             Image(systemName: "photo.fill.on.rectangle.fill")
         } else {
             ProgressView()
                 .foregroundColor(.white.opacity(0.7))
                 .frame(maxWidth: .infinity, maxHeight: .infinity)
                 .overlay(alignment: .bottom) {
                     Text(recipe.name)
                         .font(.headline)
                         .foregroundColor(.white)
                         .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 0.3)
                         .frame(maxWidth: 136)
                         .padding()
                 }
             
         }
     }
 }
 
 .resizable()
 .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
 .foregroundColor(.white.opacity(0.7))
 .frame(maxWidth: .infinity, maxHeight: .infinity)
 .overlay(alignment: .bottom) {
     Text(recipe.name)
         .font(.headline)
         .foregroundColor(.white)
         .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 0.3)
         .frame(maxWidth: 136)
         .padding()
 }
 */
