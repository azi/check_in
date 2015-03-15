require 'spec_helper'

describe "User API" do
	describe "Post /user/add_device" do
		it "add Device" do
			post_params = {
				"user" => build(:user)
			}
			request_headers = {
				"Accept" => "application/json",
				"Content-Type" => "application/json"
			}

			post api_v1_add_device_users_path, post_params, request_headers
			expect(resonse.status).to eq 201
		end
	end
end