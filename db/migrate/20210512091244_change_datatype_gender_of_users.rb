class ChangeDatatypeGenderOfUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :gender, :integer
  end
end
