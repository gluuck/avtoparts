class Order < ApplicationRecord
  belongs_to :customer
  has_many :services, dependent: :destroy
  belongs_to :executor
  belongs_to :category

  validates :category, presence: true
end
