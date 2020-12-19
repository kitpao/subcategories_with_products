class Category < ApplicationRecord
  has_many :children, class_name: "Category",
                          foreign_key: "parent_id"

  belongs_to :parent, class_name: "Category", optional: true
  has_many :products, foreign_key: "child_id"

  # scope :lowest_level, where(:children_id => nil)
end
