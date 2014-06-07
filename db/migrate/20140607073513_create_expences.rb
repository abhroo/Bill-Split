class CreateExpences < ActiveRecord::Migration
  def change
    create_table :expences do |t|
      t.string :description
      t.integer :group_id
      t.string :location
      t.float :amount
      t.integer :user_ids, Array:true

      t.timestamps
    end
  end
end
