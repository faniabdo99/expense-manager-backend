class Blog < ApplicationRecord
    validates :title, presence: {message: "You must enter a title"} , length: {minimum: 5, too_short: 'Your title is too short', maximum: 255, too_long: 'Your title is too long'}
    validates :slug, presence: {message: "You must enter a slug"}, uniqueness: {messgae: 'This slug is already been taken'} , length: {minimum: 5, too_short: 'Your slug is too short', maximum: 255, too_long: 'Your slug is too long'}
    validates :description, presence: {message: "You must enter a description"}, length: {minimum: 5, too_short: 'Your description is too short', maximum: 255, too_long: 'Your description is too long'}
    validates :article, presence: {message: "You must enter a article"}, length: {minimum: 15, too_short: 'Your article is too short'}
end
