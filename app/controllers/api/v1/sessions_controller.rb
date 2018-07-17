class Api::V1::SessionsController < Api::V1::ApiController
	skip_before_filter  :verify_authenticity_token
  before_action :authenticate!, only: [:destroy]

  def create
    email = params[:user][:email] rescue ""
    password = params[:user][:password] rescue ""

    if email.nil? && password.nil?
      render json: {status: 401, message: "The request must contain the user email and password."}
      return
    end

    @user = User.find_by_email(email.downcase)

    if @user.blank?
      logger.info("User #{email} failed signin, user cannot be found.")
      render json: {status: 401, message: "Invalid email or password."}
      return
    end
       if not @user.valid_password?(password)
      logger.info("User #{email} failed signin, password is invalid")
      render json: {status: 401, message: "Invalid email or password."}
    else
      sign_in("user", @user)
   
      render json: {status: 200, user: @user, user_token: @user.authentication_token}
    end
  end

  def destroy     
    if  current_user.update_attributes(authentication_token: nil)
      render json: {status: 200, message: "Success"}
      return
    else
      render json: {status: 401, message: "0"}
      return
    end
  end
end
