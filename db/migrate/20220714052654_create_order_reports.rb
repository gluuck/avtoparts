class CreateOrderReports < ActiveRecord::Migration[6.0]
  def change
    create_table :order_reports do |t|
      t.references :order, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
