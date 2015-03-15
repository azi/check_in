require 'spec_helper'

describe "User API" do
	describe "Post /user/add_device" do
		it "add Device" do
			post "/api/v1/users/add_device", user: FactoryGirl.attributes_for(:user) do 
				expect(response.status).to eq 201
			end
		end
	end
end