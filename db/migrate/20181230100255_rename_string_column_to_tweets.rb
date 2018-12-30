class RenameStringColumnToTweets < ActiveRecord::Migration[5.0]
  def change
    rename_column :tweets, :string, :image
  end
end
