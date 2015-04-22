class CreateMessageees < ActiveRecord::Migration
  def change
    create_table :messageees do |t|
      t.string :asd

      t.timestamps
    end
  end
end
