class Api::V1::UsersController < Api::V1::ApiController
  before_filter :authenticate!
  skip_before_filter :verify_authenticity_token

  def index
    @users = User.all
    render json: { users: @users, total_count: User.count }
  end

  # POST http://localhost:3000/api/v1/change_profile
  def change_profile
    email = params[:user][:email] rescue ""
    password = params[:user][:password] rescue ""

    if email.nil? && password.nil?
      render json: {status: 401, message: "The request must contain the user email and password."}
      return
    end

    if current_user.update(user_params)
      render json: current_user.as_json(user_id: current_user.id, email: current_user.email, user_token: current_user.authentication_token), status: 200
    else
      render json: current_user.errors.full_messages, status: 401
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
