class HeroPower < ApplicationRecord
    
# `strength` must be one of the following values: 'Strong', 'Weak', 'Average'

    validates :strength, inclusion: {in: %w(Strong Weak Average)} 

    belongs_to :hero
    belongs_to :power
end
