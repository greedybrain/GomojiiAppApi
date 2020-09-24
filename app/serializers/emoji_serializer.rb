class EmojiSerializer
  include FastJsonapi::ObjectSerializer
  attributes :slug, :character, :user_favorites  
end
