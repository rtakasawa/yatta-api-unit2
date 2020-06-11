class ChangeColumnToMaterial < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :status, :integer
    remove_column :materials, :author, :string
  end
end