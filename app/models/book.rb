class Book < ApplicationRecord
    validates :title, :date, :author, :price, presence: true
end
