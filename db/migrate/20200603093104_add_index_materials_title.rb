class AddIndexMaterialsTitle < ActiveRecord::Migration[5.2]
  def change
    add_index :materials, :title
  end
end