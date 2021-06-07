class AddNameToDealTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :deal_teams, :name, :string
  end
end
