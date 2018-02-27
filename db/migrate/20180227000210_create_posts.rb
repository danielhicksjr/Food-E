class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :posts
      t.string :image
      t.string :belongs_to

      t.timestamps
    end
  end
end
