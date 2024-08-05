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
      availabilties: availabilities,
      user: current_user
    }

    render_response(data, Api::V1::AvailabiltiesShiftsSerializer)    
  end

  def create
    shifts_ids = params[shifts_ids]
    availabilities = []
    
    shifts_ids.each do |shift_id|
      availability = { user_id: 10, shift_id: shift_id }
      availabilities << availability
    end

    resources = Availability.create(availabilities)

    return render_error('Error al crear las disponibilidades') unless resource

    render_response(resources, UserSessionSerializer, 'Disponibilidades registradas exitosamente.', :created)
  end

  def update
  end
end
