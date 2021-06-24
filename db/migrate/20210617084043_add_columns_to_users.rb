class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :industry, :string
    add_column :posts, :eb, :string
    add_column :posts, :day, :string
    add_column :posts, :place, :string
    add_column :posts, :conditions, :string
    add_column :posts, :ng, :string
    add_column :posts, :self_pr, :string
  end
end
