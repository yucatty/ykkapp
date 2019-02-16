class RenameTytleColumnToTweets < ActiveRecord::Migration[5.2]
  def change
    rename_column :tweets, :tytle, :title
  end
end
