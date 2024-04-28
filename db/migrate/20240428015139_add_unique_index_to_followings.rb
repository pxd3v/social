class AddUniqueIndexToFollowings < ActiveRecord::Migration[7.1]
  def change
    add_index :followings, [:follower_id, :followed_id], unique: true
  end
end
