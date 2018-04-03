class CreateStartupStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :startup_statuses do |t|
    	t.string :startup_status
      t.timestamps
    end
  end
end
		