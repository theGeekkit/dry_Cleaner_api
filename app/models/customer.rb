class Customer < ApplicationRecord
    has_many :tickets, dependent: :destroy
end
