class CreateInstallments < ActiveRecord::Migration[5.1]
  def change
    create_table :installments do |t|
    	t.references :bid
    	t.integer :time
    	t.text :details
    	t.integer :budget, limit: 8
      t.timestamps
    end
  end
end
