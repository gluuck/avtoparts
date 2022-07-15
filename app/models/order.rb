class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :executor
  belongs_to :category
  has_many :order_reports, dependent: :destroy
  has_many :reports, through: :order_reports

  has_many :services, dependent: :destroy

  validates :category, presence: true
end
