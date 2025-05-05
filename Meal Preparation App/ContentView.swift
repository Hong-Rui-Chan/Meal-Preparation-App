import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RecipeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // Search bar
                TextField("Search recipes or ingredients", text: $viewModel.searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Cuisine type filter
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Button(action: { viewModel.filterByCuisine(nil) }) {
                            Text("All")
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(viewModel.selectedCuisine == nil ? Color.blue : Color.gray.opacity(0.2))
                                .foregroundColor(viewModel.selectedCuisine == nil ? .white : .primary)
                                .cornerRadius(20)
                        }
                        
                        ForEach(CuisineType.allCases, id: \.self) { cuisine in
                            Button(action: { viewModel.filterByCuisine(cuisine) }) {
                                Text(cuisine.rawValue)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(viewModel.selectedCuisine == cuisine ? Color.blue : Color.gray.opacity(0.2))
                                    .foregroundColor(viewModel.selectedCuisine == cuisine ? .white : .primary)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Recipe list
                List {
                    ForEach(viewModel.filteredRecipes) { recipe in
                        NavigationLink(value: recipe) {
                            RecipeRowView(recipe: recipe)
                        }
                    }
                }
            }
            .navigationTitle("Meal Prep")
            .navigationDestination(for: Recipe.self) { recipe in
                RecipeDetailView(recipe: recipe)
            }
        }
    }
}

struct RecipeRowView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(recipe.name)
                .font(.headline)
            
            Text(recipe.cuisine.rawValue)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("\(recipe.ingredients.count) ingredients • \(recipe.nutritionFacts.calories) calories")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 8)
    }
}

