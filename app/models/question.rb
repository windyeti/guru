class Question < ApplicationRecord
  belongs_to :test

  has_many :ansewrs, dependent: :destroy, inverse_of: :question

  validates :body, presence: true

end
