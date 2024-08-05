class Api::V1::ShiftTotalsSerializer < ActiveModel::Serializer
  attributes :totals_by_users,
             :shifts_by_days

  def totals_by_users
    object.group_by(&:user_id).map do |user_id, shifts|
      user = User.find(user_id) unless user_id.nil?

      {
        name: user_id.nil? ? 'Sin asignar' : user.full_name,
        total: shifts.size,
        color: user_id.nil? ? nil : "##{user.color}"
      }
    end
  end

  def shifts_by_days
    object.group_by(&:date).map do |day, shifts|
      {
        day: day,
        shifts: shifts.map { |shift| Api::V1::ShiftSerializer.new(shift) }
      }
    end
  end
end
