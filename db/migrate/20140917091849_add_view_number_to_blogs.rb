class AddViewNumberToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :view_number, :integer,default: 0
  end
end
