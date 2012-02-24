require 'test_helper'
require 'rails/performance_test_help'

class HeavyWritesTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { :runs => 5, :metrics => [:wall_time, :memory]
  #                          :output => 'tmp/performance', :formats => [:flat] }

  def test_many_recipes
    get '/'
    (1..20000).each do |num|
      Recipe.create(:name => get_name + ' ' + num.to_s,
		     :ingredients => get_ingredients)
    end
  end

  private

  def get_name
    ['Chocolate Cake',
     'Pumpkin Pie',
     'Mashed Potatoes',
     'Strawberry Milkshake'].sample
  end

  def get_ingredients
    ingredients = []
    (1..10).each do |x|
      ingredients << Ingredient.new(:amount => get_amount, :stuff => get_stuff)
    end
    ingredients
  end

  def get_stuff
    ['glass water', 'tablespoon vanilla', 'cup flour', 'stick butter'].sample 
  end

  def get_amount
    ['1', '1/2', '3', '4.5'].sample
  end
end
