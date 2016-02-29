class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.references :user
      t.string :charity
      t.text :description
      t.date :date
      t.time :time
      t.integer :no_vols
      t.string :location

      t.timestamps null: false
    end
  end
end
