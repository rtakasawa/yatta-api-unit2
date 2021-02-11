class AddColumnWorks < ActiveRecord::Migration[5.2]
  def up
    add_column :works, :status, :integer, null: false, default: 0
  end
  def down
    remove_column :works, :status, :integer, null: false, default: 0
  end
end
