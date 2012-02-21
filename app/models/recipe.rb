class Recipe
  include MongoMapper::Document
  
  key :name, String
  timestamps!

  many :ingredients
end
