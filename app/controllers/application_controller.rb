class ApplicationController < ActionController::API

  private

  def render_response(data, serializer, message = 'Data returned successfully', status = :ok)
    http_status = Rack::Utils.status_code(status)
    data_serialized = data.is_a?(ActiveRecord::Relation) ? data.map { |object| serializer.new(object)} : serializer.new(data)

    render json: {
      status: {
        code: http_status,
        message: message
      },
      data: data_serialized
    },
    status: http_status
  end
end
