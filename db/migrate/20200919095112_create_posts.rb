class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :impressions, null: false
      t.integer :user_id, null: false
      t.integer :budget, null: false, default: 0
      t.integer :place, null: false, default: 0
      t.string :image, null: false, default: 0
      t.string :title, null: false
      t.float :latitude
      t.float :longitude
      t.string :address, null: false
      t.timestamps
    end
  end
end
