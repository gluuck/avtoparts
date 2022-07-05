class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.references :order, null: false, foreign_key: true
      t.string :title, null: false

      t.timestamps
    end
  end
end
