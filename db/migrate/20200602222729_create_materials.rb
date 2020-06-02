class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :title
      t.string :author
      t.integer :category
      t.text :path
      t.text :note
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
