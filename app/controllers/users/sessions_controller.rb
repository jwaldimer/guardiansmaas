class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render_response(resource, UserSessionSerializer, 'Inicio de sesión exitoso.', :created)
  end

  def respond_to_on_destroy
    head :no_content    
  end

  def register_failed
    render_error
  end
end
