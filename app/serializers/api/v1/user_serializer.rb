class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :name,
             :color

  def name
    object.full_name    
  end
end
