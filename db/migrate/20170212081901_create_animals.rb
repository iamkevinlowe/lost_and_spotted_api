class CreateAnimals < ActiveRecord::Migration[5.0]
  def change
    create_table :animals do |t|
      t.string :color
      t.boolean :found, default: false
      t.text :note

      t.timestamps
    end
  end
end
