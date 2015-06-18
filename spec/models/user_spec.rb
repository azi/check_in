require 'spec_helper'

describe User do

  it "is valid with a nickname, avatar, token, os, os_version" do
  	expect(build(:user)).to be_valid
  end
  it "is invalid without a nickname" do
  	expect(build(:user, nickname:nil)).to have(1).errors_on(:nickname)
  end
  it "is invalid without a avatar" do
  	expect(build(:user, avatar:nil)).to have(1).errors_on(:avatar)
  end
  it "is invalid without a device token" do
  	expect(build(:user, device_token:nil)).to have(1).errors_on(:device_token)
  end
  it "is invalid without a device os" do
  	expect(build(:user, device_os:nil)).to have(1).errors_on(:device_os)
  end
  it "is invalid without a device os version" do
  	expect(build(:user, device_os_version:nil)).to have(1).errors_on(:device_os_version)
  end
 	it "is invalid with a duplicate device token" do
 		create(:user, device_token:'550e8400-e29b-41d4-a716-446655440000')
 		user = build(:user, device_token: '550e8400-e29b-41d4-a716-446655440000')
 		expect(user).to have(1).errors_on(:device_token)
 	end
end
