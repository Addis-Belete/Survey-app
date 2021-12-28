class Question < ApplicationRecord
  validates :question_title, :question_type, presence: true
  belongs_to :survey
end
