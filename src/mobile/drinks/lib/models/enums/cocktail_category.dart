enum CocktailCategory {
  Cocktail, 
  OrdinaryDrink, 
  PunchPartyDrink, 
  Shake,
  OtherUnknown, 
  Cocoa,
  Shot,
  CoffeeTea, 
  HomemadeLiqueur,
  SoftDrink
} 

extension CocktailCategoryExtension on CocktailCategory {
  String get value {
    switch (this) {
      case CocktailCategory.Cocktail:
        return "Cocktail";
      case CocktailCategory.OrdinaryDrink:
        return "Ordinary Drink";
      case CocktailCategory.PunchPartyDrink:
        return "Punch / Party Drin";
      case CocktailCategory.Shake:
        return "Shake";
      case CocktailCategory.OtherUnknown:
        return "Other / Unknown";
      case CocktailCategory.Cocoa:
        return "Cocoa";
      case CocktailCategory.Shot:
        return "Shot";
      case CocktailCategory.CoffeeTea:
        return "Coffee / Tea";
      case CocktailCategory.HomemadeLiqueur:
        return "Homemade Liqueur";
      case CocktailCategory.SoftDrink:
        return "Soft Drink";
    }
  }
}