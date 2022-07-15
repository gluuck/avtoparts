class Report < ApplicationRecord
  
  has_many :order_reports, dependent: :destroy
  has_many :orders, through: :order_reports

end
