require 'rails_helper'
require 'spec_helper'

RSpec.describe HomeController, type: :controller do

	before do
		@request.env['devise.mapping'] = Devise.mappings[:user]
		@user = FactoryGirl.create :user
	end

  it "should redirect to login if current_user is unauthorized" do
    get :index
    expect(response).to redirect_to("/users/sign_in")
  end

  it "should redirect to login if current_user is authorized" do
		sign_in @user
    get :index
    expect(response.status).to eq(200)
    sign_out @user
  end
end
