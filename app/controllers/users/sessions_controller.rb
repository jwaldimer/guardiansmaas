class Users::SessionsController < Devise::SessionsController  
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render_response(resource, UserSessionSerializer, 'Logged in sucessfully.', :created)
  end

  def register_failed
    render json: { message: "Something went wrong." }
  end
end
