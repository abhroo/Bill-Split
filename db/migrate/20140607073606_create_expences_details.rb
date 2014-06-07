class CreateExpencesDetails < ActiveRecord::Migration
  def change
    create_table :expences_details do |t|
      t.integer :expence_id
      t.integer :user_id
      t.float :amount

      t.timestamps
    end
  end
end
