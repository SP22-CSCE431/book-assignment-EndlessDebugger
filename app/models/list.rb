class List < ApplicationRecord
    validates :user_id, :book_id presence: true
end
