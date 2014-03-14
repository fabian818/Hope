class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :person_id
      t.string :title
      t.text :body
      t.date :reg_date

      t.timestamps
    end
  end
end
