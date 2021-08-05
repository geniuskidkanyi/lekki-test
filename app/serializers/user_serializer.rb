class UserSerializer
  include JSONAPI::Serializer
  attributes :email
  attributes :user_status
end
