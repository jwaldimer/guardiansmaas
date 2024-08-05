class ApplicationController < ActionController::API
  rescue_from CanCan::AccessDenied, with: :access_denied
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def render_data(data_serialized, message, status)
    http_status = Rack::Utils.status_code(status)

    render json: {
      status: {
        code: http_status,
        message: message
      },
      data: data_serialized
    },
    status: http_status
  end

  def render_response(data, serializer, message = 'Datos retornados exitosamente.', status = :ok)
    data_serialized = data.is_a?(ActiveRecord::Relation) ? data.map { |object| serializer.new(object)} : serializer.new(data)

    render_data(data_serialized, message, status)
  end

  def render_message(message = '', status = :ok)
    render_data(nil, message, status)
  end

  def render_error(message = 'Algo salió mal.', status = :unprocessable_entity)
    render_data(nil, message, status)
  end

  def authenticate_user!
    return if current_user

    render_message('Debes iniciar sesión para poder continuar.', :unauthorized)
  end

  def record_not_found
    render_message('Registro no encontrado.', :not_found)
  end

  def access_denied
    render_message('No tienes permisos para acceder a este recurso.', :forbidden)
  end

end
