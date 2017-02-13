class RenameImagesReference < ActiveRecord::Migration[5.0]
  def change
    rename_column :images, :animal_id, :pet_id
  end
end
