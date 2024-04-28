class CreateMentions < ActiveRecord::Migration[7.1]
  def change
    create_table :mentions do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
