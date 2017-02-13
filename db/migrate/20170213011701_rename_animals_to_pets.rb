class RenameAnimalsToPets < ActiveRecord::Migration[5.0]
  def change
    rename_table :animals, :pets
  end
end
