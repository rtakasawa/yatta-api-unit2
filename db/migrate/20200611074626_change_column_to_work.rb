class ChangeColumnToWork < ActiveRecord::Migration[5.2]
  def up
    add_column :works, :do_on, :date, null: false, default: Date.new
    change_column_default :works, :do_on, nil
    remove_column :works, :status, :integer
  end

  def down
    remove_column :works, :do_on
    add_column :works, :status, :integer
  end
end
