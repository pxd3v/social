class AddUserRefToFollowings < ActiveRecord::Migration[7.1]
  def change
    add_reference :followings, :follower, null: false, foreign_key: { to_table: :users }
    add_reference :followings, :followed, null: false, foreign_key: { to_table: :users }
  end
end