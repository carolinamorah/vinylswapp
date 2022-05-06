class Category < ApplicationRecord
    has_and_belongs_to_many :vinyls

    scope :all_categories, -> {where.not(id: nil)}
end
