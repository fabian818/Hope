class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :visit_id
      t.text :description
      t.date :reg_date

      t.timestamps
    end
  end
end
