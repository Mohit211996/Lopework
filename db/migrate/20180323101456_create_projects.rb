class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
    	t.string :name
    	t.references :technology
    	t.references :user
    	t.references :project_status
    	t.text :requirement
    	t.integer :budget
    	t.integer :time

      t.timestamps
    end
  end
end
