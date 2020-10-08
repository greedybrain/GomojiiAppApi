class EmojiSerializer
  include FastJsonapi::ObjectSerializer
  attributes :slug, :character, :unicodeName, :codePoint, :group, :subGroup, :variants, :user_favorites  
end
