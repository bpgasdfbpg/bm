require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user       = users(:michael)
    @other_user = users(:archer)
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end
  
  test 'index page should display All Users' do
		log_in_as(@user)
		get users_path
		assert_response :success
		assert @response.body.include? ('All users')
		assert @response.body.include? ('John Doe')
	end
end