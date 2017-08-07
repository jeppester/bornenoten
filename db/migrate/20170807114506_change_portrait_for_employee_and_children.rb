class ChangePortraitForEmployeeAndChildren < ActiveRecord::Migration[5.1]
  def up
    change_column :employees, :portrait, :string, default: nil, null: true
    change_column :children, :portrait, :string, default: nil, null: true
  end

  def down
    change_column :employees, :portrait, :string, default: '', null: false
    change_column :children, :portrait, :string, default: '', null: false
  end
end
