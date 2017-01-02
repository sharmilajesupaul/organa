require 'rails_helper'
require 'spec_helper'

RSpec.describe HomeController, type: :controller do

	before do
		@request.env['devise.mapping'] = Devise.mappings[:user]
	end

  it "should redirect to login if current_user is unauthorized" do
  	sign_in nil
    get :index
    expect(response.status).to eq(302)
    expect(response).to redirect_to("/users/sign_in")
  end

  it "should redirect to login if current_user is authorized" do
		sign_in @user
		print @user
    get :index
    expect(response.status).to eq(200)
    sign_out @user
  end
end
