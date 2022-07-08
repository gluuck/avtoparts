class Executor < ApplicationRecord
  has_many :order

  validates :name, presence: true
end
