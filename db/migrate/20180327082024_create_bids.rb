class CreateBids < ActiveRecord::Migration[5.1]
  def change
    create_table :bids do |t|
    	t.references :project
    	t.references :user
      t.timestamps
    end
  end
end
