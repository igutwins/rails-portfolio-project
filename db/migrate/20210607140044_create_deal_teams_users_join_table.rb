class CreateDealTeamsUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :deal_teams
  end
end
