class DealTeam < ActiveRecord::Base
    has_one :deal
    has_many :users
end 