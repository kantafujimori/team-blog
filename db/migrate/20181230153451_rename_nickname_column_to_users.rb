class RenameNicknameColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :nickname, :name
  end
end
