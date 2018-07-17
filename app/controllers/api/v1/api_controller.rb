class Api::V1::ApiController < ApplicationController
  respond_to :json
  helper_method :current_user

  def current_user
    @current_user ||= User.where(authentication_token: params[:user_token]).first
  end

  # Authenticate user
  def authenticate!
    if params[:user_token].blank?
    	render json: { error: '401 Unauthorized!' }, status: 401
    else
    	render json: { error: '401 Unauthorized!' }, status: 401 unless current_user
    end
  end
end
