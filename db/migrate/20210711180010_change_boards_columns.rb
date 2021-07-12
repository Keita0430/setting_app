class ChangeBoardsColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :boards, :district_name, :string
    add_column :boards, :number, :string
    add_column :boards, :whatvswhat, :string
  end
end
