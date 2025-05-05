import Foundation

class RecipeViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe]
    @Published var searchText = ""
    @Published var selectedCuisine: CuisineType?
    
    var filteredRecipes: [Recipe] {
        var filtered = recipes
        
        // Filter by search text
        if !searchText.isEmpty {
            filtered = filtered.filter { recipe in
                // Search in recipe name
                if recipe.name.localizedCaseInsensitiveContains(searchText) {
                    return true
                }
                // Search in ingredients
                if recipe.ingredients.contains(where: { $0.name.localizedCaseInsensitiveContains(searchText) }) {
                    return true
                }
                return false
            }
        }
        
        // Filter by cuisine type
        if let cuisine = selectedCuisine {
            filtered = filtered.filter { $0.cuisine == cuisine }
        }
        
        return filtered
    }
    
    init() {
        self.recipes = Recipe.sampleRecipes
    }
    
    func filterByCuisine(_ cuisine: CuisineType?) {
        selectedCuisine = cuisine
    }
}
