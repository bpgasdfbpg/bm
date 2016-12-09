require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
	
	# def setup
		# session[:user_id] = users(:one).id
	# end
	
  test "should get new" do
    get :new
    
	assert_response :success
	assert_template :new
  end
	
	test 'create session fails' do
		post :create, params: { session: { email: users(:one).email , password: 'password'} }
		
		assert_equal 'Invalid email/password combination', flash.now[:danger]
		assert_response :success
		assert_template :new  
	end
	
	# test 'create invalid project should render new' do
		# post :create, params: { project: { name: "", description: "My first project", date: "4/1/2017", time: "12:00 AM", volunteer_count: '0', volunteers_needed: '1', user_id: '1' } }
    
		# assert_equal "Project create failed", flash.now[:danger]
		# assert_not_nil assigns(:project).errors
		# assert_response :success
		# assert_template :new    
	# end
  
end