class AddCulumnsToPosts < ActiveRecord::Migration[6.0]
  add_column :posts, :friend2, :integer
  
  add_column :posts, :friend3, :integer
  
  add_column :posts, :friend4, :integer
end
