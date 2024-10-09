class Question < ApplicationRecord
  belongs_to :test

  has_many :ansewrs, dependent: :destroy, invere_of: :question

  validetes :body, presence: true

end
