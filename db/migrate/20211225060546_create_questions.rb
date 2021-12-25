class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.srting :survey_title
      t.string :question
      t.user :reference

      t.timestamps
    end
  end
end
