class User <ActiveRecord::Base
    has_secure_password
    belongs_to :title
    has_many :deal_teams_users
    has_many :deal_teams, through: :deal_teams_users
    has_many :deals, through: :deal_teams

    validates :email,
        :presence => {:message => " can't be blank." },
        :uniqueness => {:message => " already exists in the system."}
end 