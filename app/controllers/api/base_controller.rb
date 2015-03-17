class Api::BaseController < ApplicationController
	
	before_filter :access_token, if: :filter_controller
	
	private

	def filter_controller
		(self.class.to_s != "Api::V1::UsersController")
	end
	
	def access_token
		if params[:token].present?
			@user = User.find_by_device_token(params[:token])
			unless @user.present?
				render json: {error: "token didn't found"}, status: :unauthorized	
			end
		else
			render json: {error: 'unauthorized'}, status: :unauthorized
		end	
	end
end