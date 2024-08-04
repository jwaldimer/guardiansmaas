class Api::V1::ShiftSerializer < ActiveModel::Serializer
  attributes :id,
             :start,
             :end,
             :status,
             :user_name,
             :user_color

  def user_name
    object.user&.full_name
  end
  
  def user_color
    object.user&.color
  end
end
