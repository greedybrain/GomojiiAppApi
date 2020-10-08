class AddColumnsToEmojis < ActiveRecord::Migration[6.0]
  def change
    add_column :emojis, :unicodeName, :string
    add_column :emojis, :codePoint, :string
    add_column :emojis, :group, :string
    add_column :emojis, :subGroup, :string
  end
end


