class AddColumnToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets,:image,:string
    add_column :tweets,:user_id,:integer
    add_column :users,:name,:string
  end
end
