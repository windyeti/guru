class User < ApplicationRecord
  has_many :created_tests, class_name: "Test"

  has_many :tests_users
  has_many :tests, through: :tests_users

  validates :email, format: { with: /[a-z0-9A-Z]+@[a-z0-9A-Z]{2,}\.[a-z0-9A-Z]{2,3}/}

  def list_test_user(level)
    tests.where(level: level)
    # Test
    #   .joins("JOIN tests_users ON tests_users.test_id = tests.id")
    #   .where("tests.level = ? AND tests_users.user_id = ?", level, id)
  end
end
