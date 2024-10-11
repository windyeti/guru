class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :tests_users
  has_many :users, through: :tests_users

  has_many :questions

  scope :tests_beginer, -> { where(level: 0..1) }
  scope :tests_middle, -> { where(level: 2..4) }
  scope :tests_master, -> { where(level: 5..Float::INFITY) }

  # scope :with_category, -> (category_title) { joins(categories: {title: category_title}) }                                          }
  scope :with_category, -> (category_title) { joins(:category)
                                                      .where( categories: {title: category_title} )
                                                      .order(id: :desc)
                                                    }

  validates :title, uniqueness: { scope: :level }

  validates :level, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def self.titles_category(category_title)
      with_category
      .pluck(:title)
  end
end
