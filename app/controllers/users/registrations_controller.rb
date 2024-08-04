class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    resource.save
    render_response(resource, UserSessionSerializer, 'Signed up sucessfully.', :created)
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
