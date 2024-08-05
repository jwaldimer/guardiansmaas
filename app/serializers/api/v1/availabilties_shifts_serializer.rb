class Api::V1::AvailabiltiesShiftsSerializer < ActiveModel::Serializer
  attributes :user,
             :availability_per_shifts

  def user
    user = object[:user]
    
    Api::V1::UserSerializer.new(user)
  end

  def availability_per_shifts
    shifts = object[:shifts]
    availabilities = object[:availabilties] || []

    shifts.group_by(&:date).map do |day, shifts|
      {
        day: day,
        shifts: shifts.map { |shift|
          is_available = availabilities&.any? { |item| item.shift_id === shift.id }

          Api::V1::ShiftAvailableSerializer.new(shift, is_available: is_available)
        }
      }
    end
  end
end
