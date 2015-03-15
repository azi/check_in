class Api::V1::UsersController < Api::BaseController

	def add_device
		@user_device = User.new(user_params)
		if @user_device.save
			render json: { success: true }, status: :created
		else
			render json: { success: false, message: @user_device.errors }, status: :bad_request
		end
	end

	private

	def user_params
   	params.require(:user).permit(:nickname, :avatar, 
   		             :device_token, :device_os,:device_os_version)
 	end

end
