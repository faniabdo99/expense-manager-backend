class ContactRequest < ApplicationRecord
    validates :name, presence: {message: "You must enter a name"} , length: {minimum: 5, too_short: 'Your name is too short', maximum: 255, too_long: 'Your name is too long'}
    validates :email, presence: {message: "You must enter an email"}, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :message, presence: {message: "You must enter a messgae"} , length: {minimum: 5, too_short: 'Your message is too short'}
end
