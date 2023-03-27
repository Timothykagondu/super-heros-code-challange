class Power < ApplicationRecord

# `description` must be present and at least 20 characters long

    validates :description, length: {minimum: 20} 
     
    has_many :hero_powers
    has_many :powers, through: :hero_powers

end
