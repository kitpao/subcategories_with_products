class Category < ApplicationRecord
  has_many :children, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy

  #no need for another table, a self join can be used
  belongs_to :parent, class_name: "Category", optional: true, counter_cache: :child_count
  has_many :products, foreign_key: "child_id"

  # select all leaves from a category
  def self.lowest_level(result = [])
    category = self
    if category.child_count == 0
      result << category
    else
      category.children.each do |sub|
        sub.lowest_level(result)
      end
    end
    result
    #leaves = find_by(id:result)
    # where(id: result)
  end
end
