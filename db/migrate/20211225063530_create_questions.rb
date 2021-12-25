class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :question_title
      t.string :question_type
      t.text :choices, array: true, default: []
      t.references :survey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
