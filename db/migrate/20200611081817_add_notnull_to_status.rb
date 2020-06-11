class AddNotnullToStatus < ActiveRecord::Migration[5.2]
  def change
    change_column_null :materials, :status,  false, 0
  end
end