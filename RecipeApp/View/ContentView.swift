//
//  ContentView.swift
//  TestApp
//
//  Created by Zachary Reyes on 7/5/23.
//

import SwiftUI

let device = UIDevice.current.name

struct ContentView: View {
    
    var body: some View {
        

            NavigationSplitView {
                ScrollView {
                    RecipeList(recipes: allRecipes)
                }
                .navigationTitle("Recipes")
            } detail: {
                VStack{
                    Image("mixer2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    Text("Choose a recipe")
                        .font(.callout)
                }
                }
                .padding()
            }
    }


#Preview {
    ContentView()
}

// Test commit

