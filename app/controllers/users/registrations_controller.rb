class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    resource.save

    return render_error('Error al intentar registrar el usuario') unless resource.persisted?

    render_response(resource, UserSessionSerializer, 'Usuario registrado exitosamente.', :created)
  end

  private

  def sign_up_params
    params.require(:user).permit(
      :name,
      :last_name,
      :email,
      :password
    )
  end
end
