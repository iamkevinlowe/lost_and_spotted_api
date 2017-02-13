class RenameCommentsReference < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :animal_id, :pet_id
  end
end
