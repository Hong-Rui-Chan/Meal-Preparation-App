import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Recipe header
                VStack(alignment: .leading, spacing: 8) {
                    Text(recipe.name)
                        .font(.largeTitle)
                        .bold()
                    
                    Text(recipe.cuisine.rawValue)
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                // Nutrition facts
                VStack(alignment: .leading, spacing: 12) {
                    Text("Nutrition Facts")
                        .font(.title2)
                        .bold()
                    
                    HStack(spacing: 20) {
                        NutritionItemView(
                            title: "Calories",
                            value: "\(recipe.nutritionFacts.calories)"
                        )
                        
                        NutritionItemView(
                            title: "Protein",
                            value: String(format: "%.1fg", recipe.nutritionFacts.protein)
                        )
                        
                        NutritionItemView(
                            title: "Carbs",
                            value: String(format: "%.1fg", recipe.nutritionFacts.carbs)
                        )
                        
                        NutritionItemView(
                            title: "Fats",
                            value: String(format: "%.1fg", recipe.nutritionFacts.fats)
                        )
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Ingredients
                VStack(alignment: .leading, spacing: 12) {
                    Text("Ingredients")
                        .font(.title2)
                        .bold()
                    
                    ForEach(recipe.ingredients) { ingredient in
                        HStack {
                            Text("•")
                                .foregroundColor(.blue)
                            Text("\(String(format: "%.1f", ingredient.amount)) \(ingredient.unit) \(ingredient.name)")
                        }
                    }
                }
                .padding(.horizontal)
                
                // Instructions
                VStack(alignment: .leading, spacing: 12) {
                    Text("Instructions")
                        .font(.title2)
                        .bold()
                    
                    ForEach(Array(recipe.instructions.enumerated()), id: \.offset) { index, instruction in
                        HStack(alignment: .top) {
                            Text("\(index + 1).")
                                .foregroundColor(.blue)
                                .font(.headline)
                            Text(instruction)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct NutritionItemView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.headline)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RecipeDetailView(recipe: Recipe.sampleRecipes[0])
        }
    }
}