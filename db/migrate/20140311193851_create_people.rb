class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :login
      t.string :password
      t.string :dni
      t.string :name
      t.string :paternal_last
      t.string :maternal_last
      t.integer :years
      t.string :sex
      t.string :address
      t.date :date_birth
      t.integer :permission
      t.boolean :state

      t.timestamps
    end
  end
end
