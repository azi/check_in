require 'spec_helper'

describe "Location API" do
	describe "Post location" do
		before :each do
			@user = create(:user)
			@location = attributes_for(:location)
			@post_params = {"token" => @user.device_token,"locations" => @location} 
		end
		context "with valid attributes" do
			it "saves the new location in the database" do
				
				expect{
					post api_v1_locations_path, @post_params
				}.to change(Location, :count).by(1)
				
				expect(response.status).to eq 201

			end
		end
		context "with invalid attributes" do
			it "does not save the new location in the database" do
				@post_params["locations"]["latitude"] = nil
				expect{
					post api_v1_locations_path, @post_params
				}.to_not change(Location, :count)
				expect(response.status).to eq 422
			end
		end
	end
	
	describe "Edit location" do	
		before :each do
			@user = create(:user)
			@location = create(:location, user: @user)

		end
		context "valid attributes" do
			it "locates the requested @location" do
				post_params = {"token" => @user.device_token, "locations" => @location.attributes}
				patch api_v1_location_path(@location), post_params
				expect(assigns(:location)).to eq(@location)
			end
			it "changes @location's attributes" do
				@location.name = "101 商辦大樓"
				@location.message = "修改打卡點訊息測試"
				post_params = {"token" => @user.device_token, "locations" => @location.attributes}
				patch api_v1_location_path(@location), post_params
				@location.reload
				expect(@location.name).to eq("101 商辦大樓")
				expect(@location.message).to eq("修改打卡點訊息測試")
			end
		end

		context "with invalid attributes" do
	 		it "does not change the location's attributes" do
				@location.name = nil
				@location.message = "哇勒"
				post_params = {"token" => @user.device_token, "locations" => @location.attributes}
				patch api_v1_location_path(@location), post_params
				@location.reload
				expect(@location.name).to eq("101大樓")
				expect(@location.message).to_not eq("哇勒")
				expect(response.status).to eq 422
			end
		end	
	end

	describe "Delete location" do
		before :each do
			@user = create(:user)
			@location = create(:location, user:@user)
		end
		it "deletes the location" do
			post_params = {"token" => @user.device_token}	
			expect{
				delete api_v1_location_path(@location), post_params
			}.to change(Location,:count).by(-1)
			expect(response.status).to eq 204
		end
	end

	describe "Search locations" do
		before :each do
			@user = create(:user)
			@user2 = create(:user)
			@user3 = create(:user)
			@location1 = create(:location, user:@user)
			@location2 = create(:location_50, user:@user)
			@location3 = create(:location_50, user:@user2)
			@location4 = create(:location_500, user:@user2)
			@location5 = create(:location_1, user:@user2)
			@location6 = create(:location_500, user:@user3)
		end
		context "with params[:range]" do
			it "return json of locations in range" do
				post_params = {"token" => @user.device_token, 
					             "current_lat" => @location1.latitude,
					             "current_lng" => @location1.longitude, 
					             "range" => 50
					            }
        
				get search_api_v1_locations_path, post_params
				result = JSON.parse(response.body)	
				expect(result["message"].length).to eq(4)
				
			end	
		end
	end
end