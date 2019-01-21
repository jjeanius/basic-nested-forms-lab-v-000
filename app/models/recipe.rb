class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients

  def ingredients_attributes(ingredients_attributes)
    ingredients_attributes.each do |ingredient_attribute|
      self.ingredient.build(ingredient_attribute)
    end
  end

end
