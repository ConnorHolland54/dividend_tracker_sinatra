class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.string :description
      t.string :dividend_per_share
      t.string :dividend_date
      t.string :ex_dividend_date
      t.integer :shares
      t.integer :user_id
    end
  end
end
