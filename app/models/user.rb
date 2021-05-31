class User <ActiveRecord::Base
    has_many :deals

    validates :email, :presence => true
    #validates :email, :unique => true

end 