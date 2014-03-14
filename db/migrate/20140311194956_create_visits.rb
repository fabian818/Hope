class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :treatment_id
      t.datetime :assistance_date
      t.string :visit_type
      t.text :observation
      t.boolean :state

      t.timestamps
    end
  end
end
