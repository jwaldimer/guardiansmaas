class Api::V1::WeeksController < ApplicationController
  def index
    weeks = Week.all.order(:number)

    render_response(weeks, Api::V1::WeekSerializer)
  end
end
