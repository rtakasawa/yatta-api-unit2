class RenameEndColumToWorks < ActiveRecord::Migration[5.2]
  def change
    rename_column :works, :end, :finish
  end
end
