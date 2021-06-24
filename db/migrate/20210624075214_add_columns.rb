class AddColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :age, :string
    add_column :users, :blood, :string
    add_column :users, :personality, :string
    add_column :users, :height, :string
    add_column :users, :body, :string
    add_column :users, :from, :string
    add_column :users, :job, :string
    add_column :users, :income, :string
    add_column :users, :ed, :string
    add_column :users, :holiday, :string
    add_column :users, :alcohol, :string
    add_column :users, :tabacco, :string
    add_column :users, :self_pr, :string
  end
end
