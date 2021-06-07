class DealTeamsUser < ActiveRecord::Base
    belongs_to :user
    belongs_to :deal_team
end 