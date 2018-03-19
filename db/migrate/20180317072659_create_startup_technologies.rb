class CreateStartupTechnologies < ActiveRecord::Migration[5.1]
  def change
    create_table :startup_technologies do |t|

    	t.references :user, foreign_key: true
    	t.references :technology, foreign_key: true

      t.timestamps
    end
  end
end
