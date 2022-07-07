class Category < ApplicationRecord
  has_many :orders
  enum type: {soft: 0, medium: 1, hard: 2}
end
