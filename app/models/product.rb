class Product < ApplicationRecord
  belongs_to :leaf, class_name: "Category"

  # Pluck converts the information in the id column into an array of the existing id's 
  scope :ordered_randomly, -> (n) { where(id: pluck(:id).sample(n)) }
end
