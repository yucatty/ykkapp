class AddTitleToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :tytle, :string
  end
end
