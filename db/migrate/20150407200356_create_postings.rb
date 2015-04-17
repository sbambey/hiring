class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.text :title
      t.text :description
      t.integer :company_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
