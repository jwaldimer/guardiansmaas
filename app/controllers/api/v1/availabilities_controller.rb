class Api::V1::AvailabilitiesController < ApplicationController
  before_action :authenticate_user!
  
  load_and_authorize_resource
  check_authorization

  def index
    service_id = params[:service_id]
    week_id = params[:week_id]

    shifts = Shift.where(service_id: service_id, week_id: week_id)
    shifts_ids = shifts.pluck(:id)
    availabilities = current_user.availabilities.where(shift_id: shifts_ids)

    data = {
      shifts: shifts,
      availabilities: availabilities,
      user: current_user
    }

    render_response(data, Api::V1::AvailabiltiesShiftsSerializer)    
  end

  def create
    shifts_ids = params[:shifts_ids]
    service_id = params[:service_id]
    week_id = params[:week_id]

    shifts_old_ids = Shift.where(service_id: service_id, week_id: week_id).pluck(:id)

    current_user.availabilities.where(shift_id: shifts_old_ids).destroy_all

    availabilities = shifts_ids.map { |shift_id|  { shift_id: shift_id } }

    @resources = current_user.availabilities.create(availabilities)

    return render_error('Error al crear las disponibilidades') if exists_any_error

    assign_shifts_to_users_availables(service_id, week_id)

    render_message('Disponibilidades registradas exitosamente.', :created)
  end

  private

  def assign_shifts_to_users_availables(service_id, week_id)
    assigner = ShiftAssigner.new(service_id, week_id)

    assigner.assign_shifts
  end

  def exists_any_error
    @resources.any? { |resource| resource.errors.present? }
  end

end
