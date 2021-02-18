class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.text :contents
      t.integer :tweet_id
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
