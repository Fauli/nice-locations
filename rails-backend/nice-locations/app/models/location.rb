class Location < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true # , length: { minimum: 10 }
    validates :category, presence: true
    validates :url, presence: true
    validates :img_url, presence: true
    validates :author, presence: true
end
