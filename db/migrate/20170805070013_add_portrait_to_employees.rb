class AddPortraitToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :portrait, :string, default: '', null: false
  end
end
