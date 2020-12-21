class ProductsController < ApplicationController

  def index
    @random = display_random_products_from_branch_categories(Category.find(4), 3)
  end

  def display_random_products_from_branch_categories(category, n)
    # retrieve array of leaf categories
    leaf_cats = category.lowest_level_categories_ids
    # retrieve all the leaf categories objects with their cache for products
    cats = Category.includes(:products).find(leaf_cats)
    # Take the products of all subcategories
    all_products = []
    
    cats.each do |cat|
      all_products << cat.products
    end
    # Show n number of random products
    all_products.flatten.ordered_randomly(n)
  end
end
