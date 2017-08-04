class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.references :child, foreign_key: true
      t.text :content, default: '', null: false

      t.timestamps
    end
  end
end
