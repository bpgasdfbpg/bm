class AddProjectRefToProjectVolunteer < ActiveRecord::Migration[5.0]
  def change
    add_reference :project_volunteers, :project, foreign_key: true
  end
end
