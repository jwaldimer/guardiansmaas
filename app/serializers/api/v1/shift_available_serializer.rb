class Api::V1::ShiftAvailableSerializer < ActiveModel::Serializer
  attributes :id,
             :start,
             :end,
             :status,
             :is_available

  def is_available
    @instance_options[:is_available]
  end
end
