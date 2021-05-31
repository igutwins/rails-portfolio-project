class AddDealTeamRefToDeals < ActiveRecord::Migration[6.0]
  def change
    add_reference :deals, :deal_team, null: false, foreign_key: true
  end
end
