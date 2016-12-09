class AddUserRefToProjectVolunteer < ActiveRecord::Migration[5.0]
  def change
    add_reference :project_volunteers, :user, foreign_key: true
  end
end
