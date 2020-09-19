class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text "impressions"
      t.integer "user_id"
      t.integer "budget"
      t.integer "place"
      t.string "image"
      t.string "title"
      t.string "address"
      t.float "latitude"
      t.float "longitude"
      t.timestamps
    end
  end
end
