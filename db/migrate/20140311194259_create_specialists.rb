class CreateSpecialists < ActiveRecord::Migration
  def change
    create_table :specialists do |t|
      t.integer :person_id
      t.string :speciality
      t.string :shift

      t.timestamps
    end
  end
end
