class UserSessionSerializer < ActiveModel::Serializer
  attributes :id,
             :email,
             :name,
             :last_name,
             :jti,
             :color
end
