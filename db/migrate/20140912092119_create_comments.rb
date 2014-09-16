class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :content
      t.integer :blog_id

      t.timestamps
    end
    add_index :comments,[:blog_id,:created_at]
  end
end
