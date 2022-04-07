class Category < ApplicationRecord
    has_many :vinyls

    scope :all_categories, -> {where.not(id: nil)}
end
