require 'spec_helper'

describe Location do
  it "is valid with a long, lat, message, pic, name, user_id" do
		expect(build(:location)).to be_valid
	end
	it "is invalid without a lng" do
		expect(build(:location, lng: nil)).to have(1).errors_on(:lng)
	end
	it "is invalid without a lat" do
  	expect(build(:location, lat: nil)).to have(1).errors_on(:lat)
  end
	it "is invalid without a message" do
		expect(build(:location, message: nil)).to have(1).errors_on(:message)
	end
	it "is invalid without a pic" do
		expect(build(:location, pic: nil)).to have(1).errors_on(:pic)
	end
	it "is invalid without a name" do
		expect(build(:location, name: nil)).to have(1).errors_on(:name)
	end
	it "is invalid without a user_id" do
		expect(build(:location, user_id: nil)).to have(1).errors_on(:user_id)
	end
end
