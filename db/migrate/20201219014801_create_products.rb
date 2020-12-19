class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :pr_name
      t.references :child, foreign_key: { to_table: :categories }
      t.timestamps
    end
  end
end
