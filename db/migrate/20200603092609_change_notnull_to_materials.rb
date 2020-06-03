class ChangeNotnullToMaterials < ActiveRecord::Migration[5.2]
  def change
    change_column :materials,:title, :string, null: false
    change_column :materials,:category, :integer, null: false
  end
end
