class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.text :label
      t.string :field_class
      t.text :placeholder
      t.boolean :exists
      t.integer :category_id
      t.boolean :new_line

      t.timestamps null: false
    end
  end
end
