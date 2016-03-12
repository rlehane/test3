class AddCharityDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :charity_name, :string
    add_column :users, :phone, :integer
    add_column :users, :tax_number, :integer
  end
end
