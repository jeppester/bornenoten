class CreateChildren < ActiveRecord::Migration[5.1]
  def change
    create_table :children do |t|
      t.string :name, default: '', null: false
      t.date :date_of_birth
      t.text :goals, default: '', null: false
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
