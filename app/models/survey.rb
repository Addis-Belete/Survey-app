class Survey < ApplicationRecord
  validates :survey_title, presence: true, length: { minimum: 10 }
  belongs_to :user, dependent: destroy
  has_many :question
end
