class AddPartNumberToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :company_name, :string
  	add_column :users, :experience, :string
  end
end
