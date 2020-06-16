class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :start, null: false
      t.string :end, null: false
      t.text :content
      t.integer :status, null: false, default: 0
      t.references :material, foreign_key: true
      t.timestamps
    end
  end
end