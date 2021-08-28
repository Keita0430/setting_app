class RemoveGenderFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :gender, :integer
  end
end
