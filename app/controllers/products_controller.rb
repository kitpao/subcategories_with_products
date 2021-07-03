class ProductsController < ApplicationController

  def index
    @main_category = Category.find(14)
    @n_number = 3
    @randoms = display_random_products_from_branch_categories(@main_category, @n_number)
  end

  def display_random_products_from_branch_categories(category, n)
    # retrieve array of leaf categories
    leaf_cats = category.lowest_level_categories_ids
    # retrieve all the leaf categories objects with their cache for products
    cats = Category.includes(:products).find(leaf_cats)
    # Take the products of all subcategories
    all_subproducts = []
    cats.each do |cat|
      all_subproducts << cat.products.ids
    end
    all_subproducts.flatten!
    # Show n number of random products
    Product.get_subproducts(all_subproducts).ordered_randomly(n)
  end
end

# this is just a test