class ChangeDefaultToStatus < ActiveRecord::Migration[5.2]
  def change
    change_column_default :materials, :status, 0
  end
end