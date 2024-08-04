class Api::V1::ShiftTotalsSerializer < ActiveModel::Serializer
  attributes :totals_by_users,
             :shift_by_days

  def totals_by_users
    users = User.all

    users.map do |user|
      {
        name: user.full_name,
        total: object.select { |shift| shift.user_id == user.id }.size,
        color: user.color
      }
    end
  end

  def shift_by_days
    object.group_by(&:date).map do |day, shifts|
      {
        day: day,
        shifts: shifts.map { |shift| Api::V1::ShiftSerializer.new(shift) }
      }
    end
  end
end
