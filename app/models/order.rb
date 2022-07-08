class Order < ApplicationRecord
  belongs_to :customer
  has_many :services, dependent: :destroy
  belongs_to :executor
  belongs_to :category

  validates :category, presence: true

  scope :hard, ->(type) {
    joins(:category)
      .where(categories: { category_type: type })}
end
