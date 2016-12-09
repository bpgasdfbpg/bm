class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :date
      t.string :time
      t.integer :volunteer_count
      t.integer :volunteers_needed

      t.timestamps
    end
  end
end
