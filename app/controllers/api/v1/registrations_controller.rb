class Api::V1::RegistrationsController < Api::V1::ApiController
  skip_before_filter :verify_authenticity_token

  def create
    user = User.new(user_params)

    if user.save
      render json: { status: 200, user: user, message: 'Success' }
      return
    else
      warden.custom_failure!
      render json: {status: 401, message: user.errors.full_messages}
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
