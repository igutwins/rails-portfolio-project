class User <ActiveRecord::Base
    has_secure_password
    has_many :deals

    validates :email, :presence => true
    #validates :email, :unique => true

end 