import Foundation

struct Recipe: Identifiable, Hashable {
    let id = UUID()
    
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    let name: String
    let cuisine: CuisineType
    let ingredients: [Ingredient]
    let instructions: [String]
    let nutritionFacts: NutritionFacts
}

struct Ingredient: Identifiable, Hashable {
    let id = UUID()
    
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    let name: String
    let amount: Double
    let unit: String
}

struct NutritionFacts: Hashable {
    let calories: Int
    let protein: Double
    let carbs: Double
    let fats: Double
}

enum CuisineType: String, CaseIterable {
    case italian = "Italian"
    case mexican = "Mexican"
    case chinese = "Chinese"
    case japanese = "Japanese"
    case american = "American"
    case indian = "Indian"
}

// Sample Data
extension Recipe {
    static let sampleRecipes = [
        Recipe(
            name: "Spaghetti Carbonara",
            cuisine: .italian,
            ingredients: [
                Ingredient(name: "Spaghetti", amount: 1, unit: "pound"),
                Ingredient(name: "Eggs", amount: 4, unit: "large"),
                Ingredient(name: "Pecorino Romano", amount: 1, unit: "cup"),
                Ingredient(name: "Black Pepper", amount: 2, unit: "teaspoons")
            ],
            instructions: [
                "Bring a large pot of salted water to boil",
                "Cook spaghetti according to package directions",
                "Meanwhile, whisk eggs and cheese in a bowl",
                "Drain pasta and immediately toss with egg mixture",
                "Season generously with black pepper"
            ],
            nutritionFacts: NutritionFacts(
                calories: 450,
                protein: 20.0,
                carbs: 65.0,
                fats: 12.0
            )
        ),
        Recipe(
            name: "Chicken Stir Fry",
            cuisine: .chinese,
            ingredients: [
                Ingredient(name: "Chicken Breast", amount: 1, unit: "pound"),
                Ingredient(name: "Mixed Vegetables", amount: 2, unit: "cups"),
                Ingredient(name: "Soy Sauce", amount: 3, unit: "tablespoons"),
                Ingredient(name: "Vegetable Oil", amount: 2, unit: "tablespoons")
            ],
            instructions: [
                "Cut chicken into bite-sized pieces",
                "Heat oil in a large wok or skillet",
                "Cook chicken until golden brown",
                "Add vegetables and stir-fry until tender-crisp",
                "Add soy sauce and stir to combine"
            ],
            nutritionFacts: NutritionFacts(
                calories: 350,
                protein: 35.0,
                carbs: 15.0,
                fats: 18.0
            )
        )
    ]
}
