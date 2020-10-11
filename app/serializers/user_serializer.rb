class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :user_favorites
end
