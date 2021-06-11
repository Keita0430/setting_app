class AddDiscriptionToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :description, :string
  end
end
