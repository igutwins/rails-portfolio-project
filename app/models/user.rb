class User <ActiveRecord::Base
    has_secure_password
    belongs_to :title
    has_many :deal_teams_users
    has_many :deal_teams, through: :deal_teams_users
    has_many :deals, through: :deal_teams
    #has_many :industries, through: :deals

    validates :email, :presence => true
    #validates :email, :unique => true

end 