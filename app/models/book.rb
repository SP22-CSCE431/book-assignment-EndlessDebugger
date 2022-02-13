class Book < ApplicationRecord
    validates :title, :date, :author, :price, presence: true
    has_many :users
end
