class AddIndustryRefToDeals < ActiveRecord::Migration[6.0]
  def change
    add_reference :deals, :industry, null: false, foreign_key: true
  end
end
