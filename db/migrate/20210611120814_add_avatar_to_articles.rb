class AddAvatarToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :avatar, :string
  end
end
