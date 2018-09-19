class User < ApplicationRecord
    has_many :stories
    has_secure_password 
    validates :username, presence: true, uniqueness: true
end
