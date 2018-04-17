class CreateConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :connections do |t|
    	t.references :user,index: true, foreign_key: true
    	t.integer :startup_id
      t.timestamps
    end
  end
end
