class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.text :content
      t.string :title
      t.string :image_name

      t.timestamps
    end
  end
end
