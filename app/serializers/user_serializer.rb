class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :emojis
end
