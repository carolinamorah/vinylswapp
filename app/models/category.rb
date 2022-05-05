class Category < ApplicationRecord
    has_and_belongs_to_many :categories

    scope :all_categories, -> {where.not(id: nil)}
end
