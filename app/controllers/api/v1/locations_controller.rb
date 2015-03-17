class Api::V1::LocationsController < Api::BaseController
	skip_before_action :verify_authenticity_token
	before_filter :find_location, :only => [:update, :destroy]

	def create
		@location = Location.new(post_params)
		@location.user = @user
		if @location.save
			render json: { success: true }, status: :created
		else
			render json: { success: false, message: @location.errors }, status: :unprocessable_entity
		end
	end	

	def update
		if @location.update(post_params)
			render json: { success: true }, status: :no_content
		else
			render json: { success: false, message: @location.errors }, status: :unprocessable_entity
		end
	end

	def search
		
		@list = Location.near([search_params["current_lat"],search_params["current_lng"]],search_params["range"])
		
		if @list
			render json: { success: true, message: @list.to_a }, status: :ok
		else
			render json: { success: false, message: "search failed" }, status: :unprocessable_entity
		end
	end

	def destroy
		if @location.user == @user
    	@location.destroy
    	render json: { success: true }, status: :no_content
    else
    	render json: { success: false, message: "not owner can't delete" }, status: :unprocessable_entity
    end
	end

	private

	def find_location
		@location = Location.find(params[:id])
	end

	def post_params
   	params.require(:locations).permit(:name, :pic, :latitude, :longitude, :message)
 	end

 	def search_params
 		params.permit(:token, :current_lat, :current_lng, :range)
 	end

end
