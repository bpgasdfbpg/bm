class CreateProjectVolunteers < ActiveRecord::Migration[5.0]
  def change
    create_table :project_volunteers do |t|

      t.timestamps
    end
  end
end
