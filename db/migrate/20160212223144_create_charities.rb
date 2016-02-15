class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :charity_name
      t.string :applicant_name
      t.text :about
      t.string :phone
      t.string :email
      t.string :tax_number
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
