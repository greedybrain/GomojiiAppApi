class AddUserIdToEmoji < ActiveRecord::Migration[6.0]
  def change
    add_column :emojis, :user_id, :integer
  end
end
