class Product < ApplicationRecord
  belongs_to :child, class_name: "Category"
end
