class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :parent, foreign_key: { to_table: :categories }
      t.integer :child_count, default: 0
      t.timestamps
    end
  end
end
