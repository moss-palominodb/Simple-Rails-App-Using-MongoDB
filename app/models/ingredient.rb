class Ingredient
  include MongoMapper::Document

  key :amount, String
  key :stuff, String

  belongs_to :recipe
end
