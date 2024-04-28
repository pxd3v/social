class MakeMentionsUnique < ActiveRecord::Migration[7.1]
  def change
    add_index :mentions, [:user_id, :post_id], unique: true
  end
end
