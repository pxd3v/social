class AddReplyFlagToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :is_a_reply, :boolean,  null: true
  end
end
