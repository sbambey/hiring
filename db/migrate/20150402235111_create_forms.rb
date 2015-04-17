class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.boolean :first_name
      t.boolean :middle_name
      t.boolean :last_name
      t.boolean :home_phone
      t.boolean :cell_phone
      t.integer :posting_id

      t.timestamps null: false
    end
  end
end
