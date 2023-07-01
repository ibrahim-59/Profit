import 'package:shared_preferences/shared_preferences.dart';

Map food = {
  "Aids":[
    {
      "name": "Fruits & Vegetables",//helthy
    },
    {
      "name": "Fresh juices",//helthy
    },
    {
      "name": "Red pepper",//helthy
    },
    {
      "name": "Fast Food",//unhelthy
    },
    {
      "name": "sugar",//unhelthy
    },
    {
      "name": "Fried foods",//unhelthy
    }
  ],
  "Acne":[
    {
      "name": "Oatmeal",//helthy
    },
    {
      "name": "Fish",//helthy
    },
    {
      "name": "Spinach and kale",//helthy
    },
    {
      "name": "Energy Drinks",//unhelthy
    },
    {
      "name": "Soda",//unhelthy
    },
    {
      "name": "Dessert",//unhelthy
    }
  ],
  "Alcoholic hepatitis":[
    {
      "name": "avocado",//helthy
    },
    {
      "name": "Starchy foods",//helthy
    },
    {
      "name": "White rice",//helthy
    },
    {
      "name": "Alcoholic beverages",//unhelthy
    },
    {
      "name": "Sugary foods",//unhelthy
    },
    {
      "name": "Salts",//unhelthy
    }
  ],
  "Allergy":[
    {
      "name": "Spinach",//helthy
    },
    {
      "name": "Garlic",//helthy
    },
    {
      "name": "Apples and bananas",//helthy
    },
    {
      "name": "Baked",//unhelthy
    },
    {
      "name": "Sweets & Custard",//unhelthy
    },
    {
      "name": " Pasta",//unhelthy
    }
  ],
  "Arthritis":[
    {
      "name": "Fatty fish",//helthy
    },
    {
      "name": "Eggs",//helthy
    },
    {
      "name": "Oats",//helthy
    },
    {
      "name": "Salts",//unhelthy
    },
    {
      "name": "Coffee",//unhelthy
    },
    {
      "name": "Soda",//unhelthy
    }
  ],
  "Bronchial Asthma":[
    {
      "name": "Meat and milk products",//helthy
    },
    {
      "name": "Fish and vegetable oil",//helthy
    },
    {
      "name": "Calcium-rich foods",//helthy
    },
    {
      "name": "Allergen foods",//unhelthy
    },
    {
      "name": "Salts",//unhelthy
    },
    {
      "name": "Pickles",//unhelthy
    }
  ],
  "Cervical spondylosis":[
    {
      "name": "Red meat",//helthy
    },
    {
      "name": "Vegetables rich in purine",//helthy
    },
    {
      "name": "Sugary foods and drinks",//helthy
    },
    {
      "name": "Salts",//unhelthy
    },
    {
      "name": "Soda",//unhelthy
    },
    {
      "name": "Alcoholic beverages",//unhelthy
    }
  ],
  "Chicken pox":[
    {
      "name": "Soft foods",//helthy
    },
    {
      "name": "Rice & Pasta",//helthy
    },
    {
      "name": "Fruits",//helthy
    },
    {
      "name": "Spicy foods",//unhelthy
    },
    {
      "name": "Foods rich in saturated fats",//unhelthy
    },
    {
      "name": "Salty foods",//unhelthy
    }
  ],
  "Common Cold":[
    {
      "name": "Vegetables",//helthy
    },
    {
      "name": "Fish",//helthy
    },
    {
      "name": "Honey",//helthy
    },
    {
      "name": "Foods high in salt",//unhelthy
    },
    {
      "name": "High sugar",//unhelthy
    },
    {
      "name": "Fried foods",//unhelthy
    }
  ],
  "Covid":[
    {
      "name": "fluids",//helthy
    },
    {
      "name": " Ginger, garlic and turmeric",//helthy
    },
    {
      "name": "Fruits & Vegetables",//helthy
    },
    {
      "name": "fats",//unhelthy
    },
    {
      "name": "Sugary foods and drinks",//unhelthy
    },
    {
      "name": "Coffee",//unhelthy
    }
  ],
  "Dengue":[
    {
      "name": "Spinach",//helthy
    },
    {
      "name": "Chicken and lean meat",//helthy
    },
    {
      "name": "Fenugreek plant",//helthy
    },
    {
      "name": "Fatty and high-fat foods",//unhelthy
    },
    {
      "name": "Spicy and spicy foods",//unhelthy
    },
    {
      "name": "Caffeinated foods",//unhelthy
    }
  ],
  "Diabetes":[
    {
      "name": "Sweet Potato",//helthy
    },
    {
      "name": "Fatty fish",//helthy
    },
    {
      "name": "Milk and yogurt",//helthy
    },
    {
      "name": "Fried foods",//unhelthy
    },
    {
      "name": "Drinks containing sugars",//unhelthy
    },
    {
      "name": "Processed meats",//unhelthy
    }
  ],
  "Dimorphic hemorrhoids":[
    {
      "name": "Oats and whole grains",//helthy
    },
    {
      "name": "Leafy greens such as spinach",//helthy
    },
    {
      "name": "Nuts",//helthy
    },
    {
      "name": "Spicy foods",//unhelthy
    },
    {
      "name": "Alcoholic beverages",//unhelthy
    },
    {
      "name": "Citrus fruits",//unhelthy
    }
  ],
  "GERD":[
    {
      "name": "Foods rich in fiber",//helthy
    },
    {
      "name": "Foods rich in vitamin C",//helthy
    },
    {
      "name": "Herbs and spices",//helthy
    },
    {
      "name": "Alcohol",//unhelthy
    },
    {
      "name": "Spicy foods",//unhelthy
    },
    {
      "name": "Milk",//unhelthy
    }
  ],
  "Gastroenteritis ":[
    {
      "name": "Garlic",//helthy
    },
    {
      "name": "Honey",//helthy
    },
    {
      "name": "liquorice",//helthy
    },
    {
      "name": "Fatty and fried foods",//unhelthy
    },
    {
      "name": "Alcoholic beverages",//unhelthy
    },
    {
      "name": "Spicy foods",//unhelthy
    }
  ],
  "Heart attack":[
    {
      "name": "Leafy greens",//helthy
    },
    {
      "name": " Fatty fish",//helthy
    },
    {
      "name": "olive oil",//helthy
    },
    {
      "name": "Nuts",//unhelthy
    },
    {
      "name": "Sugar, salt and refined carbohydrates",//unhelthy
    },
    {
      "name": "Red and processed meat",//unhelthy
    }
  ],
  "Hepatitis c":[
    {
      "name": "Meat high in fat content",//helthy
    },
    {
      "name": " olive oil ",//helthy
    },
    {
      "name": "Lemon & Citrus",//helthy
    },
    {
      "name": "Baked Potato",//unhelthy
    },
    {
      "name": "Unroasted peanuts",//unhelthy
    },
    {
      "name": "Starch ",//unhelthy
    }
  ],
  "Hypertension ":[
    {
      "name": "Skimmed milk and yogurt",//helthy
    },
    {
      "name": "Red beets",//helthy
    },
    {
      "name": "Oats",//helthy
    },
    {
      "name": "Fats and fried foods",//unhelthy
    },
    {
      "name": "Artificial sweeteners and soft drinks",//unhelthy
    },
    {
      "name": "Coffee",//unhelthy
    }
  ],
  "Hyperthyroidism":[
    {
      "name": "meats",//helthy
    },
    {
      "name": "Eggs",//helthy
    },
    {
      "name": "Fish, seaweed",//helthy
    },
    {
      "name": "Cruciferous vegetables",//unhelthy
    },
    {
      "name": "Soy products",//unhelthy
    },
    {
      "name": "Foods rich in sugars",//unhelthy
    }
  ],
  "Hypoglycemia ":[
    {
      "name": "Vegetables",//helthy
    },
    {
      "name": "Fruits",//helthy
    },
    {
      "name": "Olive Oils",//helthy
    },
    {
      "name": "meats",//unhelthy
    },
    {
      "name": "Medical",//unhelthy
    },
    {
      "name": "Sodium",//unhelthy
    }
  ],
  "Hypothyroidism ":[
    {
      "name": "meats",//helthy
    },
    {
      "name": "Eggs",//helthy
    },
    {
      "name": "Fish, seaweed",//helthy
    },
    {
      "name": "Cruciferous vegetables",//unhelthy
    },
    {
      "name": "Soy products",//unhelthy
    },
    {
      "name": "Foods rich in sugars",//unhelthy
    }
  ],
  "Migraine":[
    {
      "name": "turkeys",//helthy
    },
    {
      "name": " Seafood",//helthy
    },
    {
      "name": "Foods rich in vitamin C",//helthy
    },
    {
      "name": "Alcohol",//unhelthy
    },
    {
      "name": "Caffeine",//unhelthy
    },
    {
      "name": "Sugars",//unhelthy
    }
  ],
  "Osteoarthritis":[
    {
      "name": "Oily fish",//helthy
    },
    {
      "name": "Dairy",//helthy
    },
    {
      "name": "Green tea",//helthy
    },
    {
      "name": "Sugar",//unhelthy
    },
    {
      "name": "Refined carbohydrates ",//unhelthy
    },
    {
      "name": "Saturated fat",//unhelthy
    }
  ],
  "Paroxysmal Positional Vertigo":[
    {
      "name": "Milk",//helthy
    },
    {
      "name": "fruits",//helthy
    },
    {
      "name": "vegetables",//helthy
    },
    {
      "name": "Processed foods",//unhelthy
    },
    {
      "name": " fast food",//unhelthy
    },
    {
      "name": "Sodium",//unhelthy
    }
  ],
  "Peptic ulcer disease":[
    {
      "name": "Yogurt",//helthy
    },
    {
      "name": "fruits",//helthy
    },
    {
      "name": "Cashew",//helthy
    },
    {
      "name": "Alcohol",//unhelthy
    },
    {
      "name": "Fatty Foods",//unhelthy
    },
    {
      "name": "Chocolate",//unhelthy
    }
  ],
  "Pneumonia":[
    {
      "name": "Warm drinks",//helthy
    },
    {
      "name": "Green leafy vegetable",//helthy
    },
    {
      "name": "Protein-rich foods",//helthy
    },
    {
      "name": "Salty foods",//unhelthy
    },
    {
      "name": "Milk and milk products",//unhelthy
    },
    {
      "name": "Foods rich in sugar",//unhelthy
    }
  ],
  "Tuberculosis":[
    {
      "name": "Nutritional supplements",//helthy
    },
    {
      "name": "Vitamin D",//helthy
    },
    {
      "name": "vegetables and fruits",//helthy
    },
    {
      "name": "Smoking",//unhelthy
    },
    {
      "name": "Alcohol",//unhelthy
    },
    {
      "name": "High refined sugar foods",//unhelthy
    }
  ],
  "Typhoid":[
    {
      "name": "Boiled rice",//helthy
    },
    {
      "name": "Honey",//helthy
    },
    {
      "name": "Yogurt",//helthy
    },
    {
      "name": "Foods rich in fiber",//unhelthy
    },
    {
      "name": "Onions and garlic",//unhelthy
    },
    {
      "name": "Spicy foods",//unhelthy
    }
  ],
  "Varicose veins":[
    {
      "name": "foods rich in vitamins",//helthy
    },
    {
      "name": "vegetables",//helthy
    },
    {
      "name": "fish ",//helthy
    },
    {
      "name": "caffeine ",//unhelthy
    },
    {
      "name": "salty foods",//unhelthy
    },
    {
      "name": "foods rich in saturated fats",//unhelthy
    }
  ],



};
Future<void> saveSignInStatus(bool isSignedIn) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isSignedIn', isSignedIn);
}




