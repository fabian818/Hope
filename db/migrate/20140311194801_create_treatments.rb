class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.integer :patient_id
      t.integer :specialist_id
      t.string :treatment_type
      t.date :start_date
      t.date :end_date
      t.text :observation

      t.timestamps
    end
  end
end
