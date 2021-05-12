class RemoveContetFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :contet, :text
  end
end
