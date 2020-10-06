class AddImageLocationToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image_location, :string, null: false, default: ""
  end
end
