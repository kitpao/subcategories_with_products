class CreateSelfJoins < ActiveRecord::Migration[6.1]
  def change
    create_table :self_joins do |t|

      t.timestamps
    end
  end
end
