class UserSessionSerializer < ActiveModel::Serializer
  attributes :id,
             :email,
             :jti
end
