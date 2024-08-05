class Api::V1::WeeksController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource
  check_authorization

  def index
    current_week = Time.now.strftime('%-V').to_i
    weeks = Week.where(number: (current_week..52)).order(:number).limit(5)

    render_response(weeks, Api::V1::WeekSerializer)
  end
end
