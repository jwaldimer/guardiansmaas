class Api::V1::ServicesController < ApplicationController
  def index
    services = Service.all

    render_response(services, Api::V1::ServiceSerializer)
  end
end
