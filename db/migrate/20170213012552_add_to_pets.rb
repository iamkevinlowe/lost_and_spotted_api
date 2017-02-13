class AddToPets < ActiveRecord::Migration[5.0]
  def change
    change_table :pets do |t|
      t.integer :pet_type
      t.integer :size
      t.integer :hair_length
      t.boolean :licensed
    end
  end
end
