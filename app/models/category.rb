class Category < ApplicationRecord
  has_many :children, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy

  #no need for another table, a self join can be used
  belongs_to :parent, class_name: "Category", optional: true, counter_cache: :child_count
  has_many :products, foreign_key: "child_id"

  # select all leaves from a branch category
  def lowest_level_categories_ids(result = [])
    category = self
    if category.child_count == 0
      result << category.id
      return
    else
      category.children.each do |subcat|
        subcat.lowest_level_categories_ids(result)
      end
    end
    result
  end
end
