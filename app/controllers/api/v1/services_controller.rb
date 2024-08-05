class Api::V1::ServicesController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource
  check_authorization

  def index
    services = Service.all

    render_response(services, Api::V1::ServiceSerializer)
  end
end
