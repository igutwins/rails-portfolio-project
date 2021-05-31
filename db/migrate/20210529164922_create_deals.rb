class CreateDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :deals do |t|
      t.string :name
      t.decimal :entry_cash
      t.decimal :interim_growth
      t.decimal :terminal_growth
      t.decimal :discount_rate
      t.decimal :npv

      t.timestamps
    end
  end
end
