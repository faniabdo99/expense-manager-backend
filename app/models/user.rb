class User < ApplicationRecord
    validates :name, presence: {message: "You must enter a name"} , length: {minimum: 5, too_short: 'Your name is too short', maximum: 255, too_long: 'Your name is too long'}
    validates :email, presence: {message: "You must enter an email"}, uniqueness: {message: "This email is already taken"}, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :password, presence: {message: "You must enter a password"} , length: {minimum: 5, too_short: 'Your password is too short', maximum: 255, too_long: 'Your password is too long'}
end
