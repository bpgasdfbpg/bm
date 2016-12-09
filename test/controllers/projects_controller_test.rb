require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
	
	def setup
		session[:user_id] = projects(:one).user_id
	end
	
  test "should get new" do
    get :new
    
	assert_not_nil assigns(:project)
	assert_response :success
	assert_template :new
  end
  
  test 'show a project' do
		get :show, params: { id: projects(:one).id }
    
		assert_response :success
		assert_template :show
	end
  
  test 'create saves a project to the database' do             
		assert_difference 'Project.count', 1 do    
			post :create, params: { project: { name: "Project 1", description: "My first project", date: "4/1/2017", time: "12:00 AM", volunteer_count: '0', volunteers_needed: '1', user_id: '1' } }
		end
	end
	
	test 'create redirects to show' do
		post :create, params: { project: { name: "Project 1", description: "My first project", date: "4/1/2017", time: "12:00 AM", volunteer_count: '0', volunteers_needed: '1', user_id: '1' } }
    
		created_project = Project.last                     
    
		assert_redirected_to "/projects/#{created_project.id}"
		assert_equal "New Project Created!", flash[:success]
	end
	
	test 'create invalid project should render new' do
		post :create, params: { project: { name: "", description: "My first project", date: "4/1/2017", time: "12:00 AM", volunteer_count: '0', volunteers_needed: '1', user_id: '1' } }
    
		assert_equal "Project create failed", flash.now[:danger]
		assert_not_nil assigns(:project).errors
		assert_response :success
		assert_template :new    
	end
	
	test 'volunteer creates a new ProjectVolunteer in the database' do             
		assert_difference 'ProjectVolunteer.count', 1 do    
			get :volunteer, params: { project_id: projects(:one).id, user_id: projects(:one).user_id }
		end
	end
  
end