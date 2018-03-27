class AddbudgetToProjects < ActiveRecord::Migration[5.1]
  def change
  	change_column :projects, :budget, :integer, :limit => 8
  end
end
