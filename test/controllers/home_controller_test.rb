require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to login if current_user is unauthorized" do
    get home_index_url
    assert_redirected_to new_user_session_url
  end

end
