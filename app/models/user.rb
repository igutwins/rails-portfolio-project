class User <ActiveRecord::Base
    has_secure_password
    has_many :deals, through: :deal_teams
    has_many :industries, through: :deals
    belongs_to :title

    validates :email, :presence => true
    #validates :email, :unique => true

end 