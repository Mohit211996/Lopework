class CreateStartupProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :startup_projects do |t|
    	t.references :project,index: true, foreign_key: true
    	t.references :user,index: true, foreign_key: true
      t.timestamps
    end
  end
end
