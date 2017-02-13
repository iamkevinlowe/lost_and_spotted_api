class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.references :animal, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
