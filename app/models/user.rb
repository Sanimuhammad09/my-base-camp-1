class User < ApplicationRecord
    has_secure_password
    validates :First_name, :Last_name, :Email, presence: true
    #validates :password_digest, confirmation: true
    #validates :password_confirmation, presence: true
end
