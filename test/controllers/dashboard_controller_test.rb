require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
	
  
  test 'show dashboard' do
		get :show, params: { id: users(:one).id  }
    
		assert_response :success
		assert_template :show
	end
  
end