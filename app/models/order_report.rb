class OrderReport < ApplicationRecord
  belongs_to :order
  belongs_to :report
end
