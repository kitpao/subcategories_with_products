class Product < ApplicationRecord
  belongs_to :child, class_name: "Category"

  # Pluck converts the information in the id column into an array of the existing id's 
  scope :ordered_randomly, -> (n) { where(id: pluck(:id).sample(n)) }
  scope :get_subproducts, -> (ids_array){ where(id: ids_array) }
end
