class AddImageToMessageees < ActiveRecord::Migration
  def change
    add_column :messageees, :image, :string
  end
end
