class ShiftAssigner
  def initialize(service_id, week_id)
    @shifts = Shift.where(week_id: week_id, service_id: service_id)
    @availabilities = Availability.joins(:shift).where(shifts: { week_id: week_id, service_id: service_id })
    @user_hours = Hash.new(0)
    @assigned_shifts = {}
  end

  def assign_shifts
    @shifts.each do |shift|
      available_users = @availabilities.where(shift_id: shift.id).pluck(:user_id)
      next if available_users.empty?

      user_to_assign = select_user(available_users)
      assign_shift_to_user(shift, user_to_assign)
    end

    @assigned_shifts
  end

  private

  def select_user(available_users)
    # Find the user with the least hours worked
    least_hours_user = available_users.min_by { |user_id| @user_hours[user_id] }

    # Ensure that we minimize shift changes by checking if the least hours user has the previous shift
    previous_shift_user = @assigned_shifts[@shifts.last.id] if @shifts.last
    if previous_shift_user && available_users.include?(previous_shift_user)
      return previous_shift_user if @user_hours[previous_shift_user] <= @user_hours[least_hours_user]
    end

    least_hours_user
  end

  def assign_shift_to_user(shift, user_id)
    shift.update(user_id: user_id, status: :assigned)
    @user_hours[user_id] += (shift.end - shift.start) / 1.hour
    @assigned_shifts[shift.id] = user_id
  end
end
