class ApplicationController < ActionController::API

  private

  def render_response(data, serializer, message = '', status = :ok)
    http_status = Rack::Utils.status_code(status)
    render json: {
      status: {
        code: http_status,
        message: message
      },
      data: serializer.new(data)
    },
    status: http_status
  end
end
