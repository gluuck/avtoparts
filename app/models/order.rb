class Order < ApplicationRecord
  belongs_to :customer
  has_many :services, dependent: :destroy
  has_one :executor
  belongs_to :category

  validates :category, presence: true
end
