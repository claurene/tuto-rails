class Article < ApplicationRecord
    has_many :commentaires
    validates :title, presence: true, length: { minimum: 5 }
end
