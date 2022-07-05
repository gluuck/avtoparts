class Order < ApplicationRecord
  belongs_to :customer
  has_many :services
  has_one :executor
  has_one :category
end
