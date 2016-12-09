require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
	setup do
		@project = Project.new(name: 'Test Project', description: 'Test project.', date: '4/1/2017', time: '12:00 AM', volunteer_count: '0', volunteers_needed: '1', user_id: '2')
	end
	
	test 'project is valid' do
		assert @project.valid?
	end
	
	test 'project requires name' do
		@project.name = ''
		assert !@project.valid?
		assert_equal ["can't be blank"], @project.errors[:name]
	end
	
	test 'project requires description' do
		@project.description = ''
		assert !@project.valid?
		assert_equal ["can't be blank"], @project.errors[:description]
	end
	
	test 'project requires date' do
		@project.date = ''
		assert !@project.valid?
		assert_equal ["can't be blank"], @project.errors[:date]
	end
	
	test 'project requires time' do
		@project.time = ''
		assert !@project.valid?
		assert_equal ["can't be blank"], @project.errors[:time]
	end
	
	test 'project requires volunteer count' do
		@project.volunteer_count = ''
		assert !@project.valid?
		assert_equal ["can't be blank"], @project.errors[:volunteer_count]
	end
	
	test 'project requires volunteers needed' do
		@project.volunteers_needed = ''
		assert !@project.valid?
		assert_equal ["can't be blank"], @project.errors[:volunteers_needed]
	end
	
	test 'project requires user id' do
		@project.user_id = ''
		assert !@project.valid?
		assert_equal ["can't be blank"], @project.errors[:user_id]
	end
end
