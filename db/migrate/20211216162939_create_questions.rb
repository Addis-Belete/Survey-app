class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :typeOf_question
      t.string :question
      t.string :choice

      t.timestamps
    end
  end
end
