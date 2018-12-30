class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.text :text, null: false
      t.string :string
      t.timestamps
    end
  end
end
