class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :executor, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
