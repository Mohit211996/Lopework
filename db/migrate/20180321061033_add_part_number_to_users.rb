class AddPartNumberToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :company_name, :string
  	add_column :users, :experience, :integer
  	add_column :users, :role_id, :integer
  	add_column :users, :approval_id, :integer
  end
end
