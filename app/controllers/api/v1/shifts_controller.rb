class Api::V1::ShiftsController < ApplicationController
  def find
    service_id = params[:service_id]
    week_id = params[:week_id]

    shifts = Shift.where(service_id: service_id, week_id: week_id).to_a

    render_response(shifts, Api::V1::ShiftTotalsSerializer)
  end
end
