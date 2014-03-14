class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :patient_id
      t.integer :person_id
      t.string :title
      t.text :body
      t.integer :level
      t.datetime :reg_date

      t.timestamps
    end
  end
end
