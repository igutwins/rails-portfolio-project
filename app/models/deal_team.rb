class DealTeam < ActiveRecord::Base
    has_many :deal_teams_users
    has_many :users, through: :deal_teams_users
    has_one :deal

end 