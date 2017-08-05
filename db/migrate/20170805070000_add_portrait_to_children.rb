class AddPortraitToChildren < ActiveRecord::Migration[5.1]
  def change
    add_column :children, :portrait, :string, default: '', null: false
  end
end
