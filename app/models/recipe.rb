class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredient

  def ingredients_attributes=(ingredient)
    self.ingredient = Ingredient.find_or_create_by(name: name, quantity: quantity)
    self.ingredient.update(ingredient)
  #  ingredients_attributes.each do |ingredient_attribute|
  #    self.ingredient.build(ingredient_attribute)
  #  end
  end

end
