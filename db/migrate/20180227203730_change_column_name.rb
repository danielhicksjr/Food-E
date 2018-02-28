class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
   rename_column :posts, :posts, :body
   remove_column :posts, :belongs_to
  end
end
