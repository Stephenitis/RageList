class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name, :description, :key
      t.integer :price
      t.timestamps
      t.references :category
    end
  end
end
