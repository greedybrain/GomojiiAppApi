class AddArrayToEmojis < ActiveRecord::Migration[6.0]
  def change
    add_column :emojis, :variants, :text
  end
end
